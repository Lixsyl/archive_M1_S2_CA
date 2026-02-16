package com.paracamplus.ilp2.treecompiler;

import java.util.*;

import com.paracamplus.ilp1.compiler.interfaces.IOperatorEnvironment;
import com.paracamplus.ilp1.compiler.interfaces.IGlobalVariableEnvironment;
import com.paracamplus.ilp1.interfaces.IASTexpression;
import com.paracamplus.ilp1.interfaces.IASTinvocation;
import com.paracamplus.ilp1.interfaces.IASTvariable;
import com.paracamplus.ilp1.interfaces.IASTblock.IASTbinding;
import com.paracamplus.ilp2.interfaces.IASTprogram;
import com.paracamplus.ilp2.interfaces.IASTassignment;
import com.paracamplus.ilp2.interfaces.IASTloop;
import com.paracamplus.ilp2.interfaces.IASTfunctionDefinition;
import com.paracamplus.ilp2.interfaces.IASTvisitor;
import com.paracamplus.ilp1.treecompiler.interfaces.*;
import com.paracamplus.ilp1.treecompiler.tast.Type;
import com.paracamplus.ilp1.treecompiler.tast.TASTvariable;
import com.paracamplus.ilp1.treecompiler.tast.TASTblock;
import com.paracamplus.ilp1.treecompiler.tast.TASTinvocation;
import com.paracamplus.ilp1.treecompiler.TypingException;
import com.paracamplus.ilp2.treecompiler.tast.*;
import com.paracamplus.ilp2.treecompiler.interfaces.*;


public class Typer extends com.paracamplus.ilp1.treecompiler.Typer
  implements IASTvisitor<ITASTexpression, Void, TypingException> {

  public Typer(IOperatorEnvironment ioe, IGlobalVariableEnvironment igve) {
    super(ioe,igve);
  }

  public TASTprogram visit(IASTprogram iast) throws TypingException {
    TASTprogram p = visit(iast,null);
    return p;
  }

  final class FunctionKey {
    final String name;
    final List<Type> argTypes;

    FunctionKey(String name,  List<Type> argTypes){
      this.name = name;
      this.argTypes=argTypes;
    }

    @Override
    public boolean equals(Object o) {
      if (!(o instanceof FunctionKey)) return false;
      FunctionKey k = (FunctionKey) o;
      return name.equals(k.name) && argTypes.equals(k.argTypes);
    }

    @Override
    public int hashCode() {
      return Objects.hash(name, argTypes);
    }

    @Override
    public String toString() {
      StringBuilder sb = new StringBuilder();
      sb.append(name).append("(");
      for (int i = 0; i < argTypes.size(); i++) {
        sb.append(argTypes.get(i));
        if (i < argTypes.size() - 1) sb.append(", ");
      }
      sb.append(")");
      return sb.toString();
    }
  }

  // function defintions are stored as is and will be typed upon invocation
  private final Map<String, IASTfunctionDefinition> functions = new HashMap<>();
  protected Map<FunctionKey, TASTfunctionDefinition> specializations = new HashMap<>();
  protected Map<FunctionKey, Type> specializedReturnTypes = new HashMap<>();

  public void printDebugInfo() {
    System.out.println("=== Functions ===");
    for (Map.Entry<String, IASTfunctionDefinition> entry : functions.entrySet()) {
      String name = entry.getKey();
      IASTfunctionDefinition fdef = entry.getValue();
      System.out.println("Function: " + name + ", params: " +
                         Arrays.toString(fdef.getVariables()));
    }

    System.out.println("\n=== Specializations ===");
    for (Map.Entry<FunctionKey, TASTfunctionDefinition> entry : specializations.entrySet()) {
      FunctionKey key = entry.getKey();
      TASTfunctionDefinition spec = entry.getValue();
      System.out.println("Specialization: " + key.name + key.argTypes +
                         " -> mangled: " + spec.getName());
    }

    System.out.println("\n=== Specialized Return Types ===");
    for (Map.Entry<FunctionKey, Type> entry : specializedReturnTypes.entrySet()) {
      FunctionKey key = entry.getKey();
      Type retType = entry.getValue();
      System.out.println("Return type for " + key.name + key.argTypes + " -> " + retType);
    }
  }


  private String mangle(String name, Type[] types) {
    StringBuilder sb = new StringBuilder(name);
    for (Type t : types) {
      sb.append("__").append(t.name().toLowerCase());
    }
    return sb.toString();
  }

  public TASTprogram visit(IASTprogram iast, Void context) throws TypingException {
    IASTfunctionDefinition[] fundefs = iast.getFunctionDefinitions();
    for (int i = 0; i < fundefs.length; i++) {
      visit(fundefs[i], context);
    }
    ITASTfunctionDefinition[] typedFun = new ITASTfunctionDefinition[fundefs.length];
    ITASTexpression body = iast.getBody().accept(this, context);
    Collection<TASTfunctionDefinition> defs = specializations.values();
    ITASTfunctionDefinition[] defArray = defs.toArray(new ITASTfunctionDefinition[0]);
    return new TASTprogram(defArray,body,body.getType());
  }

  // function defintions are stored as is and will be typed upon invocation
  public void visit(IASTfunctionDefinition iast, Void context)
    throws TypingException {
    functions.put(iast.getName(), iast);
    functionTypes.put(iast.getName(),Type.PARAM);
  }


  /**
   * Type-check and specialize the body of a function for a given specialization key.
   *
   * This method is called once a function signature (name + argument types)
   * has already been selected. Its role is to:
   *
   *  1) Create a new local scope for the function body
   *  2) Bind each formal parameter to a typed variable
   *  3) Type-check the function body in this environment
   *  4) Record the resulting return type
   *  5) Build the specialized function definition
   *
   * Important:
   * - This method must NOT try to infer argument types.
   *   They are already provided by the FunctionKey.
   * - The function body may contain calls to other functions,
   *   including recursive or mutually recursive ones.
   */
  private void typeFunctionBody(IASTfunctionDefinition fdef, FunctionKey key)
    throws TypingException {
	  if (specializations.containsKey(key)) return;
	  specializedReturnTypes.put(key, Type.PARAM);
	  enterScope();
	  IASTvariable[] vars = fdef.getVariables();
	  ITASTvariable[] newvars = new TASTvariable[vars.length];
	  List<Type> args = key.argTypes;
	  for ( int i=0 ; i<vars.length ; i++ ) {
		  ITASTvariable newvar = new TASTvariable(vars[i].getMangledName(), args.get(i));
		  bindVariableAs(newvar.getMangledName(), newvar);
		  newvars[i] = newvar;
	  }
	  ITASTvariable v = (ITASTvariable)fdef.getFunctionVariable().accept(this, null);
	  TASTfunctionDefinition ftmp = new TASTfunctionDefinition(v, newvars, null, null);
	  specializations.put(key, ftmp);
	  ITASTexpression e = fdef.getBody().accept(this, null);
	  TASTfunctionDefinition newf = new TASTfunctionDefinition(v, newvars, e, e.getType());
	  specializations.put(key, newf);
	  specializedReturnTypes.put(key, newf.getType());
      leaveScope();
  }

  @Override
  public ITASTexpression visit(IASTinvocation iast, Void context)
    throws TypingException {
	// function must be a variable
	IASTexpression f = iast.getFunction();
	if (!(f instanceof IASTvariable))
	  typeError("Only named functions can be invoked");
	String fname = ((IASTvariable) f).getName();
	IASTfunctionDefinition fdef = functions.get(fname);
	// primitive
	if (fdef == null) return super.visit(iast,context);
	
	IASTexpression[] args = iast.getArguments();
	ITASTexpression[] newargs = new ITASTexpression[args.length];
	List<Type> l = new ArrayList<Type>();
	for ( int i=0 ; i<args.length ; i++ ) {
		ITASTexpression e = args[i].accept(this, context);
		newargs[i] = e;
		l.add(e.getType());
	}
	FunctionKey k = new FunctionKey(fname, l);
	typeFunctionBody(fdef, k);
	return new TASTinvocation(iast.getFunction().accept(this, context), newargs, specializedReturnTypes.get(k));
  }

  @Override
  public ITASTexpression visit(IASTloop iast, Void context) throws TypingException {
	  return new TASTloop(iast.getBody().accept(this, context), iast.getCondition().accept(this, context), Type.BOOL);
  }

  @Override
  public ITASTexpression visit(IASTassignment iast, Void context) throws TypingException {
	  ITASTexpression e = iast.getExpression().accept(this, context);
	  ITASTvariable v = new TASTvariable(iast.getVariable().getMangledName(), e.getType());
      bindVariableAs(v.getMangledName(), v);
      return new TASTassignment(v, e, e.getType());
  }
}

package com.paracamplus.ilp2.treecompiler;

import java.io.IOException;
import java.io.Writer;
import java.io.BufferedWriter;
import java.io.StringWriter;

import java.util.Set;
import java.util.Map;
import java.util.HashMap;

import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.treecompiler.tast.TASTvariable;
import com.paracamplus.ilp1.treecompiler.interfaces.ITASTexpression;
import com.paracamplus.ilp1.treecompiler.interfaces.ITASTvariable;
import com.paracamplus.ilp1.treecompiler.interfaces.ITASTinvocation;
import com.paracamplus.ilp1.treecompiler.tast.Type;
import com.paracamplus.ilp2.treecompiler.interfaces.ITASTvisitor;
import com.paracamplus.ilp2.treecompiler.interfaces.ITASTloop;
import com.paracamplus.ilp2.treecompiler.interfaces.ITASTfunctionDefinition;
import com.paracamplus.ilp2.treecompiler.interfaces.ITASTassignment;
import com.paracamplus.ilp2.treecompiler.interfaces.ITASTprogram;

public class CompilerTree extends com.paracamplus.ilp1.treecompiler.CompilerTree
  implements ITASTvisitor<Void, Void, CompilationException> {

  public CompilerTree() {
    super();
    strCollect = new StringCollector();
    funNames = new HashMap<String,String>();
  }

  protected HashMap<String,String> funNames;

  public String compile(ITASTprogram program)
    throws CompilationException {

    StringWriter sw = new StringWriter();
    try {
      out = new BufferedWriter(sw);
      visit(program, null);
      out.flush();
    } catch (IOException exc) {
      throw new CompilationException(exc);
    }
    return sw.toString();
  }

  public void visit(ITASTprogram iast, Void context)
    throws CompilationException {
    emit(treeProgramPrefix);
    strCollect.collect(iast);

    emit("/* String Litterals */\n");
    for (Map.Entry<String,String> e : strCollect.getStringTable().entrySet()) {
      emit("label " + e.getValue() + " \"" + escape(e.getKey()) + "\"\n");
    }
    emit("\n");

    // Associate to each function a label *before* function definition
    // emission. Needed to have label already mapped for mutually
    // recurive functions
    for(ITASTfunctionDefinition f: iast.getFunctionDefinitions()){
      String fname = f.getName();
      String funLabel = newLabel();
      funNames.put(fname,funLabel);
    }

    emit("/* Function Definitions */\n");
    for(ITASTfunctionDefinition f: iast.getFunctionDefinitions()){
      emit("/* function : "+f.getFunctionVariable().getName()+" */\n");
      visit(f,context);
      emit("\n");
    }
    emit("\n");
    emit("/* Main */\n");
    emit("# Routine main\n");
    emit("label main\n");
    emit("sxp\n");
    indent();
    iast.getBody().accept(this, context);
    dedent();
    emit("\nlabel end\n");
  }

  public void visit(ITASTfunctionDefinition iast, Void context)
    throws CompilationException {

    String fname = iast.getName();
    String funLabel = funNames.get(fname);
    emit("");
    emit("# Routine: " + funLabel + "\n");
    emit("label " + funLabel + "\n");
    indent();

    /* Parameters handling: bind variable to its arg name */
    ITASTvariable[] params = iast.getVariables();
    int intArg = 0;
    int floatArg = 0;

    for (int i = 0; i < params.length; i++) {
      String name;
      if (((TASTvariable) params[i]).getType() == Type.FLOAT) {
        name = "fi" + floatArg;
        floatArg++;
      } else {
        name = "i" + intArg;
        intArg++;
      }
      envStack.peek().put(params[i].getName(), name);
    }

    emit("# Body\n");
    emit("move\n");
    if (((ITASTexpression) iast.getBody()).getType() == Type.FLOAT)
      emit("temp fv\n");
    else
      emit("temp rv\n");

    iast.getBody().accept(this, context);
    emit("label end\n");
  }

  @Override
public Void visit(ITASTloop iast, Void context) throws CompilationException {

    String lStart = newLabel();
    String lTrue  = newLabel();
    String lFalse   = newLabel();

    emit("eseq\n");
    indent();
    enterSeq();

    emit("label " + lStart + "\n");
    emit("cjump\n");
    indent();
    emit("ne\n");
    iast.getCondition().accept(this, context);
    emit("\nconst 0\n");
    emit("name " + lTrue + "\n");
    emit("name " + lFalse + "\n");
    dedent();

    emit("label " + lTrue + "\n");
    emit("sxp\n");
    indent();
    iast.getBody().accept(this, context);
    emit("\n");
    dedent();

    emit("jump name " + lStart + "\n");
    emit("label " + lFalse + "\n");
    exitSeq();
    emit("const 0\n");
    dedent();
    return null;
}

  @Override
  public Void visit(ITASTassignment iast, Void context) throws CompilationException {
	  emit("eseq\n");
	  String v;
	  if (lookupVariable(iast.getVariable().getMangledName()) == null) {
		  if (iast.getType() == Type.FLOAT) {
			  v = newFloatTemp();
			  envStack.peek().put(iast.getVariable().getMangledName(), v);
		  } else {
			  v = bindVariable(iast.getVariable().getMangledName());
		  }
	  } else {
		  v = lookupVariable(iast.getVariable().getMangledName());
	  }
	  emitMoveToTemp(v, iast.getExpression());
	  emit("temp " + v);
	  return null;
  }

  @Override
	public Void visit(ITASTinvocation iast, Void context)
    throws CompilationException {
    ITASTexpression function =  iast.getFunction();
    ITASTvariable v = (ITASTvariable) function;
    // primitive, call super method
    if(!funNames.containsKey(v.getName())) return super.visit(iast,context);
    if (iast.getType() == Type.FLOAT) {
		  emit("callF\n");
	      indent();
	      emit("name " + funNames.get(v.getMangledName()) + "\n");
	      for (ITASTexpression e : iast.getArguments()) {
	      	emit("float");
		      e.accept(this,context);
	      }
	      emit("\n");
	      dedent();
	      emit("call end\n");
    } else {
    	emit("call\n");
	      indent();
	      emit("name " + funNames.get(v.getMangledName()) + "\n");
	      for (ITASTexpression e : iast.getArguments()) {
		      e.accept(this,context);
	      }
	      emit("\n");
	      dedent();
	      emit("call end\n");
    }
  return null;
  }
  
  // car 80-1 ne passe pas 
  @Override
	public Void visit(ITASTvariable iast, Void context)
    throws CompilationException {
    	String var = lookupVariable(iast.getMangledName());
    	String fun = funNames.get(iast.getMangledName());
	  if (var != null) {
	  	emit("temp " + var);
	  } else if (fun != null) {
	  	emit("temp " + fun);
	  } else {
	  	emit("const 0");
	  }
	  return null;
  }
}

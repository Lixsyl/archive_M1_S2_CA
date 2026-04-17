package com.paracamplus.ilp1.treecompiler;

import com.paracamplus.ilp1.ast.ASTinteger;
import com.paracamplus.ilp1.ast.ASToperator;
import com.paracamplus.ilp1.ast.ASTstring;
import com.paracamplus.ilp1.compiler.interfaces.*;
import com.paracamplus.ilp1.interfaces.IASTexpression;
import com.paracamplus.ilp1.interfaces.IASTvariable;
import com.paracamplus.ilp1.interfaces.IASTblock.IASTbinding;
import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.treecompiler.interfaces.*;
import com.paracamplus.ilp1.treecompiler.interfaces.ITASTblock.ITASTbinding;
import com.paracamplus.ilp1.treecompiler.tast.*;

import java.util.ArrayList;
import java.util.List;

public class Resolver implements ITASTvisitor<ITASTexpression, Void, ResolutionException> {

  protected final IOperatorEnvironment operatorEnvironment;
  protected final IGlobalVariableEnvironment globalVariableEnvironment;

  public Resolver(IOperatorEnvironment ioe, IGlobalVariableEnvironment igve) {
    this.operatorEnvironment = ioe;
    this.globalVariableEnvironment = igve;
  }

  public TASTprogram resolve(TASTprogram program) throws ResolutionException {
    ITASTexpression newBody = program.getBody().accept(this, null);
    return new TASTprogram(newBody, newBody.getType());
  }

  private TASTstring trueString = new TASTstring("true",Type.STRING);
  private TASTstring falseString = new TASTstring("false",Type.STRING);

  private ITASTexpression unaryInvocation(String name, ITASTexpression arg, Type retType) {
    TASTvariable fn = new TASTvariable(name, retType);
    ITASTexpression[] args = new ITASTexpression[]{ arg };
    return new TASTinvocation(fn, args, retType);
  }

  private ITASTexpression
    binaryCast(String name,
               ITASTexpression l, Type lt,
               ITASTexpression r, Type rt,
               Type returnType) {
    ITASTexpression lcast = castIfNeeded(l, lt);
    ITASTexpression rcast = castIfNeeded(r, rt);
    return new TASTbinaryOperation(new ASToperator(name),lcast,rcast,returnType);
  }

  /**
     Wraps a typed expression `expr` into an invocation that converts it to target type.
     If no conversion is needed (from == to), returns the original expr.
  */
  private ITASTexpression castIfNeeded(ITASTexpression expr, Type to) {
    Type from = expr.getType();
    if (from == to) return expr;

    String fnName = null;
    if (to == Type.STRING) {
      if (from == Type.INT) fnName = "string_of_int";
      else if (from == Type.FLOAT) fnName = "string_of_float";
      else if (from == Type.BOOL)
        return new TASTalternative(expr,trueString,falseString,Type.STRING);
    } else if (to == Type.FLOAT) {
      if (from == Type.INT) fnName = "float_of_int";
      else if (from == Type.STRING) fnName = "float_of_string";
    } else if (to == Type.INT) {
      if (from == Type.FLOAT) fnName = "int_of_float";
      else if (from == Type.STRING) fnName = "int_of_string";
    } else if (to == Type.BOOL) {
      ITASTexpression[] arr = new ITASTexpression[2];
      arr[0] = expr;
      arr[1] = new TASTboolean("true", Type.BOOL);
      return new TASTsequence(arr,Type.BOOL);
    }
    if (fnName == null) return expr;
    ITASTvariable fnVar = new TASTvariable(fnName, Type.FUNCTION);
    return new TASTinvocation(fnVar, new ITASTexpression[]{expr}, to);
  }

  @Override
  public ITASTexpression visit(ITASTboolean iast, Void data) throws ResolutionException {
    return iast;
  }

  @Override
  public ITASTexpression visit(ITASTinteger iast, Void data) throws ResolutionException {
    return iast;
  }

  @Override
  public ITASTexpression visit(ITASTfloat iast, Void data) throws ResolutionException {
    return iast;
  }

  @Override
  public ITASTexpression visit(ITASTstring iast, Void data) throws ResolutionException {
    return iast;
  }

  @Override
  public ITASTexpression visit(ITASTvariable iast, Void data) throws ResolutionException {
    if (iast.getName().equals("pi")) return new TASTfloat("3.1415926535",Type.FLOAT);
    return iast;
  }

  @Override
  public ITASTexpression visit(ITASTunaryOperation iast, Void data) throws ResolutionException {
    try {
      ITASTexpression operand = iast.getOperand().accept(this, data);
      String op = operatorEnvironment.getUnaryOperator(iast.getOperator());
      Type opt = operand.getType();

      Type returnType;
      ASToperator opresolved;
      if ("ILP_Opposite".equals(op)){
        if (opt == Type.INT) opresolved = new ASToperator(op+"_INT");
        else if (opt == Type.FLOAT) opresolved = new ASToperator(op+"_FLOAT");
        else throw new ResolutionException("ILP_Opposite with bad type: "+opt);
        return new TASTunaryOperation(opresolved, operand,opt);
      } else if ("ILP_Not".equals(op)){
        if (opt == Type.BOOL) opresolved = new ASToperator(op);
        else return new TASTboolean("false", Type.BOOL);
        return new TASTunaryOperation(opresolved, operand,opt);
      }
      throw new ResolutionException("operator "+op+" cannot be resolved");
    } catch (CompilationException e) {
      throw new ResolutionException(e);
    }
  }

  public ITASTexpression resolvePlus(ITASTexpression l, ITASTexpression r)
    throws ResolutionException {
	   if (l.getType() == Type.STRING || r.getType() == Type.STRING) {
		   ITASTexpression nl = castIfNeeded(l, Type.STRING);
		   ITASTexpression nr = castIfNeeded(r, Type.STRING);
		   ITASTvariable var = new TASTvariable("concat", Type.FUNCTION);
		   return new TASTinvocation(var, new ITASTexpression[]{nl,nr}, Type.STRING);
		   //return new TASTbinaryOperation(new TASTinvocation("concat"), nl, nr, Type.STRING);
	   }
	   if (Type.isNumeric(l.getType()) && Type.isNumeric(r.getType())) {
		   if (l.getType() == Type.INT && r.getType() == Type.INT) {
			   return new TASTbinaryOperation(new ASToperator("ILP_Plus_INT"), l, r, Type.INT);
		   }
		   ITASTexpression nl = castIfNeeded(l, Type.FLOAT);
		   ITASTexpression nr = castIfNeeded(r, Type.FLOAT);
		   return new TASTbinaryOperation(new ASToperator("ILP_Plus_FLOAT"), nl, nr, Type.FLOAT);
	   }
	   throw new ResolutionException("Resolver resolvePlus " + l.getType().toString() + r.getType().toString());
  }

  // Numeric arithmetic (+ - * / except plus special-cased)
  private ITASTexpression resolveNumeric(String op, ITASTexpression l, ITASTexpression r)throws ResolutionException {
	  if (Type.isNumeric(l.getType()) && Type.isNumeric(r.getType())) {
		   if (l.getType() == Type.FLOAT || r.getType() == Type.FLOAT) {
			   ITASTexpression nl = castIfNeeded(l, Type.FLOAT);
			   ITASTexpression nr = castIfNeeded(r, Type.FLOAT);
			   return new TASTbinaryOperation(new ASToperator(op + "_FLOAT"), nl, nr, Type.FLOAT);
		} return new TASTbinaryOperation(new ASToperator(op + "_INT"), l, r, Type.INT);
		  }
	  throw new ResolutionException("Resolver resolveNumeric ");
  }

  private ITASTexpression resolveEquality(String op, ITASTexpression l, ITASTexpression r)
    throws ResolutionException {
	if (Type.isNumeric(l.getType()) && Type.isNumeric(r.getType())) {
		if (l.getType() == Type.INT && r.getType() == Type.INT) {
			return new TASTbinaryOperation(new ASToperator(op + "_INT"), l, r, Type.BOOL);
		}

		ITASTexpression nl = castIfNeeded(l, Type.FLOAT);
		ITASTexpression nr = castIfNeeded(r, Type.FLOAT);
		return new TASTbinaryOperation(new ASToperator(op + "_FLOAT"), nl, nr, Type.BOOL);
	}
	
	if (l.getType() == r.getType()) {
		return new TASTbinaryOperation(new ASToperator(op + "_" + l.getType()), l, r, Type.BOOL);
	}
	
	  ITASTexpression[] exprs = new ITASTexpression[3];
	  exprs[0] = l.accept(this, null);
	  exprs[1] = r.accept(this, null);
	  
	if (op == "ILP_Equal") {
		exprs[2] = new TASTboolean("false", Type.BOOL);
	} else {
		exprs[2] = new TASTboolean("true", Type.BOOL);
	}
	return new TASTsequence(exprs, Type.BOOL);
  }

  // Comparisons (< <= > >=)
  private ITASTexpression resolveComparison(String op, ITASTexpression l, ITASTexpression r)
    throws ResolutionException {
	  if ((Type.isNumeric(l.getType())) && (Type.isNumeric(r.getType()))) {
		  if (l.getType() == Type.INT && r.getType() == Type.INT) {
			  return binaryCast(op + "_INT", l, l.getType(), r, r.getType(), Type.BOOL);
		  }
		  return binaryCast(op + "_FLOAT", l, Type.FLOAT, r, Type.FLOAT, Type.BOOL);
	  } else if ((l.getType() == Type.STRING) && (r.getType() == Type.STRING)) {
	  	return new TASTbinaryOperation(new ASToperator(op + "_STRING"), l, r, Type.BOOL);
	  } else {
		  ITASTexpression[] exprs = new ITASTexpression[3];
		  exprs[0] = l.accept(this, null);
		  exprs[1] = r.accept(this, null);
		  exprs[2] = new TASTboolean("false", Type.BOOL);
		  return new TASTsequence(exprs, Type.BOOL);
	  }
  }

  // Logical operators: and / or / xor
  private ITASTexpression resolveBoolean(String op, ITASTexpression l, ITASTexpression r)
    throws ResolutionException {
    return binaryCast(op, l, Type.BOOL, r, Type.BOOL, Type.BOOL);
  }

  // modulo
  private ITASTexpression resolveModulo(ITASTexpression l, ITASTexpression r)
    throws ResolutionException {
    return binaryCast("ILP_Modulo", l, Type.INT, r, Type.INT, Type.INT);
  }

  @Override
  public ITASTexpression visit(ITASTbinaryOperation iast, Void data)
    throws ResolutionException {

    try {
      ITASTexpression l = iast.getLeftOperand().accept(this, data);
      ITASTexpression r = iast.getRightOperand().accept(this, data);
      String op = operatorEnvironment.getBinaryOperator(iast.getOperator());

      switch (op) {
      case "ILP_Plus":
        return resolvePlus(l, r);

      case "ILP_Times":
      case "ILP_Minus":
      case "ILP_Divide":
        return resolveNumeric(op, l, r);

      case "ILP_Equal":
      case "ILP_NotEqual":
        return resolveEquality(op, l, r);

      case "ILP_GreaterThan":
      case "ILP_GreaterThanOrEqual":
      case "ILP_LessThan":
      case "ILP_LessThanOrEqual":
        return resolveComparison(op, l, r);

      case "ILP_And":
      case "ILP_Or":
      case "ILP_Xor":
        return resolveBoolean(op, l, r);

      case "ILP_Modulo":
        return resolveModulo(l, r);

      default:
        throw new ResolutionException(op + " operator cannot be resolved");
      }

    } catch (CompilationException e) {
      throw new ResolutionException(e);
    }
  }

  @Override
  public ITASTexpression visit(ITASTsequence iast, Void data) throws ResolutionException {
    ITASTexpression[] exprs = iast.getExpressions();
    if (exprs == null) return iast;
    List<ITASTexpression> out = new ArrayList<>(exprs.length);
    for (ITASTexpression e : exprs) {
      out.add(e.accept(this, data));
    }
    ITASTexpression[] arr = out.toArray(new ITASTexpression[0]);
    return new TASTsequence(arr, iast.getType());
  }

  @Override
  public ITASTexpression visit(ITASTalternative iast, Void data) throws ResolutionException {
	  ITASTexpression cond = iast.getCondition().accept(this, data);
	  ITASTexpression cons = iast.getConsequence().accept(this, data);
	  Type t = iast.getType();
	  if (iast.getAlternant() == null) {
		  if (t == Type.INT) {
			  return new TASTalternative(castIfNeeded(cond, Type.BOOL), castIfNeeded(cons,t), new TASTinteger("0", t), t);
		  }
		  if (t == Type.FLOAT) {
			  return new TASTalternative(castIfNeeded(cond, Type.BOOL), castIfNeeded(cons,t), new TASTfloat("0.0", t), t);
		  }
		  if (t == Type.BOOL) {
			  return new TASTalternative(castIfNeeded(cond, Type.BOOL), castIfNeeded(cons,t), new TASTboolean("false", t), t);
		  }
		  if (t == Type.STRING) {
			  return new TASTalternative(castIfNeeded(cond, Type.BOOL), castIfNeeded(cons,t), new TASTstring("", t), t);
		  }
	  } else {
		  ITASTexpression alt = iast.getAlternant().accept(this, data);
		  return new TASTalternative(castIfNeeded(cond, Type.BOOL), castIfNeeded(cons,t), castIfNeeded(alt,t), t);
	  }
	  throw new ResolutionException("Resolver alternative ");
  }

  @Override
  public ITASTexpression visit(ITASTblock iast, Void data) throws ResolutionException {
	  ITASTbinding[] bindings = iast.getBindings();
      ITASTblock.ITASTbinding[] newbindings = new ITASTblock.ITASTbinding[bindings.length];
      for ( int i=0 ; i<bindings.length ; i++ ) {
    	  ITASTbinding binding = bindings[i];
          ITASTexpression expr = binding.getInitialisation();
          ITASTexpression newexpr = expr.accept(this, null);
          ITASTvariable variable = binding.getVariable();
          ITASTvariable newvariable = (ITASTvariable)variable.accept(this, null);
          newbindings[i] = new TASTblock.TASTbinding(newvariable, newexpr);
      }
      ITASTexpression newbody = iast.getBody().accept(this, null);
      return new TASTblock(newbindings, newbody, newbody.getType());
  }

  private ITASTexpression resolveToString(ITASTexpression arg)
    throws ResolutionException {
	  return castIfNeeded(arg, Type.STRING);
  }

  private ITASTexpression resolveTypeOf(ITASTexpression iast) throws ResolutionException {
	  ITASTexpression[] exprs = new ITASTexpression[2];
	  exprs[0] = iast;
	  exprs[1] = new TASTstring(iast.getType().toString(), Type.STRING);
	  return new TASTsequence(exprs, Type.STRING);
  }

  private ITASTexpression resolvePrint(ITASTinvocation iast) throws ResolutionException {
	  ITASTexpression[] args = new ITASTexpression[1];
	  args[0] = castIfNeeded(iast.getArguments()[0].accept(this, null), Type.STRING);
	  return new TASTinvocation (iast.getFunction().accept(this, null), args, iast.getType());
  }

  private ITASTexpression[] resolveArguments(ITASTinvocation iast, Void data)
    throws ResolutionException {
    ITASTexpression[] raw = iast.getArguments();
    ITASTexpression[] targs = new ITASTexpression[raw.length];
    for (int i = 0; i < raw.length; i++) {
      targs[i] = raw[i].accept(this, data);
    }
    return targs;
  }

  @Override
  public ITASTexpression visit(ITASTinvocation iast, Void data)
    throws ResolutionException {
    // function must be a variable
    ITASTexpression func = iast.getFunction();
    if (!(func instanceof ITASTvariable))
      throw new ResolutionException("Only named functions can be invoked");
    String fname = ((ITASTvariable) func).getName();
    ITASTexpression[] targs = resolveArguments(iast, data);

    // primitives handled specially
    if ("type_of".equals(fname)) return resolveTypeOf(targs[0]);
    if ("to_string".equals(fname)) return resolveToString(targs[0]);
    if ("print".equals(fname)) return resolvePrint(iast);
    throw new ResolutionException("function " + fname + " not a primitive");
  }
}

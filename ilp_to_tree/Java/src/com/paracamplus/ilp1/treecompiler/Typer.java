package com.paracamplus.ilp1.treecompiler;

import java.util.*;

import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.interfaces.*;
import com.paracamplus.ilp1.interfaces.IASTblock.IASTbinding;
import com.paracamplus.ilp1.interpreter.interfaces.ILexicalEnvironment;
import com.paracamplus.ilp1.interpreter.interfaces.IOperator;
import com.paracamplus.ilp1.compiler.interfaces.*;
import com.paracamplus.ilp1.compiler.normalizer.INormalizationEnvironment;
import com.paracamplus.ilp1.treecompiler.tast.*;
import com.paracamplus.ilp1.treecompiler.interfaces.*;
import com.paracamplus.ilp1.treecompiler.TypingException;

public class Typer implements IASTvisitor<ITASTexpression, Void, TypingException> {

  protected final IOperatorEnvironment operatorEnvironment;
  protected final IGlobalVariableEnvironment globalVariableEnvironment;

  protected final Deque<Map<String,ITASTvariable>> envStack;
  protected Map<String, Type> functionTypes=new HashMap<String, Type>();;


  public Typer(IOperatorEnvironment ioe, IGlobalVariableEnvironment igve) {
    this.operatorEnvironment = ioe;
    this.globalVariableEnvironment = igve;
    this.envStack = new ArrayDeque<>();
    enterScope();
    initBuiltins();
  }

  private void initBuiltins() {
    bindVariableAs("pi", new TASTvariable("pi", Type.FLOAT));
    functionTypes.put("print", Type.BOOL);
    functionTypes.put("type_of", Type.STRING);
    functionTypes.put("to_string", Type.STRING);
  }

  protected void enterScope() {
    envStack.push(new HashMap<>());
  }

  protected void leaveScope() {
    if (envStack.isEmpty())
      throw new IllegalStateException("Scope stack underflow");
    envStack.pop();
  }

  protected void bindVariableAs(String varName, ITASTvariable var) {
    envStack.peek().put(varName, var);
  }

  protected ITASTvariable lookupVariable(String varName) {
    for (Map<String,ITASTvariable> scope : envStack) {
      if (scope.containsKey(varName))
        return scope.get(varName);
    }
    return null;
  }

  protected void typeError(String msg) throws TypingException {
    throw new TypingException("Type error: " + msg);
  }

  public TASTprogram visit(IASTprogram iast) throws TypingException {
    ITASTexpression body = iast.getBody().accept(this, null);
    return new TASTprogram(body,body.getType());
  }

  @Override
  public ITASTexpression visit(IASTinteger iast, Void context) throws TypingException {
    return new TASTinteger(iast.getDescription(), Type.INT);
  }

  @Override
  public ITASTexpression visit(IASTboolean iast, Void context) throws TypingException {
    return new TASTboolean(iast.getDescription(), Type.BOOL);
  }

  @Override
  public ITASTexpression visit(IASTfloat iast, Void context) throws TypingException {
    return new TASTfloat(iast.getDescription(), Type.FLOAT);
  }

  @Override
  public ITASTexpression visit(IASTstring iast, Void context) throws TypingException {
    return new TASTstring(iast.getValue(), Type.STRING);
  }

  @Override
  public ITASTexpression visit(IASTvariable iast, Void context) throws TypingException {
	  String varn = iast.getMangledName();
	  ITASTvariable var = lookupVariable(varn);
	  if (var != null) {
		  return new TASTvariable(varn, var.getType());
	  }
	  throw new TypingException("Type variable");
  }

  @Override
  public ITASTexpression visit(IASTunaryOperation iast, Void context) throws TypingException {
	  try {
		  ITASTexpression operandt = iast.getOperand().accept(this, null);
	      IASToperator operator = iast.getOperator();
	      String op = operatorEnvironment.getUnaryOperator(operator);
	      if (op == "-") {
	    	  return new TASTunaryOperation(operator, operandt, operandt.getType());
	      }
	      if (op == "!") {
	    	  return new TASTunaryOperation(operator, operandt, Type.BOOL);
	      }
	      throw new TypingException("Type unaryOperation : not - or ! ");
	  } catch (CompilationException e) {
		  e.printStackTrace();
	  }
	  throw new TypingException("Type unaryOperation");
  }

  protected ITASTexpression typePlus(IASTbinaryOperation iast, ITASTexpression l, ITASTexpression r) throws TypingException {
	  Type lt = l.getType();
	  Type rt = r.getType();
	  if (lt == Type.STRING || rt == Type.STRING) {
		  return new TASTbinaryOperation(iast.getOperator(), l, r, Type.STRING);
	  } else {
	      return new TASTbinaryOperation(iast.getOperator(), l, r, Type.unify(lt, rt));
	  }
  }

  protected ITASTexpression typeNumeric(
    IASTbinaryOperation iast,
    String op,
    ITASTexpression l,
    ITASTexpression r) throws TypingException {
	  Type lt = l.getType();
	  Type rt = r.getType();
	  return new TASTbinaryOperation(iast.getOperator(), l, r, Type.unify(lt, rt));
  }

  protected ITASTexpression
    typeModulo(IASTbinaryOperation iast,
               ITASTexpression l,
               ITASTexpression r) throws TypingException {
	  return new TASTbinaryOperation(iast.getOperator(), l, r, Type.INT);
  }

  protected ITASTexpression typeAlwaysBool(
    IASTbinaryOperation iast,
    ITASTexpression l,
    ITASTexpression r) throws TypingException {
	  return new TASTbinaryOperation(iast.getOperator(), l, r, Type.BOOL);
  }

  protected ITASTexpression
    typeComparison(IASTbinaryOperation iast,
                   String op,
                   ITASTexpression l,
                   ITASTexpression r) throws TypingException {
	  return new TASTbinaryOperation(iast.getOperator(), l, r, Type.BOOL);
  }

  @Override
  public ITASTexpression visit(IASTbinaryOperation iast, Void context)
    throws TypingException {

    try {
      ITASTexpression l = iast.getLeftOperand().accept(this, context);
      ITASTexpression r = iast.getRightOperand().accept(this, context);
      String op = operatorEnvironment.getBinaryOperator(iast.getOperator());

      switch (op) {
      case "ILP_Plus":
        return typePlus(iast, l, r);

      case "ILP_Times":
      case "ILP_Minus":
      case "ILP_Divide":
        return typeNumeric(iast, op, l, r);

      case "ILP_Modulo":
        return typeModulo(iast, l, r);

      case "ILP_GreaterThan":
      case "ILP_GreaterThanOrEqual":
      case "ILP_LessThan":
      case "ILP_LessThanOrEqual":
        return typeComparison(iast, op, l, r);

      case "ILP_And":
      case "ILP_Or":
      case "ILP_Xor":
      case "ILP_Equal":
      case "ILP_NotEqual":
        return typeAlwaysBool(iast, l, r);

      default:
        throw new TypingException("Binary operator " + op + " cannot be typed");
      }

    } catch (CompilationException e) {
      throw new TypingException(e);
    }
  }


  @Override
  public ITASTexpression visit(IASTsequence iast, Void context) throws TypingException {
	  IASTexpression[] expressions = iast.getExpressions();
	  ITASTexpression[] exprs = new ITASTexpression[expressions.length];
	  ITASTexpression lastValue = null;
      for ( int i=0 ; i< expressions.length ; i++ ) {
    	  lastValue = expressions[i].accept(this, null);
          exprs[i] = lastValue;
      }
      return new TASTsequence(exprs, lastValue.getType());
  }

  @Override
  public ITASTexpression visit(IASTalternative iast, Void context) throws TypingException {
	  ITASTexpression c = iast.getConsequence().accept(this, null);
	  ITASTexpression a = iast.getAlternant().accept(this, null);
	  return new TASTalternative(iast.getCondition().accept(this, null), c, a, Type.unify(c.getType(), a.getType()));
  }

  @Override
  public ITASTexpression visit(IASTblock iast, Void context) throws TypingException {
	  IASTbinding[] bindings = iast.getBindings();
      ITASTblock.ITASTbinding[] newbindings = new ITASTblock.ITASTbinding[bindings.length];
      enterScope();
      for ( int i=0 ; i<bindings.length ; i++ ) {
    	  IASTbinding binding = bindings[i];
          IASTexpression expr = binding.getInitialisation();
          ITASTexpression newexpr = expr.accept(this, null);
          IASTvariable variable = binding.getVariable();
          ITASTvariable newvariable = (ITASTvariable)variable.accept(this, null);
          bindVariableAs(newvariable.getMangledName(), newvariable);
          newbindings[i] = new TASTblock.TASTbinding(newvariable, newexpr);
      }
      ITASTexpression newbody = iast.getBody().accept(this, null);
      leaveScope();
      return new TASTblock(newbindings, newbody, newbody.getType());
  }

  @Override
  public ITASTexpression visit(IASTinvocation iast, Void context) throws TypingException {
	  ITASTexpression fun = iast.getFunction().accept(this, null);
	  IASTexpression[] args = iast.getArguments();
	  ITASTexpression[] newargs = new ITASTexpression[args.length];
	  enterScope();
	  for ( int i=0 ; i<args.length ; i++ ) {
		  IASTexpression argument = args[i];
		  ITASTexpression arg = argument.accept(this, null);
		  newargs[i] = arg;
	  }
	  /*
	  if (iast instanceof Inamed) {
		  Inamed nam = (Inamed)iast;
		  for (Map<String,Type> func : functionTypes) {
		      if (fun.containsKey(nam.getMangledName()))
		      return new ITASTinvocation(fun, newargs, func.get(nam.getMangledName()));
		  }
	  }
	  */
	  
	  return null;
	  
  }
}

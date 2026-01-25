package com.paracamplus.ilp1.treecompiler;

import java.util.*;

import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.interfaces.*;
import com.paracamplus.ilp1.compiler.interfaces.*;
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
  public ITASTexpression visit(IASTvariable iast, Void context)
    throws TypingException {
    throw new TypingException("IASTvariable not implemented yet");
  }

  @Override
  public ITASTexpression visit(IASTunaryOperation iast, Void context) throws TypingException {
    throw new TypingException("IASTunaryOperation not implemented yet");
  }

  protected ITASTexpression
    typePlus(IASTbinaryOperation iast, ITASTexpression l, ITASTexpression r)
    throws TypingException {
    throw new TypingException("typePlus not implemented yet");
  }

  protected ITASTexpression typeNumeric(
    IASTbinaryOperation iast,
    String op,
    ITASTexpression l,
    ITASTexpression r) throws TypingException {
    throw new TypingException("typeNumeric not implemented yet");
  }

  protected ITASTexpression
    typeModulo(IASTbinaryOperation iast,
               ITASTexpression l,
               ITASTexpression r) throws TypingException {
    throw new TypingException("typeModulo not implemented yet");
  }

  protected ITASTexpression typeAlwaysBool(
    IASTbinaryOperation iast,
    ITASTexpression l,
    ITASTexpression r) throws TypingException {
    throw new TypingException("typeAlwaysBool not implemented yet");
  }

  protected ITASTexpression
    typeComparison(IASTbinaryOperation iast,
                   String op,
                   ITASTexpression l,
                   ITASTexpression r) throws TypingException {
    throw new TypingException("typeComparison not implemented yet");
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
    throw new TypingException("IASTsequence not implemented yet");
  }

  @Override
  public ITASTexpression visit(IASTalternative iast, Void context) throws TypingException {
    throw new TypingException("IASTalternative not implemented yet");
  }

  @Override
  public ITASTexpression visit(IASTblock iast, Void context) throws TypingException {
    throw new TypingException("IASTblock not implemented yet");
  }

  @Override
  public ITASTexpression visit(IASTinvocation iast, Void context)
    throws TypingException {
    throw new TypingException("IASTinvocation not implemented yet");
  }
}

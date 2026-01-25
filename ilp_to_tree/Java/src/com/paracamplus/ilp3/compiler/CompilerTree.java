package com.paracamplus.ilp3.compiler;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Set;

import com.paracamplus.ilp1.compiler.interfaces.IGlobalVariableEnvironment;
import com.paracamplus.ilp1.compiler.interfaces.IOperatorEnvironment;
import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp3.interfaces.*;
import com.paracamplus.ilp3.ast.*;


public class CompilerTree extends com.paracamplus.ilp2.compiler.CompilerTree
implements IASTvisitor<Void, Void, CompilationException>{

  public CompilerTree(IOperatorEnvironment ioe, IGlobalVariableEnvironment igve) {
		super(ioe, igve);
	}

  @Override
	public Void visit(IASTcodefinitions iast, Void context)
    throws CompilationException {
      throw new CompilationException("codefinitions compilation not implemented yet");
  }

  @Override
  public Void visit(IASTlambda iast, Void context)
            throws CompilationException {
      throw new CompilationException("lambda compilation not implemented yet");
    }


  @Override
	public Void visit(IASTtry iast, Void context)
    throws CompilationException {
    throw new CompilationException("try compilation not implemented yet");
  }
}

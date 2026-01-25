package com.paracamplus.ilp4.compiler;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.compiler.interfaces.IGlobalVariableEnvironment;
import com.paracamplus.ilp1.compiler.interfaces.IOperatorEnvironment;
import com.paracamplus.ilp4.interfaces.*;
import com.paracamplus.ilp4.ast.*;

public class CompilerTree extends com.paracamplus.ilp3.compiler.CompilerTree
implements IASTvisitor<Void, Void, CompilationException> {

	public CompilerTree(IOperatorEnvironment ioe, IGlobalVariableEnvironment igve) {
    super(ioe, igve);
  }

  @Override
	public Void visit(IASTinstantiation iast, Void context)
    throws CompilationException {
    throw new CompilationException("instantiation compilation not implemented yet");
  }

  @Override
	public Void visit(IASTfieldRead iast, Void context)
    throws CompilationException {
    throw new CompilationException("field read compilation not implemented yet");
  }

  @Override
	public Void visit(IASTfieldWrite iast, Void context)
    throws CompilationException {
    throw new CompilationException("field write compilation not implemented yet");
  }

  @Override
	public Void visit(IASTsend iast, Void context)
    throws CompilationException {
    throw new CompilationException("send compilation not implemented yet");
  }

  @Override
	public Void visit(IASTself iast, Void context)
            throws CompilationException {
    throw new CompilationException("self compilation not implemented yet");
    }

  @Override
	public Void visit(IASTsuper iast, Void context)
    throws CompilationException {
    throw new CompilationException("super compilation not implemented yet");
  }

}

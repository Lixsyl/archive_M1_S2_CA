import java.io.File;
import java.io.IOException;
import java.util.stream.Stream;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import com.paracamplus.ilp1.tools.FileTool;
import com.paracamplus.ilp1.tools.InputFromFile;
import com.paracamplus.ilp1.compiler.CompilationException;
import com.paracamplus.ilp1.compiler.GlobalVariableEnvironment;
import com.paracamplus.ilp1.compiler.OperatorEnvironment;
import com.paracamplus.ilp1.compiler.OperatorStuff;
import com.paracamplus.ilp1.compiler.interfaces.IGlobalVariableEnvironment;
import com.paracamplus.ilp1.compiler.interfaces.IOperatorEnvironment;
import com.paracamplus.ilp1.compiler.optimizer.IdentityOptimizer;
import com.paracamplus.ilp1.parser.ParseException;
import com.paracamplus.ilp1.parser.xml.IXMLParser;
import com.paracamplus.ilp3.compiler.GlobalVariableStuff;
import com.paracamplus.ilp4.parser.ilpml.ILPMLParser;
import com.paracamplus.ilp4.parser.xml.XMLParser;
import com.paracamplus.ilp4.ast.ASTfactory;
import com.paracamplus.ilp4.compiler.CompilerTree;
import com.paracamplus.ilp4.interfaces.IASTfactory;
import com.paracamplus.ilp4.compiler.interfaces.IASTCclassDefinition;

import com.paracamplus.ilp4.interfaces.IASTprogram;
import com.paracamplus.ilp4.compiler.test.CompilerRunner;

public class CompilerMain{

  public static void main(String[] args) {

    // configuration du parseur
    IASTfactory factory = new ASTfactory();
    ILPMLParser parser = (new ILPMLParser(factory));
		try {

    // configuration du compilateur
    IOperatorEnvironment ioe = new OperatorEnvironment();
    OperatorStuff.fillUnaryOperators(ioe);
    OperatorStuff.fillBinaryOperators(ioe);
    IGlobalVariableEnvironment gve = new GlobalVariableEnvironment();
    GlobalVariableStuff.fillGlobalVariables(gve);
    CompilerTree compiler = new CompilerTree(ioe, gve);
    CompilerRunner run = new CompilerRunner();
    if (args.length < 1) {
      System.out.println("expecting an ILP file");
    }else{
      InputFromFile f = new InputFromFile (args[0]);
      parser.setInput(f);
      IASTprogram program = (IASTprogram) parser.getProgram();
      IASTCclassDefinition objectClass = run.createObjectClass();
      String compiled = compiler.compile(program);
      File file= new File(args[0]);
      File treeFile = FileTool.changeSuffix(file, "hir");
      FileTool.stuffFile(treeFile, compiled);
    }
    System.exit(0);
    } catch  (Exception e) {
			System.out.println("error" + e);
      System.exit(1);
		}
  }
}

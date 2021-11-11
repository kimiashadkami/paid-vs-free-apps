package ca.pfv.spmf.algorithmmanager.descriptions;

import java.io.IOException;

import ca.pfv.spmf.algorithmmanager.DescriptionOfAlgorithm;
import ca.pfv.spmf.algorithmmanager.DescriptionOfParameter;
import ca.pfv.spmf.algorithms.episodes.poerm.AlgoPOERM;

/**
 * This class describes the POERM algorithm parameters. 
 * It is designed to be used by the graphical and command line interface.
 * 
 * @see AlgoPOERM
 * @author Chen YangMing, Philippe Fournier-Viger
 */
public class DescriptionAlgoPOERM extends DescriptionOfAlgorithm {

	/**
	 * Default constructor
	 */
	public DescriptionAlgoPOERM(){
	}

	@Override
	public String getName() {
		return "POERM";
	}

	@Override
	public String getAlgorithmCategory() {
		return "EPISODE RULE PATTERN MINING";
	}

	@Override
	public String getURLOfDocumentation() {
		return "http://www.philippe-fournier-viger.com/spmf/POERM.php";
	}

	@Override
	public void runAlgorithm(String[] parameters, String inputFile, String outputFile) throws IOException {
		// the min support of POERM algorithm
		int minSupport = getParamAsInteger(parameters[0]);
		
		// the XSpan of POERM algorithm
		int xSpan = getParamAsInteger(parameters[1]);
		
		// the YSpan of POERM algorithm
		int ySpan = getParamAsInteger(parameters[2]);
		
		// the min confidence of POERM algorithm
		double minConfidence = getParamAsDouble(parameters[3]);
		
		// the XYSpan of POERM algorithm
		int xySpan = getParamAsInteger(parameters[4]);
		
		boolean selftIncrement  = getParamAsBoolean(parameters[5]); 
		
		AlgoPOERM poerm = new AlgoPOERM();
		poerm.runAlgorithm(inputFile, minSupport, xSpan, ySpan, minConfidence, xySpan, selftIncrement);
		poerm.writeRule2File(outputFile);
	}

	@Override
	public DescriptionOfParameter[] getParametersDescription() {
        
		DescriptionOfParameter[] parameters = new DescriptionOfParameter[6];
		parameters[0] = new DescriptionOfParameter("Minimum Support", "(e.g. 2)", Integer.class, false);
		parameters[1] = new DescriptionOfParameter("XSpan?", "(e.g. 2)", Integer.class, false);
		parameters[2] = new DescriptionOfParameter("YSpan?", "(e.g. 2)", Integer.class, false);
		parameters[3] = new DescriptionOfParameter("Minimum confidence?", "(e.g. 0.5)", Double.class, false);
		parameters[4] = new DescriptionOfParameter("XYSpan?", "(e.g. 3", Integer.class, false);
		parameters[5] = new DescriptionOfParameter("Without timestamps?", "(default: false)", Boolean.class, false);
		return parameters;
	}

	@Override
	public String getImplementationAuthorNames() {
		return "Chen YangMing, Philippe Fournier-Viger";
	}

	@Override
	public String[] getInputFileTypes() {
		return new String[]{"Database of instances","Transaction database", "Transaction database with timestamps"};
	}

	@Override
	public String[] getOutputFileTypes() {
		return new String[]{"Patterns",  "Episode rules", "Frequent episode rules"};
	}
}

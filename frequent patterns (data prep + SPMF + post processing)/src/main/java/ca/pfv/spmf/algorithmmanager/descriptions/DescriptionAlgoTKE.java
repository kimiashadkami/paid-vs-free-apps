package ca.pfv.spmf.algorithmmanager.descriptions;

import java.io.IOException;

import ca.pfv.spmf.algorithmmanager.DescriptionOfAlgorithm;
import ca.pfv.spmf.algorithmmanager.DescriptionOfParameter;
import ca.pfv.spmf.algorithms.episodes.emma.AlgoEMMA;
import ca.pfv.spmf.algorithms.episodes.emma.AlgoTKE;

/**
 * This class describes the TKE algorithm parameters. 
 * It is designed to be used by the graphical and command line interface.
 * 
 * @see AlgoTKE
 * @author Philippe Fournier-Viger
 */
public class DescriptionAlgoTKE extends DescriptionOfAlgorithm {

	/**
	 * Default constructor
	 */
	public DescriptionAlgoTKE(){
	}

	@Override
	public String getName() {
		return "TKE";
	}

	@Override
	public String getAlgorithmCategory() {
		return "EPISODE MINING";
	}

	@Override
	public String getURLOfDocumentation() {
		return "http://www.philippe-fournier-viger.com/spmf/TKEepisodes.php";
	}

	@Override
	public void runAlgorithm(String[] parameters, String inputFile, String outputFile) throws IOException {
		int k = getParamAsInteger(parameters[0]);
		int maxWindow = getParamAsInteger(parameters[1]);  
		boolean selftIncrement  = getParamAsBoolean(parameters[2]);  

		// apply the algorithm
		AlgoTKE algo = new AlgoTKE();
		algo.runAlgorithm(inputFile, outputFile, k, maxWindow, selftIncrement);
		algo.printStats();
	}

	@Override
	public DescriptionOfParameter[] getParametersDescription() {
        
		DescriptionOfParameter[] parameters = new DescriptionOfParameter[3];
		parameters[0] = new DescriptionOfParameter("k", "(e.g. 6)", Integer.class, false);
		parameters[1] = new DescriptionOfParameter("Max. Time duration", "(e.g. 2)", Integer.class, false);
		parameters[2] = new DescriptionOfParameter("Has no timestamps?", "(default: false)", Boolean.class, false);
		return parameters;
	}

	@Override
	public String getImplementationAuthorNames() {
		return "Yang Peng, Philippe Fournier-Viger, Yanjun Yang";
	}

	@Override
	public String[] getInputFileTypes() {
		return new String[]{"Database of instances","Transaction database", "Transaction database with timestamps"};
	}

	@Override
	public String[] getOutputFileTypes() {
		return new String[]{"Patterns",  "Episodes", "Frequent episodes", "Top-k frequent episodes"};
	}
	
}

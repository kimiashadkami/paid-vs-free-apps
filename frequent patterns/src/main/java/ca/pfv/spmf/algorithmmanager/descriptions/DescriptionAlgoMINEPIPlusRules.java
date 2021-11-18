package ca.pfv.spmf.algorithmmanager.descriptions;

import java.io.IOException;

import ca.pfv.spmf.algorithmmanager.DescriptionOfAlgorithm;
import ca.pfv.spmf.algorithmmanager.DescriptionOfParameter;
import ca.pfv.spmf.algorithms.episodes.emma.AlgoEMMA;
import ca.pfv.spmf.algorithms.episodes.general.FrequentEpisodes;
import ca.pfv.spmf.algorithms.episodes.minepiplus.AlgoMINEPIPlus;
import ca.pfv.spmf.algorithms.episodes.standardepisoderules.AlgoGenerateEpisodeRules;

/**
 * This class describes the EMMA algorithm parameters. It is designed to be used
 * by the graphical and command line interface.
 * 
 * @see AlgoEMMA
 * @author Yang Peng
 */
public class DescriptionAlgoMINEPIPlusRules extends DescriptionOfAlgorithm {

	/**
	 * Default constructor
	 */
	public DescriptionAlgoMINEPIPlusRules() {
	}

	@Override
	public String getName() {
		return "MINEPI+Rules";
	}

	@Override
	public String getAlgorithmCategory() {
		return "EPISODE MINING";
	}

	@Override
	public String getURLOfDocumentation() {
		return "http://www.philippe-fournier-viger.com/spmf/standard_episode_rules.php";
	}

	@Override
	public void runAlgorithm(String[] parameters, String inputFile, String outputFile) throws IOException {
		int minSup = getParamAsInteger(parameters[0]);
		int maxWindow = getParamAsInteger(parameters[1]);
		boolean selftIncrement = getParamAsBoolean(parameters[2]);

		// apply the algorithm
		AlgoMINEPIPlus algo = new AlgoMINEPIPlus();
		FrequentEpisodes frequentEpisodes = algo.runAlgorithm(inputFile, null, minSup, maxWindow, selftIncrement);
		algo.printStats();

		double minConfidence = getParamAsDouble(parameters[3]);
		int maxConsequentSize = getParamAsInteger(parameters[4]);

		AlgoGenerateEpisodeRules ruleMiner = new AlgoGenerateEpisodeRules();
		ruleMiner.runAlgorithm(frequentEpisodes, minSup, minConfidence, maxConsequentSize);
		ruleMiner.writeRulesToFileSPMFFormat(outputFile);
		ruleMiner.printStats();
	}

	@Override
	public DescriptionOfParameter[] getParametersDescription() {

		DescriptionOfParameter[] parameters = new DescriptionOfParameter[5];
		parameters[0] = new DescriptionOfParameter("Minimum support", "(e.g. 2)", Integer.class, false);
		parameters[1] = new DescriptionOfParameter("Max. Time duration", "(e.g. 2)", Integer.class, false);
		parameters[2] = new DescriptionOfParameter("Has no timestamps?", "(default: false)", Boolean.class, false);
		parameters[3] = new DescriptionOfParameter("Minimum confidence", "(e.g. 0.2)", Double.class, false);
		parameters[4] = new DescriptionOfParameter("Max. consequent event count", "(e.g. 1)", Integer.class, false);
		return parameters;
	}

	@Override
	public String getImplementationAuthorNames() {
		return "Yang Peng, Yangming Chen";
	}

	@Override
	public String[] getInputFileTypes() {
		return new String[] { "Database of instances", "Transaction database", "Transaction database with timestamps" };
	}

	@Override
	public String[] getOutputFileTypes() {
		return new String[] { "Patterns", "Episodes", "Episode rules" };
	}

}

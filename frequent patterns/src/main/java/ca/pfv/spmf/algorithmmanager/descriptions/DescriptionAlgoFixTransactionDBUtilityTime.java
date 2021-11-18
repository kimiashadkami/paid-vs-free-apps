package ca.pfv.spmf.algorithmmanager.descriptions;

import java.io.IOException;

import ca.pfv.spmf.algorithmmanager.DescriptionOfAlgorithm;
import ca.pfv.spmf.algorithmmanager.DescriptionOfParameter;
import ca.pfv.spmf.tools.dataset_stats.TransactionStatsGenerator;
import ca.pfv.spmf.tools.other_dataset_tools.fix_tdb_utility_time.AlgoFixTDBTimeUtility;

/**
 * This class describes the algorithm to fix a transaction database. It is designed to be used by the graphical and command line interface.
 * 
 * @see TransactionStatsGenerator
 * @author Philippe Fournier-Viger
 */
public class DescriptionAlgoFixTransactionDBUtilityTime extends DescriptionOfAlgorithm {

	/**
	 * Default constructor
	 */
	public DescriptionAlgoFixTransactionDBUtilityTime(){
	}

	@Override
	public String getName() {
		return "Fix_a_transaction_database_with_utility_time";
	}

	@Override
	public String getAlgorithmCategory() {
		return "DATASET TOOLS";
	}

	@Override
	public String getURLOfDocumentation() {
		return "http://www.philippe-fournier-viger.com/spmf/Fix_a_transaction_database_with_utility_time.php";
	}

	@Override
	public void runAlgorithm(String[] parameters, String inputFile, String outputFile) throws IOException {
		AlgoFixTDBTimeUtility tool = new AlgoFixTDBTimeUtility();
		tool.runAlgorithm(inputFile, outputFile);
		System.out.println("Finished fixing the transaction database.");
	}

	@Override
	public DescriptionOfParameter[] getParametersDescription() {
		DescriptionOfParameter[] parameters = new DescriptionOfParameter[0];
		return parameters;
	}

	@Override
	public String getImplementationAuthorNames() {
		return "Philippe Fournier-Viger";
	}

	@Override
	public String[] getInputFileTypes() {
		return new String[]{"Database of instances","Transaction database", "Transaction database with utility values and time"};
	}

	@Override
	public String[] getOutputFileTypes() {
		return new String[]{"Database of instances","Transaction database", "Transaction database with utility values and time"};
	}
}

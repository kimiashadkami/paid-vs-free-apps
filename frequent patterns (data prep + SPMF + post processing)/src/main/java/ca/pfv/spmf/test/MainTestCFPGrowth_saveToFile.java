package ca.pfv.spmf.test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.frequentpatterns.cfpgrowth.AlgoCFPGrowth;

/**
 * Example of how to use the CFPGrowth++ algorithm, from the source code.
 */
public class MainTestCFPGrowth_saveToFile {

    public static void main(String[] arg) throws FileNotFoundException, IOException {

        String database1 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/free_high_rated_spmf.txt";
        String output1 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/output/free_high_rated_fp_cfp.txt";
        String MISfile1 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/free_high_rated_MIS.txt";
        run(database1, output1, MISfile1);

        String database2 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/paid_high_rated_spmf.txt";
        String output2 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/output/paid_high_rated_fp_cfp.txt";
        String MISfile2 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/paid_high_rated_MIS.txt";
        run(database2, output2, MISfile2);

        String database3 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_free_high_rated_spmf.txt";
        String output3 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/output/no_outliers_free_high_rated_fp_cfp.txt";
        String MISfile3 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_free_high_rated_MIS.txt";
        run(database3, output3, MISfile3);

        String database4 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_paid_high_rated_spmf.txt";
        String output4 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/output/no_outliers_paid_high_rated_fp_cfp.txt";
        String MISfile4 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_paid_high_rated_MIS.txt";
        run(database4, output4, MISfile4);
    }

    public static void run(String database, String output, String MISfile) throws FileNotFoundException, IOException {
        // Applying the CFPGROWTH algorithmMainTestFPGrowth.java
        AlgoCFPGrowth algo = new AlgoCFPGrowth();
        algo.runAlgorithm(database, output, MISfile);
        algo.printStats();
	}

	public static String fileToPath(String filename)
			throws UnsupportedEncodingException {
		URL url = MainTestCFPGrowth_saveToFile.class.getResource(filename);
		return java.net.URLDecoder.decode(url.getPath(), "UTF-8");
	}
}

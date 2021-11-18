package ca.pfv.spmf.test;

import java.io.FileNotFoundException;
import java.io.IOException;

import ca.pfv.spmf.algorithms.frequentpatterns.fpgrowth.AlgoFPClose;

/**
 * Example of how to use FPClose from the source code and
 * the result to a file.
 * @author Philippe Fournier-Viger (Copyright 2015)
 */
public class MainTestFPClose_saveToFile {

	public static void main(String [] arg) throws FileNotFoundException, IOException{
		// the file paths
	    
	    String input1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.txt";
        String output1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/free_high_rated_fp_cfp.txt";
        System.out.println("free-high-rated");
        run(input1, output1, (double) (0.4));

        String input2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.txt";
        String output2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/paid_high_rated_fp_cfp.txt";
        System.out.println("paid-high-rated");
        run(input2, output2, (double) (0.4));

        String input3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.txt";
        String output3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/no_outliers_free_high_rated_fp_cfp.txt";
        System.out.println("no-outliers free-high-rated");
        run(input3, output3, (double) (0.4));

        String input4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.txt";
        String output4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/no_outliers_paid_high_rated_fp_cfp.txt";
        System.out.println("no-outliers paid-high-rated");
        run(input4, output4, (double) (0.4));

        // double minsup = 0.4; // means a minsup of 2 transaction (we used a relative support)
	}
	
    /*
     * public static String fileToPath(String filename) throws UnsupportedEncodingException {
     * URL url = MainTestFPClose_saveToFile.class.getResource(filename);
     * return java.net.URLDecoder.decode(url.getPath(),"UTF-8");
     * }
     */

    public static void run(String input, String output, double minsup) throws FileNotFoundException, IOException {
        // Applying the algorithm
        AlgoFPClose algo = new AlgoFPClose();
        algo.runAlgorithm(input, output, minsup);
        algo.printStats();
    }
}

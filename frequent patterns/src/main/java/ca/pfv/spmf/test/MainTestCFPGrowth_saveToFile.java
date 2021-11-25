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

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String free = const_path + "/free_high_rated_spmf.txt";
        String free_fp = const_path + "/output/free_high_rated_fp.txt";
        String free_mis = const_path + "/free_high_rated_MIS.txt";
        System.out.println("free-high-rated");
        run(free, free_fp, free_mis);

        String paid = const_path + "/paid_high_rated_spmf.txt";
        String paid_fp = const_path + "/output/paid_high_rated_fp.txt";
        String paid_mis = const_path + "/paid_high_rated_MIS.txt";
        System.out.println("paid-high-rated");
        run(paid, paid_fp, paid_mis);

        // String no_outlier_free = const_path + "/no_outliers_free_high_rated_spmf.txt";
        // String no_outlier_free_fp = const_path + "/output/no_outliers_free_high_rated_fp.txt";
        // String no_outlier_free_mis = const_path + "/no_outliers_free_high_rated_MIS.txt";
        // System.out.println("no-outliers free-high-rated");
        // run(no_outlier_free, no_outlier_free_fp, no_outlier_free_mis);
        //
        // String no_outlier_paid = const_path + "/no_outliers_paid_high_rated_spmf.txt";
        // String no_outlier_paid_fp = const_path + "/output/no_outliers_paid_high_rated_fp.txt";
        // String no_outlier_paid_mis = const_path + "/no_outliers_paid_high_rated_MIS.txt";
        // System.out.println("no-outliers paid-high-rated");
        // run(no_outlier_paid, no_outlier_paid_fp, no_outlier_paid_mis);

        // different price ranges
        String price1 = const_path + "/paid_high_rated_price1.txt";
        String price1_fp = const_path + "/output/price1_fp.txt";
        String price1_mis = const_path + "/price1_MIS.txt";
        System.out.println("price1");
        run(price1, price1_fp, price1_mis);

        String price2 = const_path + "/paid_high_rated_price2.txt";
        String price2_fp = const_path + "/output/price2_fp.txt";
        String price2_mis = const_path + "/price2_MIS.txt";
        System.out.println("price2");
        run(price2, price2_fp, price2_mis);

        String price3 = const_path + "/paid_high_rated_price3.txt";
        String price3_fp = const_path + "/output/price3_fp.txt";
        String price3_mis = const_path + "/price3_MIS.txt";
        System.out.println("price3");
        run(price3, price3_fp, price3_mis);

        String price4 = const_path + "/paid_high_rated_price4.txt";
        String price4_fp = const_path + "/output/price4_fp.txt";
        String price4_mis = const_path + "/price4_MIS.txt";
        System.out.println("price4");
        run(price4, price4_fp, price4_mis);

        // String no_outliers_price1 = const_path + "/no_outliers_paid_high_rated_price1.txt";
        // String no_outliers_price1_fp = const_path + "/output/no_outliers_price1_fp.txt";
        // String no_outliers_price1_mis = const_path + "/no_outliers_price1_MIS.txt";
        // System.out.println("no outliers price1");
        // run(no_outliers_price1, no_outliers_price1_fp, no_outliers_price1_mis);
        //
        // String no_outliers_price2 = const_path + "/no_outliers_paid_high_rated_price2.txt";
        // String no_outliers_price2_fp = const_path + "/output/no_outliers_price2_fp.txt";
        // String no_outliers_price2_mis = const_path + "/no_outliers_price2_MIS.txt";
        // System.out.println("no outliers price2");
        // run(no_outliers_price2, no_outliers_price2_fp, no_outliers_price2_mis);
        //
        // String no_outliers_price3 = const_path + "/no_outliers_paid_high_rated_price3.txt";
        // String no_outliers_price3_fp = const_path + "/output/no_outliers_price3_fp.txt";
        // String no_outliers_price3_mis = const_path + "/no_outliers_price3_MIS.txt";
        // System.out.println("no outliers price3");
        // run(no_outliers_price3, no_outliers_price3_fp, no_outliers_price3_mis);
        //
        // String no_outliers_price4 = const_path + "/no_outliers_paid_high_rated_price4.txt";
        // String no_outliers_price4_fp = const_path + "/output/no_outliers_price4_fp.txt";
        // String no_outliers_price4_mis = const_path + "/no_outliers_price4_MIS.txt";
        // System.out.println("no outliers price4");
        // run(no_outliers_price4, no_outliers_price4_fp, no_outliers_price4_mis);
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

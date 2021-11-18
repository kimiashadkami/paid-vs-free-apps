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

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String free = const_path + "/free_high_rated_spmf.txt";
        String free_fp = const_path + "/output/free_high_rated_fp.txt";
        System.out.println("free-high-rated");
        run(free, free_fp, (double) 0.25);
        // run(free, free_fp, (double) 0.5);

        String paid = const_path + "/paid_high_rated_spmf.txt";
        String paid_fp = const_path + "/output/paid_high_rated_fp.txt";
        System.out.println("paid-high-rated");
        run(paid, paid_fp, (double) 0.25);
        // run(paid, paid_fp, (double) 0.5);

        String no_outlier_free = const_path + "/no_outliers_free_high_rated_spmf.txt";
        String no_outlier_free_fp = const_path + "/output/no_outliers_free_high_rated_fp.txt";
        System.out.println("no-outliers free-high-rated");
        run(no_outlier_free, no_outlier_free_fp, (double) 0.25);
        // run(no_outlier_free, no_outlier_free_fp, (double) 0.5);

        String no_outlier_paid = const_path + "/no_outliers_paid_high_rated_spmf.txt";
        String no_outlier_paid_fp = const_path + "/output/no_outliers_paid_high_rated_fp.txt";
        System.out.println("no-outliers paid-high-rated");
        run(no_outlier_paid, no_outlier_paid_fp, (double) 0.25);
        // run(no_outlier_paid, no_outlier_paid_fp, (double) 0.5);

        // different price ranges
        String price1 = const_path + "/paid_high_rated_price1.txt";
        String price1_fp = const_path + "/output/price1_fp.txt";
        System.out.println("price1");
        run(price1, price1_fp, (double) 0.25);
        // run(price1, price1_fp, (double) 0.5);

        String price2 = const_path + "/paid_high_rated_price2.txt";
        String price2_fp = const_path + "/output/price2_fp.txt";
        System.out.println("price2");
        run(price2, price2_fp, (double) 0.25);
        // run(price2, price2_fp, (double) 0.5);

        String price3 = const_path + "/paid_high_rated_price3.txt";
        String price3_fp = const_path + "/output/price3_fp.txt";
        System.out.println("price3");
        run(price3, price3_fp, (double) 0.25);
        // run(price3, price3_fp, (double) 0.5);

        String price4 = const_path + "/paid_high_rated_price4.txt";
        String price4_fp = const_path + "/output/price4_fp.txt";
        System.out.println("price4");
        run(price4, price4_fp, (double) 0.25);
        // run(price4, price4_fp, (double) 0.5);

        String no_outliers_price1 = const_path + "/no_outliers_paid_high_rated_price1.txt";
        String no_outliers_price1_fp = const_path + "/output/no_outliers_price1_fp.txt";
        System.out.println("no outliers price1");
        run(no_outliers_price1, no_outliers_price1_fp, (double) 0.25);
        // run(no_outliers_price1, no_outliers_price1_fp, (double) 0.5);

        String no_outliers_price2 = const_path + "/no_outliers_paid_high_rated_price2.txt";
        String no_outliers_price2_fp = const_path + "/output/no_outliers_price2_fp.txt";
        System.out.println("no outliers price2");
        run(no_outliers_price2, no_outliers_price2_fp, (double) 0.25);
        // run(no_outliers_price2, no_outliers_price2_fp, (double) 0.5);

        String no_outliers_price3 = const_path + "/no_outliers_paid_high_rated_price3.txt";
        String no_outliers_price3_fp = const_path + "/output/no_outliers_price3_fp.txt";
        System.out.println("no outliers price3");
        run(no_outliers_price3, no_outliers_price3_fp, (double) 0.25);
        // run(no_outliers_price3, no_outliers_price3_fp, (double) 0.5);

        String no_outliers_price4 = const_path + "/no_outliers_paid_high_rated_price4.txt";
        String no_outliers_price4_fp = const_path + "/output/no_outliers_price4_fp.txt";
        System.out.println("no outliers price4");
        run(no_outliers_price4, no_outliers_price4_fp, (double) 0.25);
        // run(no_outliers_price4, no_outliers_price4_fp, (double) 0.5);
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

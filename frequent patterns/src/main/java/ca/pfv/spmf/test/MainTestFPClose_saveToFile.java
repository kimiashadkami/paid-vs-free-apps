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
        String const_path_low = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources/datalow";

        String free = const_path + "/free_high_rated_spmf.txt";
        String free_fp = const_path + "/output/free_high_rated_fp.txt";
        System.out.println("free-high-rated");
        String free_low = const_path_low + "/free_low_rated_spmf.txt";
        String free_fp_low = const_path_low + "/output/free_low_rated_fp.txt";
        System.out.println("free-low-rated");
        run(free, free_fp, (double) 0.25);
        run(free_low, free_fp_low, (double) 0.25);

        String paid = const_path + "/paid_high_rated_spmf.txt";
        String paid_fp = const_path + "/output/paid_high_rated_fp.txt";
        System.out.println("paid-high-rated");
        String paid_low = const_path_low + "/paid_low_rated_spmf.txt";
        String paid_fp_low = const_path_low + "/output/paid_low_rated_fp.txt";
        System.out.println("paid-low-rated");
        run(paid, paid_fp, (double) 0.25);
        run(paid_low, paid_fp_low, (double) 0.25);

        // different price ranges
        String price1 = const_path + "/paid_high_rated_price1.txt";
        String price1_fp = const_path + "/output/price1_fp.txt";
        System.out.println("price1");
        String price1_low = const_path_low + "/paid_low_rated_price1.txt";
        String price1_fp_low = const_path_low + "/output/price1_fp_low.txt";
        run(price1, price1_fp, (double) 0.25);
        run(price1_low, price1_fp_low, (double) 0.25);

        String price2 = const_path + "/paid_high_rated_price2.txt";
        String price2_fp = const_path + "/output/price2_fp.txt";
        System.out.println("price2");
        String price2_low = const_path_low + "/paid_low_rated_price2.txt";
        String price2_fp_low = const_path_low + "/output/price2_fp_low.txt";
        run(price2, price2_fp, (double) 0.25);
        run(price2_low, price2_fp_low, (double) 0.25);

        String price3 = const_path + "/paid_high_rated_price3.txt";
        String price3_fp = const_path + "/output/price3_fp.txt";
        System.out.println("price3");
        String price3_low = const_path_low + "/paid_low_rated_price3.txt";
        String price3_fp_low = const_path_low + "/output/price3_fp_low.txt";
        run(price3, price3_fp, (double) 0.25);
        run(price3_low, price3_fp_low, (double) 0.25);

        String price4 = const_path + "/paid_high_rated_price4.txt";
        String price4_fp = const_path + "/output/price4_fp.txt";
        String price4_low = const_path_low + "/paid_low_rated_price4.txt";
        String price4_fp_low = const_path_low + "/output/price4_fp_low.txt";
        System.out.println("price4");
        run(price4, price4_fp, (double) 0.25);
        run(price4_low, price4_fp_low, (double) 0.25);
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

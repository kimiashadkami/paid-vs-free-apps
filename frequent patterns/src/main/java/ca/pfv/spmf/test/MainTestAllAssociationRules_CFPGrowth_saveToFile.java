package ca.pfv.spmf.test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.associationrules.agrawal94_association_rules.AlgoAgrawalFaster94;
import ca.pfv.spmf.algorithms.frequentpatterns.cfpgrowth.AlgoCFPGrowth;
import ca.pfv.spmf.patterns.itemset_array_integers_with_count.Itemsets;
/**
 * Example of how to mine all association rules with CFPGROWTH and save
 * the result to a file, from the source code.
 * 
 * @author Philippe Fournier-Viger (Copyright 2014)
 */
public class MainTestAllAssociationRules_CFPGrowth_saveToFile {

	public static void main(String [] arg) throws IOException{

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String free = const_path + "/free_high_rated_spmf.txt";
        String free_rules = const_path + "/output/free_high_rated_rules.txt";
        String free_mis = const_path + "/free_high_rated_MIS.txt";
        System.out.println("free-high-rated");
        run(free, free_rules, free_mis);

        String paid = const_path + "/paid_high_rated_spmf.txt";
        String paid_rules = const_path + "/output/paid_high_rated_rules.txt";
        String paid_mis = const_path + "/paid_high_rated_MIS.txt";
        System.out.println("paid-high-rated");
        run(paid, paid_rules, paid_mis);

        String no_outlier_free = const_path + "/no_outliers_free_high_rated_spmf.txt";
        String no_outlier_free_rules = const_path + "/output/no_outliers_free_high_rated_rules.txt";
        String no_outlier_free_mis = const_path + "/no_outliers_free_high_rated_MIS.txt";
        System.out.println("no-outliers free-high-rated");
        run(no_outlier_free, no_outlier_free_rules, no_outlier_free_mis);

        String no_outlier_paid = const_path + "/no_outliers_paid_high_rated_spmf.txt";
        String no_outlier_paid_rules = const_path + "/output/no_outliers_paid_high_rated_rules.txt";
        String no_outlier_paid_mis = const_path + "/no_outliers_paid_high_rated_MIS.txt";
        System.out.println("no-outliers paid-high-rated");
        run(no_outlier_paid, no_outlier_paid_rules, no_outlier_paid_mis);

        // different price ranges
        String price1 = const_path + "/paid_high_rated_price1.txt";
        String price1_rules = const_path + "/output/price1_rules.txt";
        String price1_mis = const_path + "/price1_MIS.txt";
        System.out.println("price1");
        run(price1, price1_rules, price1_mis);

        String price2 = const_path + "/paid_high_rated_price2.txt";
        String price2_rules = const_path + "/output/price2_rules.txt";
        String price2_mis = const_path + "/price2_MIS.txt";
        System.out.println("price2");
        run(price2, price2_rules, price2_mis);

        String price3 = const_path + "/paid_high_rated_price3.txt";
        String price3_rules = const_path + "/output/price3_rules.txt";
        String price3_mis = const_path + "/price3_MIS.txt";
        System.out.println("price3");
        run(price3, price3_rules, price3_mis);

        String price4 = const_path + "/paid_high_rated_price4.txt";
        String price4_rules = const_path + "/output/price4_rules.txt";
        String price4_mis = const_path + "/price4_MIS.txt";
        System.out.println("price4");
        run(price4, price4_rules, price4_mis);

        String no_outliers_price1 = const_path + "/no_outliers_paid_high_rated_price1.txt";
        String no_outliers_price1_rules = const_path + "/output/no_outliers_price1_rules.txt";
        String no_outliers_price1_mis = const_path + "/no_outliers_price1_MIS.txt";
        System.out.println("no outliers price1");
        run(no_outliers_price1, no_outliers_price1_rules, no_outliers_price1_mis);

        String no_outliers_price2 = const_path + "/no_outliers_paid_high_rated_price2.txt";
        String no_outliers_price2_rules = const_path + "/output/no_outliers_price2_rules.txt";
        String no_outliers_price2_mis = const_path + "/no_outliers_price2_MIS.txt";
        System.out.println("no outliers price2");
        run(no_outliers_price2, no_outliers_price2_rules, no_outliers_price2_mis);

        String no_outliers_price3 = const_path + "/no_outliers_paid_high_rated_price3.txt";
        String no_outliers_price3_rules = const_path + "/output/no_outliers_price3_rules.txt";
        String no_outliers_price3_mis = const_path + "/no_outliers_price3_MIS.txt";
        System.out.println("no outliers price3");
        run(no_outliers_price3, no_outliers_price3_rules, no_outliers_price3_mis);

        String no_outliers_price4 = const_path + "/no_outliers_paid_high_rated_price4.txt";
        String no_outliers_price4_rules = const_path + "/output/no_outliers_price4_rules.txt";
        String no_outliers_price4_mis = const_path + "/no_outliers_price4_MIS.txt";
        System.out.println("no outliers price4");
        run(no_outliers_price4, no_outliers_price4_rules, no_outliers_price4_mis);
    }

    public static void run(String input, String output, String MISfile) throws FileNotFoundException, IOException {
        // STEP 1: Applying the CFP-GROWTH algorithm to find frequent itemsets
        AlgoCFPGrowth cfpgrowth = new AlgoCFPGrowth();
        Itemsets patterns = cfpgrowth.runAlgorithm(input, null, MISfile);
        patterns.printItemsets(20);
        int databaseSize = cfpgrowth.getDatabaseSize();
        cfpgrowth.printStats();

        // STEP 2: Generating all rules from the set of frequent itemsets (based on Agrawal & Srikant, 94)
        double minconf = 0.90;
        AlgoAgrawalFaster94 algoAgrawal = new AlgoAgrawalFaster94();
        // AssocRules rules =
        algoAgrawal.runAlgorithm(patterns, output, databaseSize, minconf);
        algoAgrawal.printStats();
        // rules.printRules(20);
	}
	
	public static String fileToPath(String filename) throws UnsupportedEncodingException{
		URL url = MainTestAllAssociationRules_CFPGrowth_saveToFile.class.getResource(filename);
		 return java.net.URLDecoder.decode(url.getPath(),"UTF-8");
	}
}

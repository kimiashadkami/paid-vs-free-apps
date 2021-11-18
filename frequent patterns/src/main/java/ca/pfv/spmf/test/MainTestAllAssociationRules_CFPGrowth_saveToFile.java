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
        String input1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.txt";
        String output1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/free_high_rated_rules_cfp.txt";
        String MISfile1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_MIS.txt";
        System.out.println("free-high-rated");
        run(input1, output1, MISfile1);

        String input2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.txt";
        String output2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/paid_high_rated_rules_cfp.txt";
        String MISfile2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_MIS.txt";
        System.out.println("paid-high-rated");
        run(input2, output2, MISfile2);

        String input3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.txt";
        String output3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/no_outliers_free_high_rated_rules_cfp.txt";
        String MISfile3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_MIS.txt";
        System.out.println("no-outliers free-high-rated");
        run(input3, output3, MISfile3);

        String input4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.txt";
        String output4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/no_outliers_paid_high_rated_rules_cfp.txt";
        String MISfile4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_MIS.txt";
        System.out.println("no-outliers paid-high-rated");
        run(input4, output4, MISfile4);
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

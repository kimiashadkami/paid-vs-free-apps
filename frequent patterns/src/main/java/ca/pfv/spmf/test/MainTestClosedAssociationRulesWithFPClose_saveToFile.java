package ca.pfv.spmf.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import ca.pfv.spmf.algorithms.associationrules.closedrules.AlgoClosedRules_UsingFPClose;
import ca.pfv.spmf.algorithms.frequentpatterns.fpgrowth.AlgoFPClose;
import ca.pfv.spmf.input.transaction_database_list_integers.TransactionDatabase;
import ca.pfv.spmf.patterns.itemset_array_integers_with_count.Itemsets;

/**
 * Example of how to mine closed association rules from the source code.
 * @author Philippe Fournier-Viger (Copyright 2008)
 */
public class MainTestClosedAssociationRulesWithFPClose_saveToFile {

	public static void main(String [] arg) throws IOException{

        String input1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.txt";
        String output1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/free_high_rated_rules_cfp.txt";
        System.out.println("free-high-rated");
        run(input1, output1, (double) (0.4), (double) (0.4));

        String input2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.txt";
        String output2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/paid_high_rated_rules_cfp.txt";
        System.out.println("paid-high-rated");
        run(input2, output2, (double) (0.4), (double) (0.4));

        String input3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.txt";
        String output3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/no_outliers_free_high_rated_rules_cfp.txt";
        System.out.println("no-outliers free-high-rated");
        run(input3, output3, (double) (0.4), (double) (0.4));

        String input4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.txt";
        String output4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/output/closed/no_outliers_paid_high_rated_rules_cfp.txt";
        System.out.println("no-outliers paid-high-rated");
        run(input4, output4, (double) (0.4), (double) (0.4));
	}
	
    public static void run(String input, String output, double min_conf, double min_sup) throws IOException {
        // Loading the transaction database
        TransactionDatabase database = new TransactionDatabase();
        try {
            database.loadFile(input);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // STEP 1: Applying the Charm algorithm to find frequent closed itemsets
        AlgoFPClose algo = new AlgoFPClose();

        // Run the algorithm
        // Note that here we use "null" as output file path because we want to keep the results into memory instead of
        // saving to a file
        Itemsets patterns = algo.runAlgorithm(input, null, min_sup);

        // Show the CFI-Tree for debugging!
        // System.out.println(algo.cfiTree);

        // STEP 2: Generate all rules from the set of frequent itemsets (based on Agrawal & Srikant, 94)
        AlgoClosedRules_UsingFPClose algoClosedRules = new AlgoClosedRules_UsingFPClose();
        algoClosedRules.runAlgorithm(patterns, output, database.size(), min_conf, algo.cfiTree);
        algoClosedRules.printStats();
    }
}

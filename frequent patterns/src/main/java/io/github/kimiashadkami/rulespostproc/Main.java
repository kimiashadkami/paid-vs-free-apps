package io.github.kimiashadkami.rulespostproc;

import java.util.HashMap;

public class Main {

    public static void main(String[] args) {
        
        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";
        String post_processing_txt = const_path + "/postprocessing.txt";

        // free, high-rated
        String free_rules = const_path + "/output/free_high_rated_rules.txt";
        String free_rules_postprocess = const_path + "/postprocess/free_high_rated_rules_postprocess.txt";
        run(post_processing_txt, free_rules, free_rules_postprocess);

        // paid, high-rated
        String paid_rules = const_path + "/output/paid_high_rated_rules.txt";
        String paid_rules_postprocess = const_path + "/postprocess/paid_high_rated_rules_postprocess.txt";
        run(post_processing_txt, paid_rules, paid_rules_postprocess);

        // no outliers, free, high-rated
        // String no_outliers_free_rules = const_path + "/output/no_outliers_free_high_rated_rules.txt";
        // String no_outliers_free_rules_postprocess = const_path
        // + "/postprocess/no_outliers_free_high_rated_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_free_rules, no_outliers_free_rules_postprocess);

        // no outliers, paid, high-rated
        // String no_outliers_paid_rules = const_path + "/output/no_outliers_paid_high_rated_rules.txt";
        // String no_outliers_paid_rules_postprocess = const_path
        // + "/postprocess/no_outliers_paid_high_rated_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_paid_rules, no_outliers_paid_rules_postprocess);

        // different price ranges
        String price1_rules = const_path + "/output/price1_rules.txt";
        String price1_rules_postprocess = const_path + "/postprocess/price1_rules_postprocess.txt";
        run(post_processing_txt, price1_rules, price1_rules_postprocess);

        String price2_rules = const_path + "/output/price2_rules.txt";
        String price2_rules_postprocess = const_path + "/postprocess/price2_rules_postprocess.txt";
        run(post_processing_txt, price2_rules, price2_rules_postprocess);

        String price3_rules = const_path + "/output/price3_rules.txt";
        String price3_rules_postprocess = const_path + "/postprocess/price3_rules_postprocess.txt";
        run(post_processing_txt, price3_rules, price3_rules_postprocess);

        String price4_rules = const_path + "/output/price4_rules.txt";
        String price4_rules_postprocess = const_path + "/postprocess/price4_rules_postprocess.txt";
        run(post_processing_txt, price4_rules, price4_rules_postprocess);

        // String no_outliers_price1_rules = const_path + "/output/no_outliers_price1_rules.txt";
        // String no_outliers_price1_rules_postprocess = const_path
        // + "/postprocess/no_outliers_price1_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_price1_rules, no_outliers_price1_rules_postprocess);
        //
        // String no_outliers_price2_rules = const_path + "/output/no_outliers_price2_rules.txt";
        // String no_outliers_price2_rules_postprocess = const_path
        // + "/postprocess/no_outliers_price2_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_price2_rules, no_outliers_price2_rules_postprocess);
        //
        // String no_outliers_price3_rules = const_path + "/output/no_outliers_price3_rules.txt";
        // String no_outliers_price3_rules_postprocess = const_path
        // + "/postprocess/no_outliers_price3_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_price3_rules, no_outliers_price3_rules_postprocess);
        //
        // String no_outliers_price4_rules = const_path + "/output/no_outliers_price4_rules.txt";
        // String no_outliers_price4_rules_postprocess = const_path
        // + "/postprocess/no_outliers_price4_rules_postprocess.txt";
        // run(post_processing_txt, no_outliers_price4_rules, no_outliers_price4_rules_postprocess);
    }

    public static void run(String post_processing_txt, String frequent_patterns, String output) {
        PostProcess post_process = new PostProcess();
        HashMap<String, String> hashmap = post_process.generateHashMap(post_processing_txt);
        post_process.postprocess(frequent_patterns, hashmap, output);
    }
}
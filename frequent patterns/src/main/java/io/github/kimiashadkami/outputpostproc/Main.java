package io.github.kimiashadkami.outputpostproc;

import java.util.HashMap;

public class Main {
    
    public static void main(String[] args) {

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";
                
        String post_processing_txt = const_path + "/postprocessing.txt";

        // free, high-rated
        String free_fp = const_path + "/output/free_high_rated_fp.txt";
        String free_fp_postprocess = const_path + "/postprocess/free_high_rated_fp_postprocess.txt";
        run(post_processing_txt, free_fp, free_fp_postprocess);

        // paid, high-rated
        String paid_fp = const_path + "/output/paid_high_rated_fp.txt";
        String paid_fp_postprocess = const_path + "/postprocess/paid_high_rated_fp_postprocess.txt";
        run(post_processing_txt, paid_fp, paid_fp_postprocess);

        // no outliers, free, high-rated
        // String no_outliers_free_fp = const_path + "/output/no_outliers_free_high_rated_fp.txt";
        // String no_outliers_free_fp_postprocess = const_path
        // + "/postprocess/no_outliers_free_high_rated_postprocess.txt";
        // run(post_processing_txt, no_outliers_free_fp, no_outliers_free_fp_postprocess);

        // no outliers, paid, high-rated
        // String no_outliers_paid_fp = const_path + "/output/no_outliers_paid_high_rated_fp.txt";
        // String no_outliers_paid_fp_postprocess = const_path
        // + "/postprocess/no_outliers_paid_high_rated_fp_postprocess.txt";
        // run(post_processing_txt, no_outliers_paid_fp, no_outliers_paid_fp_postprocess);
        
        //different price ranges
        String price1_fp = const_path + "/output/price1_fp.txt";
        String price1_fp_postprocess = const_path + "/postprocess/price1_fp.txt";
        run(post_processing_txt, price1_fp, price1_fp_postprocess);

        String price2_fp = const_path + "/output/price2_fp.txt";
        String price2_fp_postprocess = const_path + "/postprocess/price2_fp.txt";
        run(post_processing_txt, price2_fp, price2_fp_postprocess);

        String price3_fp = const_path + "/output/price3_fp.txt";
        String price3_fp_postprocess = const_path + "/postprocess/price3_fp.txt";
        run(post_processing_txt, price3_fp, price3_fp_postprocess);

        String price4_fp = const_path + "/output/price4_fp.txt";
        String price4_fp_postprocess = const_path + "/postprocess/price4_fp.txt";
        run(post_processing_txt, price4_fp, price4_fp_postprocess);

        // no outliers, different price ranges
        // String no_outliers_price1_fp = const_path + "/output/no_outliers_price1_fp.txt";
        // String no_outliers_price1_fp_postprocess = const_path + "/postprocess/no_outliers_price1_fp.txt";
        // run(post_processing_txt, no_outliers_price1_fp, no_outliers_price1_fp_postprocess);
        //
        // String no_outliers_price2_fp = const_path + "/output/no_outliers_price2_fp.txt";
        // String no_outliers_price2_fp_postprocess = const_path + "/postprocess/no_outliers_price2_fp.txt";
        // run(post_processing_txt, no_outliers_price2_fp, no_outliers_price2_fp_postprocess);
        //
        // String no_outliers_price3_fp = const_path + "/output/no_outliers_price3_fp.txt";
        // String no_outliers_price3_fp_postprocess = const_path + "/postprocess/no_outliers_price3_fp.txt";
        // run(post_processing_txt, no_outliers_price3_fp, no_outliers_price3_fp_postprocess);
        //
        // String no_outliers_price4_fp = const_path + "/output/no_outliers_price4_fp.txt";
        // String no_outliers_price4_fp_postprocess = const_path + "/postprocess/no_outliers_price4_fp.txt";
        // run(post_processing_txt, no_outliers_price4_fp, no_outliers_price4_fp_postprocess);
    }

    public static void run(String post_processing_txt, String frequent_patterns, String output) {
        PostProcess post_process = new PostProcess();
        HashMap<String, String> hashmap = post_process.generateHashMap(post_processing_txt);
        post_process.postprocess(frequent_patterns, hashmap, output);
    }
}


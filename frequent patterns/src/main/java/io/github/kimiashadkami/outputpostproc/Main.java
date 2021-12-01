package io.github.kimiashadkami.outputpostproc;

import java.util.HashMap;

public class Main {
    
    public static void main(String[] args) {

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";
        String const_path_low = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources/datalow";
                
        String post_processing_txt = const_path + "/postprocessing.txt";
        String post_processing_txt_low = const_path_low + "/postprocessing_low.txt";

        // free
        String free_fp = const_path + "/output/free_high_rated_fp.txt";
        String free_fp_postprocess = const_path + "/postprocess/free_high_rated_fp_postprocess.txt";
        String free_fp_low = const_path_low + "/output/free_low_rated_fp.txt";
        String free_fp_postprocess_low = const_path_low + "/postprocess/free_low_rated_fp_postprocess.txt";
        run(post_processing_txt, free_fp, free_fp_postprocess, 346017);
        run(post_processing_txt_low, free_fp_low, free_fp_postprocess_low, 7065);

        // paid
        String paid_fp = const_path + "/output/paid_high_rated_fp.txt";
        String paid_fp_postprocess = const_path + "/postprocess/paid_high_rated_fp_postprocess.txt";
        String paid_fp_low = const_path_low + "/output/paid_low_rated_fp.txt";
        String paid_fp_postprocess_low = const_path_low + "/postprocess/paid_low_rated_fp_postprocess.txt";
        run(post_processing_txt, paid_fp, paid_fp_postprocess, 7096);
        run(post_processing_txt_low, paid_fp_low, paid_fp_postprocess_low, 73);

        //different price ranges
        String price1_fp = const_path + "/output/price1_fp.txt";
        String price1_fp_postprocess = const_path + "/postprocess/price1_fp.txt";
        String price1_fp_low = const_path_low + "/output/price1_fp_low.txt";
        String price1_fp_postprocess_low = const_path_low + "/postprocess/price1_fp_low.txt";
        run(post_processing_txt, price1_fp, price1_fp_postprocess, 1454);
        run(post_processing_txt_low, price1_fp_low, price1_fp_postprocess_low, 15);

        String price2_fp = const_path + "/output/price2_fp.txt";
        String price2_fp_postprocess = const_path + "/postprocess/price2_fp.txt";
        String price2_fp_low = const_path_low + "/output/price2_fp_low.txt";
        String price2_fp_postprocess_low = const_path_low + "/postprocess/price2_fp_low.txt";
        run(post_processing_txt, price2_fp, price2_fp_postprocess, 1495);
        run(post_processing_txt_low, price2_fp_low, price2_fp_postprocess_low, 16);

        String price3_fp = const_path + "/output/price3_fp.txt";
        String price3_fp_postprocess = const_path + "/postprocess/price3_fp.txt";
        String price3_fp_low = const_path_low + "/output/price3_fp_low.txt";
        String price3_fp_postprocess_low = const_path_low + "/postprocess/price3_fp_low.txt";
        run(post_processing_txt, price3_fp, price3_fp_postprocess, 1882);
        run(post_processing_txt_low, price3_fp_low, price3_fp_postprocess_low, 17);

        String price4_fp = const_path + "/output/price4_fp.txt";
        String price4_fp_postprocess = const_path + "/postprocess/price4_fp.txt";
        String price4_fp_low = const_path_low + "/output/price4_fp_low.txt";
        String price4_fp_postprocess_low = const_path_low + "/postprocess/price4_fp_low.txt";
        run(post_processing_txt, price4_fp, price4_fp_postprocess, 2266);
        run(post_processing_txt_low, price4_fp_low, price4_fp_postprocess_low, 25);
    }

    public static void run(String post_processing_txt, String frequent_patterns, String output, int total) {
        PostProcess post_process = new PostProcess();
        HashMap<String, String> hashmap = post_process.generateHashMap(post_processing_txt);
        post_process.postprocess(frequent_patterns, hashmap, output, total);
    }
}


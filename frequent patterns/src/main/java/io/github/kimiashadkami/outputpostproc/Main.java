package io.github.kimiashadkami.outputpostproc;

import java.util.HashMap;

public class Main {
    
    public static void main(String[] args) {

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources";

        String post_processing_txt = const_path + "/postprocessing.txt";

        // free, high-rated
        String frequent_patterns1 = const_path + "/output/free_high_rated_fp_cfp.txt";

        String output1 = const_path + "/postprocess/free_high_rated_fp_postprocess.txt";

        run(post_processing_txt, frequent_patterns1, output1);

        // paid, high-rated
        String frequent_patterns2 = const_path + "/output/paid_high_rated_fp_cfp.txt";

        String output2 = const_path + "/postprocess/paid_high_rated_fp_postprocess.txt";

        run(post_processing_txt, frequent_patterns2, output2);

        // no outliers, free, high-rated
        String frequent_patterns3 = const_path + "/output/no_outliers_free_high_rated_fp_cfp.txt";

        String output3 = const_path + "/postprocess/no_outliers_free_high_rated_fp_postprocess.txt";

        run(post_processing_txt, frequent_patterns3, output3);

        // no outliers, paid, high-rated
        String frequent_patterns4 = const_path + "/output/no_outliers_paid_high_rated_fp_cfp.txt";

        String output4 = const_path + "/postprocess/no_outliers_paid_high_rated_fp_postprocess.txt";

        run(post_processing_txt, frequent_patterns4, output4);
    }

    public static void run(String post_processing_txt, String frequent_patterns, String output) {
        PostProcess post_process = new PostProcess();
        HashMap<String, String> hashmap = post_process.generateHashMap(post_processing_txt);
        post_process.postprocess(frequent_patterns, hashmap, output);
    }
}


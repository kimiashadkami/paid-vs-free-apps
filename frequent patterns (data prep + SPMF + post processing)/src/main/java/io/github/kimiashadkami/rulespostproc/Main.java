package io.github.kimiashadkami.rulespostproc;

import java.util.HashMap;

public class Main {

    public static void main(String[] args) {
        
        String post_processing_txt = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/postprocessing.txt";

        // free, high-rated
        String association_rules1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/output/free_high_rated_rules_cfp.txt";

        String output1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/postprocess/free_high_rated_rules_postprocess.txt";

        run(post_processing_txt, association_rules1, output1);

        // paid, high-rated
        String association_rules2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/output/paid_high_rated_rules_cfp.txt";

        String output2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/postprocess/paid_high_rated_rules_postprocess.txt";

        run(post_processing_txt, association_rules2, output2);

        // no outliers, free, high-rated
        String association_rules3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/output/no_outliers_free_high_rated_rules_cfp.txt";

        String output3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/postprocess/no_outliers_free_high_rated_rules_postprocess.txt";

        run(post_processing_txt, association_rules3, output3);

        // no outliers, paid, high-rated
        String association_rules4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/output/no_outliers_paid_high_rated_rules_cfp.txt";

        String output4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/"
                + "src/main/resources/postprocess/no_outliers_paid_high_rated_rules_postprocess.txt";

        run(post_processing_txt, association_rules4, output4);
    }

    public static void run(String post_processing_txt, String frequent_patterns, String output) {
        PostProcess post_process = new PostProcess();
        HashMap<String, String> hashmap = post_process.generateHashMap(post_processing_txt);
        post_process.postprocess(frequent_patterns, hashmap, output);
    }
}


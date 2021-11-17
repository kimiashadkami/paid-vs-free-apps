package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        String str1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.xlsx";
        String str2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.txt";

        String str3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.xlsx";
        String str4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.txt";

        String str5 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.xlsx";
        String str6 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.txt";

        String str7 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.xlsx";
        String str8 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.txt";

        String mis1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_MIS.txt";
        String mis2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_MIS.txt";
        String mis3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_MIS.txt";
        String mis4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_MIS.txt";

        Prep prep = new Prep();
        int row_num1 = prep.prepData(str1, str2);
        int row_num2 = prep.prepData(str3, str4);
        int row_num3 = prep.prepData(str5, str6);
        int row_num4 = prep.prepData(str7, str8);

        MIS mis = new MIS();
        mis.generateMIS(mis1, (int) (row_num1));
        mis.generateMIS(mis2, (int) (row_num2));
        mis.generateMIS(mis3, (int) (row_num3));
        mis.generateMIS(mis4, (int) (row_num4));
    }

}


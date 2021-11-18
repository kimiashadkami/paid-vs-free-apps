package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        String str_xlsx1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.xlsx";
        String str_txt1 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/free_high_rated_spmf.txt";

        String str_xlsx2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.xlsx";
        String str_txt2 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/paid_high_rated_spmf.txt";

        String str_xlsx3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.xlsx";
        String str_txt3 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_free_high_rated_spmf.txt";

        String str_xlsx4 = "D:/eclipse/workspace/paid-vs-free-apps/"
                + "frequent patterns (data prep + SPMF + post processing)/src/main/resources/no_outliers_paid_high_rated_spmf.xlsx";
        String str_txt4 = "D:/eclipse/workspace/paid-vs-free-apps/"
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
        prep.prepData(str_xlsx1, str_txt1);
        prep.prepData(str_xlsx2, str_txt2);
        prep.prepData(str_xlsx3, str_txt3);
        prep.prepData(str_xlsx4, str_txt4);

        MIS mis = new MIS();
        mis.generateMIS(mis1, prep.getRowNum(str_xlsx1));
        mis.generateMIS(mis2, prep.getRowNum(str_xlsx2));
        mis.generateMIS(mis3, prep.getRowNum(str_xlsx3));
        mis.generateMIS(mis4, prep.getRowNum(str_xlsx4));
    }

}


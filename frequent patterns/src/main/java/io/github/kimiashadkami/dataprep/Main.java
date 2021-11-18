package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String str_xlsx1 = const_path + "/free_high_rated_spmf.xlsx";
        String str_txt1 = const_path + "/free_high_rated_spmf.txt";

        String str_xlsx2 = const_path + "/paid_high_rated_spmf.xlsx";
        String str_txt2 = const_path + "/paid_high_rated_spmf.txt";

        String str_xlsx3 = const_path + "/no_outliers_free_high_rated_spmf.xlsx";
        String str_txt3 = const_path + "/no_outliers_free_high_rated_spmf.txt";

        String str_xlsx4 = const_path + "/no_outliers_paid_high_rated_spmf.xlsx";
        String str_txt4 = const_path + "/no_outliers_paid_high_rated_spmf.txt";

        String mis1 = const_path + "/free_high_rated_MIS.txt";
        String mis2 = const_path + "/paid_high_rated_MIS.txt";
        String mis3 = const_path + "/no_outliers_free_high_rated_MIS.txt";
        String mis4 = const_path + "/no_outliers_paid_high_rated_MIS.txt";

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


package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        String str1 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/free_high_rated_spmf.xlsx";
        String str2 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/free_high_rated_spmf.txt";

        String str3 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/paid_high_rated_spmf.xlsx";
        String str4 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/paid_high_rated_spmf.txt";

        String str5 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_free_high_rated_spmf.xlsx";
        String str6 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_free_high_rated_spmf.txt";

        String str7 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_paid_high_rated_spmf.xlsx";
        String str8 = "D:/eclipse/workspace/freevspaidapps/src/main/resources/no_outliers_paid_high_rated_spmf.txt";

        String str = "D:/eclipse/workspace/freevspaidapps/src/main/resources/MIS.txt";

        Prep prep = new Prep();
        prep.prepData(str1, str2);
        prep.prepData(str3, str4);
        prep.prepData(str5, str6);
        prep.prepData(str7, str8);

        MIS mis = new MIS();
        mis.generateMIS(str, 50);
    }

}


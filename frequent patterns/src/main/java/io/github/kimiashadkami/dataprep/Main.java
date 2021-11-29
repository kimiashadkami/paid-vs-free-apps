package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        // dir
        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String free_xlsx = const_path + "/free_high_rated_spmf.xlsx";
        String free_txt = const_path + "/free_high_rated_spmf.txt";

        String paid_xlsx = const_path + "/paid_high_rated_spmf.xlsx";
        String paid_txt = const_path + "/paid_high_rated_spmf.txt";

        // dir - different price ranges
        String price1_xlsx = const_path + "/paid_high_rated_price1.xlsx";
        String price1_txt = const_path + "/paid_high_rated_price1.txt";

        String price2_xlsx = const_path + "/paid_high_rated_price2.xlsx";
        String price2_txt = const_path + "/paid_high_rated_price2.txt";

        String price3_xlsx = const_path + "/paid_high_rated_price3.xlsx";
        String price3_txt = const_path + "/paid_high_rated_price3.txt";

        String price4_xlsx = const_path + "/paid_high_rated_price4.xlsx";
        String price4_txt = const_path + "/paid_high_rated_price4.txt";

        // converting to txt
        Prep prep = new Prep();
        prep.prepData(free_xlsx, free_txt);
        prep.prepData(paid_xlsx, paid_txt);

        prep.prepData(price1_xlsx, price1_txt);
        prep.prepData(price2_xlsx, price2_txt);
        prep.prepData(price3_xlsx, price3_txt);
        prep.prepData(price4_xlsx, price4_txt);

    }

}


package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        // dir
        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";
        String const_path_low = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources/datalow";

        String free_xlsx = const_path + "/free_high_rated_spmf.xlsx";
        String free_txt = const_path + "/free_high_rated_spmf.txt";
        String free_xlsx_low = const_path_low + "/free_low_rated_spmf.xlsx";
        String free_txt_low = const_path_low + "/free_low_rated_spmf.txt";

        String paid_xlsx = const_path + "/paid_high_rated_spmf.xlsx";
        String paid_txt = const_path + "/paid_high_rated_spmf.txt";
        String paid_xlsx_low = const_path_low + "/paid_low_rated_spmf.xlsx";
        String paid_txt_low = const_path_low + "/paid_low_rated_spmf.txt";

        // dir - different price ranges
        String price1_xlsx = const_path + "/paid_high_rated_price1.xlsx";
        String price1_txt = const_path + "/paid_high_rated_price1.txt";
        String price1_xlsx_low = const_path_low + "/paid_low_rated_price1.xlsx";
        String price1_txt_low = const_path_low + "/paid_low_rated_price1.txt";

        String price2_xlsx = const_path + "/paid_high_rated_price2.xlsx";
        String price2_txt = const_path + "/paid_high_rated_price2.txt";
        String price2_xlsx_low = const_path_low + "/paid_low_rated_price2.xlsx";
        String price2_txt_low = const_path_low + "/paid_low_rated_price2.txt";

        String price3_xlsx = const_path + "/paid_high_rated_price3.xlsx";
        String price3_txt = const_path + "/paid_high_rated_price3.txt";
        String price3_xlsx_low = const_path_low + "/paid_low_rated_price3.xlsx";
        String price3_txt_low = const_path_low + "/paid_low_rated_price3.txt";

        String price4_xlsx = const_path + "/paid_high_rated_price4.xlsx";
        String price4_txt = const_path + "/paid_high_rated_price4.txt";
        String price4_xlsx_low = const_path_low + "/paid_low_rated_price4.xlsx";
        String price4_txt_low = const_path_low + "/paid_low_rated_price4.txt";

        // converting to txt
        Prep prep = new Prep();
        prep.prepData(free_xlsx, free_txt);
        prep.prepData(paid_xlsx, paid_txt);
        prep.prepData(free_xlsx_low, free_txt_low);
        prep.prepData(paid_xlsx_low, paid_txt_low);

        prep.prepData(price1_xlsx, price1_txt);
        prep.prepData(price2_xlsx, price2_txt);
        prep.prepData(price3_xlsx, price3_txt);
        prep.prepData(price4_xlsx, price4_txt);

        prep.prepData(price1_xlsx_low, price1_txt_low);
        prep.prepData(price2_xlsx_low, price2_txt_low);
        prep.prepData(price3_xlsx_low, price3_txt_low);
        prep.prepData(price4_xlsx_low, price4_txt_low);
    }
}


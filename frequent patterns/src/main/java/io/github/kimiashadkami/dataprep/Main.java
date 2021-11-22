package io.github.kimiashadkami.dataprep;

public class Main {

    public static void main(String[] args) {

        // dir
        String const_path = "D:/eclipse/workspace/paid-vs-free-apps/frequent patterns/src/main/resources";

        String free_xlsx = const_path + "/free_high_rated_spmf.xlsx";
        String free_txt = const_path + "/free_high_rated_spmf.txt";

        String paid_xlsx = const_path + "/paid_high_rated_spmf.xlsx";
        String paid_txt = const_path + "/paid_high_rated_spmf.txt";

        String no_outliers_free_xlsx = const_path + "/no_outliers_free_high_rated_spmf.xlsx";
        String no_outliers_free_txt = const_path + "/no_outliers_free_high_rated_spmf.txt";

        String no_outliers_paid_xlsx = const_path + "/no_outliers_paid_high_rated_spmf.xlsx";
        String no_outliers_paid_txt = const_path + "/no_outliers_paid_high_rated_spmf.txt";

        // dir - different price ranges
        String price1_xlsx = const_path + "/paid_high_rated_price1.xlsx";
        String price1_txt = const_path + "/paid_high_rated_price1.txt";

        String price2_xlsx = const_path + "/paid_high_rated_price2.xlsx";
        String price2_txt = const_path + "/paid_high_rated_price2.txt";

        String price3_xlsx = const_path + "/paid_high_rated_price3.xlsx";
        String price3_txt = const_path + "/paid_high_rated_price3.txt";

        String price4_xlsx = const_path + "/paid_high_rated_price4.xlsx";
        String price4_txt = const_path + "/paid_high_rated_price4.txt";

        // different price ranges with no outliers
        String no_outliers_price1_xlsx = const_path + "/no_outliers_paid_high_rated_price1.xlsx";
        String no_outliers_price1_txt = const_path + "/no_outliers_paid_high_rated_price1.txt";

        String no_outliers_price2_xlsx = const_path + "/no_outliers_paid_high_rated_price2.xlsx";
        String no_outliers_price2_txt = const_path + "/no_outliers_paid_high_rated_price2.txt";

        String no_outliers_price3_xlsx = const_path + "/no_outliers_paid_high_rated_price3.xlsx";
        String no_outliers_price3_txt = const_path + "/no_outliers_paid_high_rated_price3.txt";

        String no_outliers_price4_xlsx = const_path + "/no_outliers_paid_high_rated_price4.xlsx";
        String no_outliers_price4_txt = const_path + "/no_outliers_paid_high_rated_price4.txt";

        // MIS dir
        String free_mis = const_path + "/free_high_rated_MIS.txt";
        String paid_mis = const_path + "/paid_high_rated_MIS.txt";
        String no_outliers_free_mis = const_path + "/no_outliers_free_high_rated_MIS.txt";
        String no_outliers_paid_mis = const_path + "/no_outliers_paid_high_rated_MIS.txt";

        // MIS - different price ranges dir
        String price1_mis = const_path + "/price1_MIS.txt";
        String price2_mis = const_path + "/price2_MIS.txt";
        String price3_mis = const_path + "/price3_MIS.txt";
        String price4_mis = const_path + "/price4_MIS.txt";

        // MIS - different price ranges, no outliers dir
        String no_outliers_price1_mis = const_path + "/no_outliers_price1_MIS.txt";
        String no_outliers_price2_mis = const_path + "/no_outliers_price2_MIS.txt";
        String no_outliers_price3_mis = const_path + "/no_outliers_price3_MIS.txt";
        String no_outliers_price4_mis = const_path + "/no_outliers_price4_MIS.txt";

        // converting to txt
        Prep prep = new Prep();
        prep.prepData(free_xlsx, free_txt);
        prep.prepData(paid_xlsx, paid_txt);
        prep.prepData(no_outliers_free_xlsx, no_outliers_free_txt);
        prep.prepData(no_outliers_paid_xlsx, no_outliers_paid_txt);

        prep.prepData(price1_xlsx, price1_txt);
        prep.prepData(price2_xlsx, price2_txt);
        prep.prepData(price3_xlsx, price3_txt);
        prep.prepData(price4_xlsx, price4_txt);

        prep.prepData(no_outliers_price1_xlsx, no_outliers_price1_txt);
        prep.prepData(no_outliers_price2_xlsx, no_outliers_price2_txt);
        prep.prepData(no_outliers_price3_xlsx, no_outliers_price3_txt);
        prep.prepData(no_outliers_price4_xlsx, no_outliers_price4_txt);

        // generating MIS
        MIS mis = new MIS();
        // mis.generateMIS(free_mis, prep.getRowNum(free_xlsx));
        // mis.generateMIS(paid_mis, prep.getRowNum(paid_xlsx));
        // mis.generateMIS(no_outliers_free_mis, prep.getRowNum(no_outliers_free_xlsx));
        // mis.generateMIS(no_outliers_paid_mis, prep.getRowNum(no_outliers_paid_xlsx));
        //
        // // different price ranges
        // mis.generateMIS(price1_mis, prep.getRowNum(price1_xlsx));
        // mis.generateMIS(price2_mis, prep.getRowNum(price2_xlsx));
        // mis.generateMIS(price3_mis, prep.getRowNum(price3_xlsx));
        // mis.generateMIS(price4_mis, prep.getRowNum(price4_xlsx));
        //
        // mis.generateMIS(no_outliers_price1_mis, prep.getRowNum(no_outliers_price1_xlsx));
        // mis.generateMIS(no_outliers_price2_mis, prep.getRowNum(no_outliers_price2_xlsx));
        // mis.generateMIS(no_outliers_price3_mis, prep.getRowNum(no_outliers_price3_xlsx));
        // mis.generateMIS(no_outliers_price4_mis, prep.getRowNum(no_outliers_price4_xlsx));

        // unified MIS

        // 50%
        // mis.generateUnifiedMIS(free_mis, (int) prep.getRowNum(free_xlsx) / 2);
        // mis.generateUnifiedMIS(paid_mis, (int) prep.getRowNum(paid_xlsx) / 2);
        // mis.generateUnifiedMIS(no_outliers_free_mis, (int) prep.getRowNum(no_outliers_free_xlsx) / 2);
        // mis.generateUnifiedMIS(no_outliers_paid_mis, (int) prep.getRowNum(no_outliers_paid_xlsx) / 2);
        //
        // mis.generateUnifiedMIS(price1_mis, (int) prep.getRowNum(price1_xlsx) / 2);
        // mis.generateUnifiedMIS(price2_mis, (int) prep.getRowNum(price2_xlsx) / 2);
        // mis.generateUnifiedMIS(price3_mis, (int) prep.getRowNum(price3_xlsx) / 2);
        // mis.generateUnifiedMIS(price4_mis, (int) prep.getRowNum(price4_xlsx) / 2);
        //
        // mis.generateUnifiedMIS(no_outliers_price1_mis, (int) prep.getRowNum(no_outliers_price1_xlsx) / 2);
        // mis.generateUnifiedMIS(no_outliers_price2_mis, (int) prep.getRowNum(no_outliers_price2_xlsx) / 2);
        // mis.generateUnifiedMIS(no_outliers_price3_mis, (int) prep.getRowNum(no_outliers_price3_xlsx) / 2);
        // mis.generateUnifiedMIS(no_outliers_price4_mis, (int) prep.getRowNum(no_outliers_price4_xlsx) / 2);

        // 40%
        // mis.generateUnifiedMIS(free_mis, (int) (prep.getRowNum(free_xlsx) * 0.4));
        // mis.generateUnifiedMIS(paid_mis, (int) (prep.getRowNum(paid_xlsx) * 0.4));
        // mis.generateUnifiedMIS(no_outliers_free_mis, (int) (prep.getRowNum(no_outliers_free_xlsx) * 0.4));
        // mis.generateUnifiedMIS(no_outliers_paid_mis, (int) (prep.getRowNum(no_outliers_paid_xlsx) * 0.4));
        //
        // mis.generateUnifiedMIS(price1_mis, (int) (prep.getRowNum(price1_xlsx) * 0.4));
        // mis.generateUnifiedMIS(price2_mis, (int) (prep.getRowNum(price2_xlsx) * 0.4));
        // mis.generateUnifiedMIS(price3_mis, (int) (prep.getRowNum(price3_xlsx) * 0.4));
        // mis.generateUnifiedMIS(price4_mis, (int) (prep.getRowNum(price4_xlsx) * 0.4));
        //
        // mis.generateUnifiedMIS(no_outliers_price1_mis, (int) (prep.getRowNum(no_outliers_price1_xlsx) * 0.4));
        // mis.generateUnifiedMIS(no_outliers_price2_mis, (int) (prep.getRowNum(no_outliers_price2_xlsx) * 0.4));
        // mis.generateUnifiedMIS(no_outliers_price3_mis, (int) (prep.getRowNum(no_outliers_price3_xlsx) * 0.4));
        // mis.generateUnifiedMIS(no_outliers_price4_mis, (int) (prep.getRowNum(no_outliers_price4_xlsx) * 0.4));

        // 30%
        // mis.generateUnifiedMIS(free_mis, (int) (prep.getRowNum(free_xlsx) * 0.3));
        // mis.generateUnifiedMIS(paid_mis, (int) (prep.getRowNum(paid_xlsx) * 0.3));
        // mis.generateUnifiedMIS(no_outliers_free_mis, (int) (prep.getRowNum(no_outliers_free_xlsx) * 0.3));
        // mis.generateUnifiedMIS(no_outliers_paid_mis, (int) (prep.getRowNum(no_outliers_paid_xlsx) * 0.3));
        //
        // mis.generateUnifiedMIS(price1_mis, (int) (prep.getRowNum(price1_xlsx) * 0.3));
        // mis.generateUnifiedMIS(price2_mis, (int) (prep.getRowNum(price2_xlsx) * 0.3));
        // mis.generateUnifiedMIS(price3_mis, (int) (prep.getRowNum(price3_xlsx) * 0.3));
        // mis.generateUnifiedMIS(price4_mis, (int) (prep.getRowNum(price4_xlsx) * 0.3));
        //
        // mis.generateUnifiedMIS(no_outliers_price1_mis, (int) (prep.getRowNum(no_outliers_price1_xlsx) * 0.3));
        // mis.generateUnifiedMIS(no_outliers_price2_mis, (int) (prep.getRowNum(no_outliers_price2_xlsx) * 0.3));
        // mis.generateUnifiedMIS(no_outliers_price3_mis, (int) (prep.getRowNum(no_outliers_price3_xlsx) * 0.3));
        // mis.generateUnifiedMIS(no_outliers_price4_mis, (int) (prep.getRowNum(no_outliers_price4_xlsx) * 0.3));

        // 25%
        mis.generateUnifiedMIS(free_mis, (int) prep.getRowNum(free_xlsx) / 4);
        mis.generateUnifiedMIS(paid_mis, (int) prep.getRowNum(paid_xlsx) / 4);
        mis.generateUnifiedMIS(no_outliers_free_mis, (int) prep.getRowNum(no_outliers_free_xlsx) / 4);
        mis.generateUnifiedMIS(no_outliers_paid_mis, (int) prep.getRowNum(no_outliers_paid_xlsx) / 4);

        mis.generateUnifiedMIS(price1_mis, (int) prep.getRowNum(price1_xlsx) / 4);
        mis.generateUnifiedMIS(price2_mis, (int) prep.getRowNum(price2_xlsx) / 4);
        mis.generateUnifiedMIS(price3_mis, (int) prep.getRowNum(price3_xlsx) / 4);
        mis.generateUnifiedMIS(price4_mis, (int) prep.getRowNum(price4_xlsx) / 4);

        mis.generateUnifiedMIS(no_outliers_price1_mis, (int) prep.getRowNum(no_outliers_price1_xlsx) / 4);
        mis.generateUnifiedMIS(no_outliers_price2_mis, (int) prep.getRowNum(no_outliers_price2_xlsx) / 4);
        mis.generateUnifiedMIS(no_outliers_price3_mis, (int) prep.getRowNum(no_outliers_price3_xlsx) / 4);
        mis.generateUnifiedMIS(no_outliers_price4_mis, (int) prep.getRowNum(no_outliers_price4_xlsx) / 4);
    }

}


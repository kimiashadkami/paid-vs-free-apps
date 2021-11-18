package io.github.kimiashadkami.dataprep;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Prep {

    // return row number
    public int getRowNum(String dir_read) {
        int row_num = 0;
        try {

            File file = new File(dir_read);
            FileInputStream file_input_stream = new FileInputStream(file);

            // referring to the .csv files
            XSSFWorkbook xss_workbook = new XSSFWorkbook(file_input_stream);
            XSSFSheet xss_sheet = xss_workbook.getSheetAt(0);

            Iterator<Row> iterator_row = xss_sheet.iterator();

            while (iterator_row.hasNext()) {
                row_num++;
                iterator_row.next();
            }
            xss_workbook.close();

        } catch (IOException e) {
            System.out.println("An error occured.");
            e.printStackTrace();
        }
        return --row_num;
    }

    // prep data
    public void prepData(String dir_read, String dir_write) {

        try {

            File file = new File(dir_read);
            FileInputStream file_input_stream = new FileInputStream(file);

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            // refering to the .csv files
            XSSFWorkbook xss_workbook = new XSSFWorkbook(file_input_stream);
            XSSFSheet xss_sheet = xss_workbook.getSheetAt(0);

            Iterator<Row> iterator_row = xss_sheet.iterator();
            CellType celltype;
            int value = 0;

            while (iterator_row.hasNext()) {

                Row row = iterator_row.next();
                Iterator<Cell> iterator_col = row.cellIterator();

                while (iterator_col.hasNext()) {

                    Cell cell = iterator_col.next();
                    celltype = cell.getCellType();

                    if (celltype.equals(CellType.valueOf("NUMERIC"))) {

                        value = (int) cell.getNumericCellValue();
                        buffered_writer.append(Integer.toString(value) + " ");
                    }
                }
                buffered_writer.append("\n");
            }
            buffered_writer.close();
            xss_workbook.close();

        } catch (IOException e) {
            System.out.println("An error occured.");
            e.printStackTrace();
        }
    }
}
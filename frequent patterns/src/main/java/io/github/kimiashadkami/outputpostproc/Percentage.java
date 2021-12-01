package io.github.kimiashadkami.outputpostproc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.Scanner;

public class Percentage {

    public void writePercentage(String dir_read, String dir_write, int total) {

        try {

            File file_read = new File(dir_read);
            FileInputStream file_input_stream;

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            file_input_stream = new FileInputStream(file_read);
            Scanner scanner = new Scanner(file_input_stream);

            int charat;
            int end;
            int num;
            float percentage;

            while (scanner.hasNext()) {
                
                String str = scanner.nextLine();

                // the number
                charat = str.indexOf("#");
                charat = charat + 6;
                end = str.length();
                end--;
                String str_num = str.substring(charat, end);
                num = Integer.parseInt(str_num);

                // write the percentage
                percentage = num * 100 / total;
                String write_str = str + " " + percentage;
                buffered_writer.append(write_str);
                buffered_writer.append("\n");
            }
            buffered_writer.close();
            scanner.close();
        }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}


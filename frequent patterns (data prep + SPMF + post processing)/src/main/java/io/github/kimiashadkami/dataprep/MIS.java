package io.github.kimiashadkami.dataprep;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class MIS {

    public void generateMIS(String dir_write, int k) {

        try {

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            for (int i = 0; i < 103; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString(k));
                buffered_writer.append("\n");
            }
            for (int i = 2010; i < 2022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString(k));
                buffered_writer.append("\n");
            }
            for (int i = 92010; i < 92022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString(k));
                buffered_writer.append("\n");
            }
            buffered_writer.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}


package io.github.kimiashadkami.dataprep;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class MIS {

    public void generateMIS(String dir_write, int k) {

        try {

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            for (int i = 40; i < 51; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 10)));
                buffered_writer.append("\n");
            }
            for (int i = 51; i < 99; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 48)));
                buffered_writer.append("\n");
            }
            for (int i = 99; i < 103; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 4)));
                buffered_writer.append("\n");
            }
            for (int i = 103; i < 125; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 22)));
                buffered_writer.append("\n");
            }
            for (int i = 125; i < 129; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 4)));
                buffered_writer.append("\n");
            }
            for (int i = 129; i < 133; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 4)));
                buffered_writer.append("\n");
            }
            for (int i = 133; i < 141; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 8)));
                buffered_writer.append("\n");
            }
            for (int i = 141; i < 147; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 6)));
                buffered_writer.append("\n");
            }
            for (int i = 147; i < 149; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 2)));
                buffered_writer.append("\n");
            }
            for (int i = 149; i < 151; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 2)));
                buffered_writer.append("\n");
            }
            for (int i = 151; i < 153; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 2)));
                buffered_writer.append("\n");
            }
            for (int i = 2010; i < 2022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 12)));
                buffered_writer.append("\n");
            }
            for (int i = 92010; i < 92022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k / 12)));
                buffered_writer.append("\n");
            }
            buffered_writer.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void generateUnifiedMIS(String dir_write, int k) {

        try {

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            for (int i = 40; i < 153; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k)));
                buffered_writer.append("\n");
            }
            for (int i = 2010; i < 2022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k)));
                buffered_writer.append("\n");
            }
            for (int i = 92010; i < 92022; i++) {
                buffered_writer.append(Integer.toString(i));
                buffered_writer.append(" ");
                buffered_writer.append(Integer.toString((int) (k)));
                buffered_writer.append("\n");
            }
            buffered_writer.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}


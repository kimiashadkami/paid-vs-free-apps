package io.github.kimiashadkami.outputpostproc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Scanner;

public class PostProcess {

    public HashMap<String, String> generateHashMap(String dir_read) {

        HashMap<String, String> hashmap = new HashMap<>();

        File file_read = new File(dir_read);
        FileInputStream file_input_stream;

        try {
            
            file_input_stream = new FileInputStream(file_read);
            Scanner scanner = new Scanner(file_input_stream);
            
            while(scanner.hasNext()) {

                // the odd lines reflect the keys and the even lines reflect the values
                String[] keys = scanner.nextLine().split(" ");
                String value = scanner.nextLine();

                for(int k = 0; k < keys.length; k++) {
                    hashmap.put(keys[k], value);
                }
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return hashmap;
    }

    public void postprocess(String dir_read, HashMap<String, String> hashmap, String dir_write, int total) {

        File file = new File(dir_read);

        try {

            FileInputStream file_input_stream = new FileInputStream(file);
            Scanner scanner = new Scanner(file_input_stream);

            FileWriter file_writer = new FileWriter(dir_write);
            BufferedWriter buffered_writer = new BufferedWriter(file_writer);

            String str;
            String sub_str;
            int hashtag_index;

            while (scanner.hasNext()) {

                str = scanner.nextLine();
                hashtag_index = str.indexOf("#");
                sub_str = str.substring(0, hashtag_index);
                String[] str_array = sub_str.split(" ");
                
                for(int i = 0; i < str_array.length; i++) {

                    String value;
                    if (hashmap.get(str_array[i]) == null) {
                        if(str_array[i].startsWith("9")) {
                            value = "Last.Update";
                            buffered_writer.append(value + "(" + str_array[i].substring(1) + "), ");
                        } else {
                            value = "Released";
                            buffered_writer.append(value + "(" + str_array[i] + "), ");
                        }
                    }
                    else {
                        value = hashmap.get(str_array[i]);
                        buffered_writer.append(value + "(" + str_array[i] + "), ");
                    }
                    
                }

                buffered_writer.append(str.substring(hashtag_index));

                // the number
                int charat = hashtag_index + 6;
                System.out.println("h " + hashtag_index);
                int end = str.length();
                end--;
                System.out.println("end " + end);
                String str_num = str.substring(charat);
                System.out.println("str_num " + str_num);
                System.out.println("str " + str);
                int num = Integer.parseInt(str_num);

                // write the percentage
                int percentage = num * 100 / total;
                String str_percentage = String.valueOf(percentage);
                buffered_writer.append(" [" + str_percentage + "%]");

                buffered_writer.append("\n");
            }
            scanner.close();
            buffered_writer.close();

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}


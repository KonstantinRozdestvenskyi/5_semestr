package com.example;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

import au.com.bytecode.opencsv.CSVReader;

public class CSVreader {
    public static HashMap<Integer, Item> read(String path) throws IOException{
        //Build reader instance
      //Read data.csv
      //Default seperator is comma
      //Default quote character is double quote
      //Start reading from line number 2 (line numbers start from zero)
      CSVReader reader = new CSVReader(new FileReader(path, StandardCharsets.UTF_8), ';' , '"' , 1);
      //Read CSV line by line and use the string array as you want
      String[] nextLine;
      HashMap<Integer, Item> Date = new HashMap<>();
      int i = 0;
      while ((nextLine = reader.readNext()) != null) {
            if (nextLine != null) {
                //Verifying the read data here
                int house = Integer.parseInt(nextLine[2]);
                int floor = Integer.parseInt(nextLine[3]);
                Date.put(i, new Item(nextLine[0], nextLine[1], house, floor));
                i++;
            }
       }
       return Date;
    }
}

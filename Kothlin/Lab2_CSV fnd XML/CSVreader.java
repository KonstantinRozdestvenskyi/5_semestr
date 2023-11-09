package com.example;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

import au.com.bytecode.opencsv.CSVReader;

public class CSVreader {
    public static HashMap<Integer, Item> read(String path) throws IOException{
        //Создаём экземпляр reader
        //Прочитать файл по пути path
        //Разделитель - точка с запятой
        //Символ кавычки по умолчанию - двойная кавычка
        //Начинаем чтение со строки № 2 (номера строк начинаются с нуля)
      CSVReader reader = new CSVReader(new FileReader(path, StandardCharsets.UTF_8), ';' , '"' , 1);
      //Считываем CSV построчно и используем массив строк, вытаскивая из него поля класса Item
      String[] nextLine;
      HashMap<Integer, Item> Date = new HashMap<>();//Сюда мы запихнём все адреса
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

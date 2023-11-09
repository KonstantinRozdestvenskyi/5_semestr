package com.example;

import java.util.ArrayList;
import java.util.HashMap;

public class File_processor {
   File_processor() {
   }

   public static boolean process(HashMap<Integer, Item> Date,HashMap<String, Integer> Dublicate, HashMap<String, HashMap<Integer, Integer>> count) {
      boolean is_dublicat = false;//наличие дубликатов
      Item item;// вспомогательная переменная, для экземпляра класса, в котором храниться адрес
      String date;// строка для адресов
      HashMap<String, Integer> houses = new HashMap<>();//список обработанных строк(для подсчёта этажей)
      HashMap<Integer, Integer> tmp;//вспомогательнач переменная, для подсчёта этажей
      for(int i = 0; i < Date.size(); i++) {
         item = Date.get(i);
         date = item.to_String();
         //поиск дубликатов. Начало
         if (Dublicate.get(date) == null){
            Dublicate.put(date, 1);
         }
         else{
            Dublicate.put(date, Dublicate.get(date) + 1);
            if (Dublicate.get(date) + 1 > 1){
               is_dublicat = true;
            }
         }
         //поиск дубликатов конец. начала подсчётов этажей в каждом городе
         
         
         if (!houses.containsKey(date)){
            houses.put(date, 1);
            if(!count.containsKey(item.GetCity())){
                  tmp = new HashMap<>();
                  tmp.put(item.GetFloor(), 1);
                  count.put(item.GetCity(), tmp);
               }
               else{
                  if(!count.get(item.GetCity()).containsKey(item.GetFloor())){
                     tmp = count.get(item.GetCity());
                     tmp.put(item.GetFloor(), 1);
                     count.put(item.GetCity(), tmp);
                  }
                  else{
                     tmp = count.get(item.GetCity());
                     tmp.put(item.GetFloor(), tmp.get(item.GetFloor()) + 1);
                     count.put(item.GetCity(), tmp);
                  }
               }
         }
      }
      return is_dublicat;
   }
}

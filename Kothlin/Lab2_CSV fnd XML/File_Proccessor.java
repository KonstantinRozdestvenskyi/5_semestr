package com.example;

import java.util.HashMap;

public class File_Proccessor {
   File_Proccessor() {
   }

   public static void Process(HashMap<Integer, Item> Date, HashMap<String, Integer> Dublicate, HashMap<Integer, Integer> Floors, boolean is_dublicat) {
      for(int i = 0; i < Date.size(); ++i) {
         int floor = ((Item)Date.get(i)).GetFloor();
         if (Floors.get(floor) == null) {
            Floors.put(floor, 1);
         } else {
            Floors.put(floor, (Integer)Floors.get(floor) + 1);
         }

         String date = ((Item)Date.get(i)).toString();
         if (Dublicate.isEmpty()) {
            Dublicate.put(date, 1);
         } else if (Dublicate.containsKey(date)) {
            is_dublicat = true;
            if (Dublicate.get(date) == null) {
               Dublicate.put(date, 1);
            } else {
               Dublicate.put(date, (Integer)Dublicate.get(date) + 1);
            }
         } else {
            Dublicate.put(date, 1);
         }
      }

   }
}

package com.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.stream.XMLStreamException;




/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws XMLStreamException
    {
        try {
            HashMap<Integer, Item> Date = new HashMap<>();
            HashMap<String, Integer> Dublicate = new HashMap<>();
            HashMap<String, HashMap<Integer, Integer>> Floors = new HashMap<>();
            while(true){
                BufferedReader read = new BufferedReader(new InputStreamReader(System.in, "cp866")); 
                System.out.println("put the path or '0' to exit");
                String path = read.readLine(); 
                if (path.equals("0")){
                    return;
                }
                String type = path.substring(path.length() - 3, path.length());
                long start = System.nanoTime();
                if (type.equals("xml")){   
                    Date = XMLReader.read(path);
                }
                else if (type.equals("csv")){
                    Date = CSVreader.read(path);
                }
                else {
                    System.out.println("wrong format of the file");
                    continue;
                }
                boolean is_dublicat = true;
                is_dublicat = File_processor.process(Date, Dublicate, Floors);
                if (is_dublicat){
                    System.out.println("Dublicates in the file:");
                    for (Map.Entry<String, Integer> entry : Dublicate.entrySet()){
                        if (entry.getValue() > 1){
                            System.out.print(entry.getKey() + " dublicated ");
                            System.out.println(Integer.toString(entry.getValue()) + " times");
                        }
                    }
                }
                else {
                    System.out.println("there are no dublicates in the file");
                }
                System.out.println("in City: ");
                for (Map.Entry<String, HashMap<Integer, Integer>> entry : Floors.entrySet()) {
                    String key = entry.getKey();
                    HashMap<Integer, Integer> value = entry.getValue();
                    System.out.println(key);
                    System.out.println("count of ");
                    for (int i = 1; i <= 5; i++){
                        System.out.print(i);
                        System.out.print("-floor's hause is ");
                        System.out.println(value.get(i));
                    }
                }
                long end = System.nanoTime();
                long time = end - start; 
                System.out.println("file processing time: " + time/1000000000 + "s");
                Date.clear();
                Dublicate.clear();
                Floors.clear();
            }
        }
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

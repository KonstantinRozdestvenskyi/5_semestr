package com.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;

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
            HashMap<Integer, Integer> Floors = new HashMap<>();
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
                boolean is_dublicat = false;
                File_Proccessor.Process(Date, Dublicate, Floors, is_dublicat);
                if (is_dublicat){
                    System.out.println("Dublicates in the file:");
                    Dublicate.entrySet() .stream().filter(entry -> entry.getValue() > 1).forEach(System.out::println);
                }
                else {
                    System.out.println("there are no dublicates in the file");
                }
                System.out.println("Count of the floors:");
                Floors.entrySet() .stream().forEach(System.out::println);
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

package com.example;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

public class XMLReader {

    XMLReader(){

    }

    
    public static HashMap<Integer, Item> read(String path) throws FileNotFoundException, XMLStreamException{
        HashMap<Integer, Item> Date = new HashMap<>();//сюда мы будем собирать адреса из файла
        XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance(); //отсюда мы получаем экземляры потока (XMLEvent)
        XMLEventReader reader = xmlInputFactory.createXMLEventReader(new FileInputStream(path));//отсюда выполняем потоковое чтение
        Item item = null;//вспомогательная
        int i = -1;
        while (reader.hasNext()) {
            XMLEvent nextEvent = reader.nextEvent();//следующее событие
            if (nextEvent.isStartElement()) { //если событие - стартовое, то преобразуем его в StartElement
                StartElement startElement = nextEvent.asStartElement();
                switch (startElement.getName().getLocalPart()) {//проверяем имя события
                    case "item"://если имя "item", то мы встретили очередной адрес
                        item = new Item();
                        Iterator<Attribute> Attributes = startElement.getAttributes();//итератор для коллекции атрибутов
                        while (Attributes.hasNext()) {
                            Attribute attribute = Attributes.next();//получаем очередной атрибут, выясняем его имя 
                            //и значение присваиваем сответсвующему полю класcа Item
                            switch(attribute.getName().getLocalPart()){
                                case "city": 
                                    item.SetCity(attribute.getValue());
                                break;

                                case "street": 
                                    item.SetStreet(attribute.getValue());
                                break;

                                case "house": 
                                    item.SetHouse(Integer.parseInt(attribute.getValue()));
                                break;

                                case "floor": 
                                    item.SetFloor(Integer.parseInt(attribute.getValue()));
                                break;
                            }
                        }
                        break;
                }
            }
            if (nextEvent.isEndElement()) {//если событие является конечным элементом с именем Itep запихиваем item в карту
                EndElement endElement = nextEvent.asEndElement();
                if (endElement.getName().getLocalPart().equals("item")) {
                    i++;
                    Date.put(i, item);
                }
            }
        }
        return Date;
    }
}

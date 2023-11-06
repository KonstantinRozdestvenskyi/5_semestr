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
        HashMap<Integer, Item> items = new HashMap<>();
        XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
        XMLEventReader reader = xmlInputFactory.createXMLEventReader(new FileInputStream(path));
        Item item = null;
        int i = -1;
        while (reader.hasNext()) {
            XMLEvent nextEvent = reader.nextEvent();
            if (nextEvent.isStartElement()) {
                StartElement startElement = nextEvent.asStartElement();
                switch (startElement.getName().getLocalPart()) {
                    case "item":
                        item = new Item();
                        Iterator<Attribute> Attributes = startElement.getAttributes();
                        while (Attributes.hasNext()) {
                            Attribute attribute = Attributes.next();
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
            if (nextEvent.isEndElement()) {
                EndElement endElement = nextEvent.asEndElement();
                if (endElement.getName().getLocalPart().equals("item")) {
                    i++;
                    items.put(i, item);
                }
            }
        }
        return items;
    }
}

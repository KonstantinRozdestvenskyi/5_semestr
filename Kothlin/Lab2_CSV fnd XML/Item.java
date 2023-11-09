package com.example;

public class Item {
    private String city;
    private String street;
    private int house;
    private int floor;

    Item (String city, String street, int house, int floor){
        this.city = city;
        this.street = street;
        this.house = house;
        this.floor = floor;
    }

    Item (){

    }

    public void SetCity(String city){
        this.city = city;
    }

    public void SetStreet(String street){
        this.street = street;
    }

    public void SetHouse(int house){
        this.house = house;
    }

    public void SetFloor(int floor){
        this.floor = floor;
    }

    public String GetCity(){
        return this.city;
    }

    public String GetStreet(){
        return this.street;
    }

    public int GetHouse(){
        return this.house;
    }

    public int GetFloor(){
        return this.floor;
    }

    public String to_String(){
        return "Item [city=" + city + ", street=" + street + ", house="
        + house + ", floor=" + floor + "]";
    }
}


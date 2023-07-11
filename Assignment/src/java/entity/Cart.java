/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author VHC
 */
public class Cart {
    private ArrayList<OrderItems> ProList;

    public Cart() {
        this.ProList = new ArrayList<>();
    }

    public Cart(ArrayList<OrderItems> ProList) {
        this.ProList = ProList;
    }

    public ArrayList<OrderItems> getProList() {
        return ProList;
    }

    public void setProList(ArrayList<OrderItems> ProList) {
        this.ProList = ProList;
    }
    
    public void addItem(OrderItems e){
        ProList.add(e);
    }

    public float getTotalPrice() {
        float rs =0;
        for(OrderItems o:ProList){
            rs += o.getProduct().getPro_PriceNum()*o.getQuantity();
        }
        return rs;
    }
    
    public String getTotalPriceString(){
        return String.format("%,.0f vnd", getTotalPrice()*1000);
    }
    
    void addToCart(OrderItems e){
        ProList.add(e);
    }
}

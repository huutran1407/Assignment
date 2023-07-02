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
    private ArrayList<Products> ProList;
    
    void addToCart(Products e){
        ProList.add(e);
    }
}

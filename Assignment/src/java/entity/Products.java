/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VHC
 */
public class Products {
    private String ProId;
    private String Pro_Name;
    private int Pro_Quantity;
    private int Pro_Type;
    private String Pro_Seller;
    private String Pro_img;
    private String Pro_des;
    private double Pro_Price;

    public Products(String ProId, String Pro_Name, int Pro_Quantity, int Pro_Type, String Pro_Seller, String Pro_img, String Pro_des, double Pro_Price) {
        this.ProId = ProId;
        this.Pro_Name = Pro_Name;
        this.Pro_Quantity = Pro_Quantity;
        this.Pro_Type = Pro_Type;
        this.Pro_Seller = Pro_Seller;
        this.Pro_img = Pro_img;
        this.Pro_des = Pro_des;
        this.Pro_Price = Pro_Price;
    }

    public Products() {
    }

    public String getProId() {
        return ProId;
    }

    public void setProId(String ProId) {
        this.ProId = ProId;
    }

    public String getPro_Name() {
        return Pro_Name;
    }

    public void setPro_Name(String Pro_Name) {
        this.Pro_Name = Pro_Name;
    }

    public int getPro_Quantity() {
        return Pro_Quantity;
    }

    public void setPro_Quantity(int Pro_Quantity) {
        this.Pro_Quantity = Pro_Quantity;
    }

    public int getPro_Type() {
        return Pro_Type;
    }

    public void setPro_Type(int Pro_Type) {
        this.Pro_Type = Pro_Type;
    }

    public String getPro_Seller() {
        return Pro_Seller;
    }

    public void setPro_Seller(String Pro_Seller) {
        this.Pro_Seller = Pro_Seller;
    }

    public String getPro_img() {
        return Pro_img;
    }

    public void setPro_img(String Pro_img) {
        this.Pro_img = Pro_img;
    }

    public String getPro_des() {
        return Pro_des;
    }

    public void setPro_des(String Pro_des) {
        this.Pro_des = Pro_des;
    }

    public double getPro_Price() {
        return Pro_Price;
    }

    public void setPro_Price(double Pro_Price) {
        this.Pro_Price = Pro_Price;
    }
    
    
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author VHC
 */
public class Products {

    private String ProId;
    private String Pro_Name;
    private int Pro_Quantity;
    private String Pro_Type;
    private String Pro_Seller;
    private String Pro_img;
    private String Pro_des;
    private double Pro_Price;
    private Date addDate;

    public Products(String ProId, String Pro_Name, int Pro_Quantity, String Pro_Type, String Pro_Seller, String Pro_img, String Pro_des, double Pro_Price, Date addDate) {
        this.ProId = ProId;
        this.Pro_Name = Pro_Name;
        this.Pro_Quantity = Pro_Quantity;
        this.Pro_Type = Pro_Type;
        this.Pro_Seller = Pro_Seller;
        this.Pro_img = Pro_img;
        this.Pro_des = Pro_des;
        this.Pro_Price = Pro_Price;
        this.addDate = addDate;
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

    public String getPro_Type() {
        return Pro_Type;
    }

    public void setPro_Type(String Pro_Type) {
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

    public String getPro_Price() {
        return String.format("%,.0f vnd", Pro_Price*1000);
    }

    public void setPro_Price(double Pro_Price) {
        this.Pro_Price = Pro_Price;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getDateDiff() {
        //get current date
        Date date2 = new Date();
        // Get period between the first and the second date   
        Period difference = Period.between(convertToLocalDateViaInstant(getAddDate()), convertToLocalDateViaInstant(date2));
        
        String Year = difference.getYears()==0?"":(""+difference.getYears() + " Years ");
        String Months = difference.getMonths()==0?"":(""+difference.getMonths() + " Months ");
        String Days = difference.getDays()==0?"":(""+difference.getDays() + " Days ");
        if(difference.getYears()==0&&difference.getMonths()==0&&difference.getDays()==0){
            return "today";
        }
        
        return Year + Months + Days + "ago";
    }

    public LocalDate convertToLocalDateViaInstant(Date dateToConvert) {
        return Instant.ofEpochMilli(dateToConvert.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
    }
}

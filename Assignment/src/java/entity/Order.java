/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author VHC
 */
public class Order {
    private String OrderOwner;
    private String OrderId;
    private float TotalPrice;
    private Date OrderDate;
    private String PaymentMode;
    private String CustomerName;
    private String MobileNumber;
    private String Address;
    private ArrayList<OrderItems> items;

    public Order() {
    }

    public Order(String OrderOwner, String OrderId, float TotalPrice, Date OrderDate, String PaymentMode, String CustomerName, String MobileNumber, String Address, ArrayList<OrderItems> items) {
        this.OrderOwner = OrderOwner;
        this.OrderId = OrderId;
        this.TotalPrice = TotalPrice;
        this.OrderDate = OrderDate;
        this.PaymentMode = PaymentMode;
        this.CustomerName = CustomerName;
        this.MobileNumber = MobileNumber;
        this.Address = Address;
        this.items = items;
    }

    public String getOrderOwner() {
        return OrderOwner;
    }

    public void setOrderOwner(String OrderOwner) {
        this.OrderOwner = OrderOwner;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String OrderId) {
        this.OrderId = OrderId;
    }

    public float getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(float TotalPrice) {
        this.TotalPrice = TotalPrice;
    }
    
    public String getTotalPriceString(){
        return String.format("%,.0f vnd", getTotalPrice()*1000);
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getPaymentMode() {
        return PaymentMode;
    }

    public void setPaymentMode(String PaymentMode) {
        this.PaymentMode = PaymentMode;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getMobileNumber() {
        return MobileNumber;
    }

    public void setMobileNumber(String MobileNumber) {
        this.MobileNumber = MobileNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public ArrayList<OrderItems> getItems() {
        return items;
    }

    public void setItems(ArrayList<OrderItems> items) {
        this.items = items;
    }
    
    public int getTotalItem(){
        return items.size();
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dal.ProductDAO;

/**
 *
 * @author VHC
 */
public class OrderItems {
    private String ProId;
    private int Quantity;

    public OrderItems(String ProId, int Quantity) {
        this.ProId = ProId;
        this.Quantity = Quantity;
    }

    public OrderItems() {
    }

    public String getProId() {
        return ProId;
    }

    public void setProId(String ProId) {
        this.ProId = ProId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
    public Products getProduct(){
        ProductDAO pDAO = new ProductDAO();
        return pDAO.getProduct(ProId);
    }
    
}

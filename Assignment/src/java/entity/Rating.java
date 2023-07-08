/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VHC
 */
public class Rating {
    private Users User;
    private String ProductId;
    private float Rate;
    private String RateMess;

    public Rating() {
    }

    public Rating(Users User, String ProductId, float Rate, String RateMess) {
        this.User = User;
        this.ProductId = ProductId;
        this.Rate = Rate;
        this.RateMess = RateMess;
    }

    public Users getUser() {
        return User;
    }

    public void setUser(Users User) {
        this.User = User;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public float getRate() {
        return Rate;
    }

    public void setRate(float Rate) {
        this.Rate = Rate;
    }

    public String getRateMess() {
        return RateMess;
    }

    public void setRateMess(String RateMess) {
        this.RateMess = RateMess;
    }
    
    
}

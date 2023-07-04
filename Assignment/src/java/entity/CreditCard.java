/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VHC
 */
public class CreditCard {
    private String UserId;
    private String CardOwner;
    private String CardNumber;
    private int CardExpMonth;
    private int CardExpYear;
    private String CVC;

    public CreditCard() {
    }

    public CreditCard(String UserId, String CardOwner, String CardNumber, int CardExpMonth, int CardExpYear, String CVC) {
        this.UserId = UserId;
        this.CardOwner = CardOwner;
        this.CardNumber = CardNumber;
        this.CardExpMonth = CardExpMonth;
        this.CardExpYear = CardExpYear;
        this.CVC = CVC;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getCardOwner() {
        return CardOwner;
    }

    public void setCardOwner(String CardOwner) {
        this.CardOwner = CardOwner;
    }

    public String getCardNumber() {
        return CardNumber;
    }

    public void setCardNumber(String CardNumber) {
        this.CardNumber = CardNumber;
    }

    public int getCardExpMonth() {
        return CardExpMonth;
    }

    public void setCardExpMonth(int CardExpMonth) {
        this.CardExpMonth = CardExpMonth;
    }

    public int getCardExpYear() {
        return CardExpYear;
    }

    public void setCardExpYear(int CardExpYear) {
        this.CardExpYear = CardExpYear;
    }

    public String getCVC() {
        return CVC;
    }

    public void setCVC(String CVC) {
        this.CVC = CVC;
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author VHC
 */
public class Users {
    private String UserId;
    private String UserName;
    private String Password;
    private String UserFullName;
    private boolean isAdmin;
    private boolean isBanned;
    private String Email;
    private String contact;
    private String DisplayName;
    private Date joinDate;

    public Users(String UserId, String UserName, String Password, String UserFullName, boolean isAdmin,boolean isBanned ,String Email, String contact, String DisplayName,Date joinDate) {
        this.UserId = UserId;
        this.UserName = UserName;
        this.Password = Password;
        this.UserFullName = UserFullName;
        this.isAdmin = isAdmin;
        this.Email = Email;
        this.contact = contact;
        this.DisplayName = DisplayName;
        this.joinDate = joinDate;
        this.isBanned = isBanned;
    }

    public Users() {
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getUserFullName() {
        return UserFullName;
    }

    public void setUserFullName(String UserFullName) {
        this.UserFullName = UserFullName;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isBanned() {
        return isBanned;
    }

    public void setIsBanned(boolean isBanned) {
        this.isBanned = isBanned;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDisplayName() {
        return DisplayName;
    }

    public void setDisplayName(String DisplayName) {
        this.DisplayName = DisplayName;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    
    
    
}

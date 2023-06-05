/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VHC
 */
public class Category {
    private int Category_Id;
    private String Category;
    private String Category_Img;

    public Category(int Category_Id, String Category, String Category_Img) {
        this.Category_Id = Category_Id;
        this.Category = Category;
        this.Category_Img = Category_Img;
    }

    public Category() {
    }

    public int getCategory_Id() {
        return Category_Id;
    }

    public void setCategory_Id(int Category_Id) {
        this.Category_Id = Category_Id;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getCategory_Img() {
        return Category_Img;
    }

    public void setCategory_Img(String Category_Img) {
        this.Category_Img = Category_Img;
    }
    
    
}

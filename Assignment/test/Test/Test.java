/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import dal.CategoryDAO;
import dal.UsersDAO;
import entity.Category;
import java.util.ArrayList;

/**
 *
 * @author VHC
 */
public class Test {

    public static void main(String[] args) {
        UsersDAO test = new UsersDAO();
        CategoryDAO CategoryTest = new CategoryDAO();
//        System.out.println(test.SignInUser("abc", "Test", "Test1", "123"));
//        test.deleteUser("CA000");
//        ArrayList<Category> obj = CategoryTest.getCategories();
//        String name = obj.get(0).getCategory();
//        System.out.println(name);
        String fileName = "text.text.txt";
        fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "2" + fileName.substring(fileName.lastIndexOf("."));
        System.out.println(fileName);
    }
}

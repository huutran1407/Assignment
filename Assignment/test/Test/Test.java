/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import dal.UsersDAO;


/**
 *
 * @author VHC
 */
public class Test {
    public static void main(String[] args) {
        UsersDAO test = new UsersDAO();
//        System.out.println(test.SignInUser("abc", "Test", "Test1", "123"));
        test.deleteUser("US007");
        test.deleteUser("US006");
        test.deleteUser("US005");
        test.deleteUser("US004");
    }
}

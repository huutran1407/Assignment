/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Category;

/**
 *
 * @author fsoft
 */
public class CategoryDAO  {
    DBContext conn = new DBContext();
    public ArrayList<Category> getCategories() {
        ArrayList<Category> obj = new ArrayList<>();
        try {
            String sql = "SELECT * FROM category";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Category s = new Category();
                s.setCategory_Id(rs.getString("Category_Id"));
                s.setCategory(rs.getString("Category"));
                s.setCategory_Img(rs.getString("Category_SampleIMG"));
                obj.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    public Category getCategory(String id){
        try {
            String sql = "SELECT * FROM category s\n"
                    + "WHERE s.Category_Id = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Category s = new Category();
                s.setCategory_Id(rs.getString("Category_Id"));
                s.setCategory(rs.getString("Category"));
                s.setCategory_Img(rs.getString("Category_SampleIMG"));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String insertCategory(String categoryName, String CategoryIMG ){
        String mess = "Fail";
        try {
            String CategoryId = getNewId();
            String sql = "INSERT INTO category "
                    + "VALUES(?,?,?)";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, CategoryId);
            statement.setString(2, categoryName);
            statement.setString(3, CategoryIMG);
            statement.executeUpdate();
            return "Success";
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mess;
    }
    
    //funtion to get ID for new Category
    public String getNewId(){
        String getId = "SELECT max(Category_Id) as ID FROM category";
        try{
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ResultSet IDrs = ID.executeQuery();
             if(IDrs.next()){
                try{
                    String IDNUM = IDrs.getString("ID").substring(2);
                    int NUM = Integer.parseInt(IDNUM)+1;
                    return "CA" + String.format("%03d",NUM);
                }catch(NullPointerException ex){
                    return "CA000";
                }
            }
        }catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    public boolean updateCategory(String Id, String name, String IMG){
        try {
            String sql = "UPDATE category\n"
                    + "   SET"
                    + "      Category = ?\n"
                    + "      ,Category_SampleIMG = ?\n"
                    + " WHERE Category_Id = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, IMG);
            statement.setString(3, Id);
            statement.executeUpdate();
            return true;
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    public void deleteById(String id){
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM category\n"
                    + "WHERE Category_Id=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

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
            String sql = "SELECT * FROM [Users]";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Category s = new Category();
                s.setCategory_Id(rs.getInt("Category_Id"));
                s.setCategory(rs.getString("Category"));
                s.setCategory_Img(rs.getString("Category_SampleIMG"));
                obj.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    public Category getCategory(int id) throws Exception {
        try {
            String sql = "SELECT * FROM Users s\n"
                    + "WHERE s.Category_Id = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Category s = new Category();
                s.setCategory_Id(rs.getInt("Category_Id"));
                s.setCategory(rs.getString("Category"));
                s.setCategory_Img(rs.getString("Category_SampleIMG"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertCategory(String sname, String sgender, String sdob ) throws Exception {
        try {
            String sql = "INSERT INTO Category VALUES(?,?,?)";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, sname);
            statement.setString(3, sdob);
            statement.setString(2, sgender);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCategory(int cId, String cname, String cIMG) throws Exception {
        try {
            String sql = "UPDATE [Category]\n"
                    + "   SET"
                    + "      ,[Category_Name] = ?\n"
                    + "      ,[Category_SampleIMG] = ?\n"
                    + " WHERE [Category_Id] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, cname);
            statement.setString(2, cIMG);
            statement.setInt(3, cId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteStudent(int id) throws Exception {
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM Category\n"
                    + "WHERE Category_Id=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
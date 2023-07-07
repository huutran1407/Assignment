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
import entity.Products;

/**
 *
 * @author fsoft
 */
public class ProductDAO  {
    DBContext conn = new DBContext();
    public ArrayList<Products> getStudents() {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product]";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Products s = new Products();
                s.setProId(rs.getString("Pro_Id"));
                s.setPro_Name(rs.getString("Pro_Name"));
                s.setPro_Quantity(rs.getInt("Pro_Quantity"));
                s.setPro_Type(rs.getString("Pro_Type"));
                s.setPro_Seller(rs.getString("Pro_Seller"));
                s.setPro_img(rs.getString("Pro_img"));
                s.setPro_des(rs.getString("Pro_description"));
                s.setPro_Price(rs.getFloat("Pro_Price"));
                s.setAddDate(rs.getDate("Pro_AddDate"));
                products.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Products> getUserProduct(String Owner) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] WHERE Pro_Seller = ? AND Pro_Status = 1";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Owner);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Products s = new Products();
                s.setProId(rs.getString("Pro_Id"));
                s.setPro_Name(rs.getString("Pro_Name"));
                s.setPro_Quantity(rs.getInt("Pro_Quantity"));
                s.setPro_Type(rs.getString("Pro_Type"));
                s.setPro_Seller(rs.getString("Pro_Seller"));
                s.setPro_img(rs.getString("Pro_img"));
                s.setPro_des(rs.getString("Pro_description"));
                s.setPro_Price(rs.getFloat("Pro_Price"));
                s.setAddDate(rs.getDate("Pro_AddDate"));
                products.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Products> getUserSoldOutProduct(String Owner) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] WHERE Pro_Seller = ? AND Pro_Status = 0";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Owner);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Products s = new Products();
                s.setProId(rs.getString("Pro_Id"));
                s.setPro_Name(rs.getString("Pro_Name"));
                s.setPro_Quantity(rs.getInt("Pro_Quantity"));
                s.setPro_Type(rs.getString("Pro_Type"));
                s.setPro_Seller(rs.getString("Pro_Seller"));
                s.setPro_img(rs.getString("Pro_img"));
                s.setPro_des(rs.getString("Pro_description"));
                s.setPro_Price(rs.getFloat("Pro_Price"));
                s.setAddDate(rs.getDate("Pro_AddDate"));
                products.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public Products getProducts(int id) throws Exception {
        try {
            String sql = "SELECT * FROM Product s\n"
                    + "WHERE s.id = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Products s = new Products();
                s.setProId(rs.getString("Pro_Id"));
                s.setPro_Name(rs.getString("Pro_Name"));
                s.setPro_Quantity(rs.getInt("Pro_Quantity"));
                s.setPro_Type(rs.getString("Pro_Type"));
                s.setPro_Seller(rs.getString("Pro_Seller"));
                s.setPro_img(rs.getString("Pro_img"));
                s.setPro_des(rs.getString("Pro_description"));
                s.setPro_Price(rs.getFloat("Pro_Price"));
                s.setAddDate(rs.getDate("Pro_AddDate"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    //Add Product to database
    public void insertProduct(String pName, int pQuantity, String pType, String pSeller, String pImg, String pDescription, float pPrice){
        try {
            String sql = "INSERT INTO Product\n"
                             + "(Pro_Id,Pro_Name,Pro_Quantity,Pro_Type,Pro_Seller,Pro_img,Pro_description,Pro_Price)\n"
                             + "values\n"
                             + "(?,?,?,?,?,?,?,?)";
            String pId = getNewProductId(pSeller, pType);
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, pId);
            statement.setString(2, pName);
            statement.setInt(3, pQuantity);
            statement.setString(4, pType);
            statement.setString(5, pSeller);
            statement.setString(6, pImg);
            statement.setString(7, pDescription);
            statement.setFloat(8, pPrice);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getNewProductId(String pSeller,String pCategory){
        String getId = "SELECT max(Pro_Id) as ID FROM Product\n"
                                +"Where Pro_Seller LIKE ?\n"
                                +"AND Pro_Type LIKE ?";
        try {
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ID.setString(1, pSeller);
            ID.setString(2, pCategory);
            ResultSet IDrs = ID.executeQuery();
            if (IDrs.next()) {
                try {
                    String IDNUM = IDrs.getString("ID").substring(pSeller.length()+pCategory.length()+2);
                    int NUM = Integer.parseInt(IDNUM) + 1;
                    return pSeller+pCategory+"PD" + String.format("%03d", NUM);
                } catch (NullPointerException ex) {
                    return pSeller+pCategory+"PD001";
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    public void updateProduct(String pName, int pQuantity, int pType, String pSeller, String pImg, String pDescription, double pPrice,String pId) throws Exception {
        try {
            String sql = "UPDATE [Product]\n"
                    + "   SET [Pro_Name] = ?\n"
                    + "      ,[Pro_Quantity] = ?\n"
                    + "      ,[Pro_Type] = ?\n"
                    + "      ,[Pro_Seller] = ?\n"
                    + "      ,[Pro_img] = ?\n"
                    + "      ,[Pro_description] = ?\n"
                    + "      ,[Pro_Price] = ?\n"
                    + " WHERE [Pro_id] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, pName);
            statement.setInt(2, pQuantity);
            statement.setInt(3, pType);
            statement.setString(4, pSeller);
            statement.setString(5, pImg);
            statement.setString(6, pDescription);
            statement.setDouble(7, pPrice);
            statement.setString(8, pId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(String id){
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM Product\n"
                    + "WHERE Pro_id=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}


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
import entity.Rating;

/**
 *
 * @author fsoft
 */
public class ProductDAO {

    DBContext conn = new DBContext();

    public ArrayList<Products> getProducts() {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product]\n"
                    + "Where Pro_Quantity != 0\n"
                    + "ORDER BY Pro_AddDate DESC";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
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

    //get product list of a User
    public ArrayList<Products> getUserProduct(String Owner) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] WHERE Pro_Seller = ? AND Pro_Status = 1";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Owner);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
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

    //get SoldOut Product of a Seller
    public ArrayList<Products> getUserSoldOutProduct(String Owner) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] WHERE Pro_Seller = ? AND Pro_Status = 0";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Owner);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
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

    //get Product by ID
    public Products getProduct(String id) {
        try {
            String sql = "SELECT * FROM Product s\n"
                    + "WHERE s.Pro_Id = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
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

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Add Product to database
    public void insertProduct(String pName, int pQuantity, String pType, String pSeller, String pImg, String pDescription, float pPrice) {
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

    public String getNewProductId(String pSeller, String pCategory) {
        String getId = "SELECT max(Pro_Id) as ID FROM Product\n"
                + "Where Pro_Seller LIKE ?\n"
                + "AND Pro_Type LIKE ?";
        try {
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ID.setString(1, pSeller);
            ID.setString(2, pCategory);
            ResultSet IDrs = ID.executeQuery();
            if (IDrs.next()) {
                try {
                    String IDNUM = IDrs.getString("ID").substring(pSeller.length() + pCategory.length() + 2);
                    int NUM = Integer.parseInt(IDNUM) + 1;
                    return pSeller + pCategory + "PD" + String.format("%03d", NUM);
                } catch (NullPointerException ex) {
                    return pSeller + pCategory + "PD001";
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    //get average Rating
    public float getProductRating(String pId) {
        String sql = "SELECT ISNULL(AVG(Rate.Rate),0) as avg\n"
                + "FROM Rate join Product on Rate.ProductId = Product.Pro_Id\n"
                + "WHERE Product.Pro_Id LIKE ?;";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, pId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getFloat("avg");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //get all product rating
    public ArrayList<Rating> getProductRates(String ProId) {
        ArrayList<Rating> RateList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Rate] WHERE ProductId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, ProId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                UsersDAO uDAO = new UsersDAO();
                Rating s = new Rating();
                s.setUser(uDAO.getUsersByID(rs.getString("UserId")));
                s.setProductId(rs.getString("ProductId"));
                s.setRateMess(rs.getString("RateMess"));
                s.setRate(rs.getFloat("Rate"));
                RateList.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return RateList;
    }

    public void insertProductRate(String ProId, String UserId, float rate, String RateMess) {
        try {
            String sql = "INSERT INTO Rate\n"
                    + "(UserId,ProductId,Rate,RateMess)\n"
                    + "values\n"
                    + "(?,?,?,?)";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, ProId);
            statement.setFloat(3, rate);
            statement.setString(4, RateMess);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void decsProductAmount(int Quantity, String Pro_ID) {
        String sql = "UPDATE Product\n"
                + "SET Pro_Quantity = \n"
                + "((Select Pro_Quantity from Product where Pro_Id LIKE ?) - ?)\n"
                + "Where Pro_Id LIKE ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Pro_ID);
            statement.setInt(2, Quantity);
            statement.setString(3, Pro_ID);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean isRated(String UserId, String ProductId) {
        try {
            String sql = "SELECT ISNULL(COUNT(UserId),0) as rated FROM [Rate] WHERE ProductId = ? AND UserId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, ProductId);
            statement.setString(2, UserId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("rated")!=0;
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public void deleteProduct(String id) {
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

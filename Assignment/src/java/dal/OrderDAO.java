/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.CreditCard;
import entity.OrderItems;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fsoft
 */
public class OrderDAO {

    DBContext conn = new DBContext();

    //getUsersByID
    public CreditCard getCardByID(String id) {
        try {
            String sql = "SELECT * FROM PaymentCard s\n"
                    + "WHERE s.UserId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                CreditCard s = new CreditCard();
                s.setUserId(rs.getString("UserId"));
                s.setCardOwner(rs.getNString("CardOwner"));
                s.setCardNumber(rs.getString("CardNumber"));
                s.setCardExpMonth(rs.getInt("CardExpMonth"));
                s.setCardExpYear(rs.getInt("CardExpYear"));
                s.setCVC(rs.getString("CVC"));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertOrder(String OwnerId,float OrderTotalPrice,String PaymentMode,String CustomerName,String MobileNumber,String Address, ArrayList<OrderItems> OrderItems) {
        String OrderId = getNewId(OwnerId);
        
        String sql = "INSERT INTO ordered\n"
                    + "(Order_Owner,OrderId,OrderTotalPrice,PaymentMode,CustomerName,MobileNumber,Address)\n"
                    + "values\n"
                    + "(?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, OwnerId);
            statement.setString(2, OrderId);
            statement.setFloat(3, OrderTotalPrice);
            statement.setString(4, PaymentMode);
            statement.setString(5, CustomerName);
            statement.setString(6, MobileNumber);
            statement.setString(7, Address);
            statement.executeUpdate();
            
            for (OrderItems item : OrderItems) {
                String sql2 = "INSERT INTO Order_Detail\n"
                    + "(OrderId,Product_Id,Product_Quantity)\n"
                    + "values\n"
                    + "(?,?,?)";
                PreparedStatement statement2 = conn.getConnection().prepareStatement(sql2);
                statement2.setString(1, OrderId);
                statement2.setString(2, item.getProId());
                statement2.setInt(3, item.getQuantity());
                statement2.executeUpdate();
                
                ProductDAO pDAO = new ProductDAO();
                pDAO.decsProductAmount(item.getQuantity(),  item.getProId());
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //get new OrderID
    public String getNewId(String OwnerId){
        String getId = "SELECT max(OrderId) as ID FROM ordered Where Order_Owner like ?";
        try {
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ID.setString(1, OwnerId);
            ResultSet IDrs = ID.executeQuery();
            if (IDrs.next()) {
                try {
                    String IDNUM = IDrs.getString("ID").substring(OwnerId.length()+2);
                    int NUM = Integer.parseInt(IDNUM) + 1;
                    return OwnerId+"OR" + String.format("%03d", NUM);
                } catch (NullPointerException ex) {
                    return OwnerId + "OR001";
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    public void deleteCard(String id) {
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM PaymentCard\n"
                    + "WHERE UserId=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

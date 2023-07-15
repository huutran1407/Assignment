/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.CreditCard;
import entity.Order;
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

    public ArrayList<Order> getOrder(String id, int pageNum, int proPerPage) {
        try {
            ArrayList<Order> orderlist = new ArrayList<>();
            String sql = "SELECT * FROM ordered s\n"
                    + "WHERE s.Order_Owner = ?\n"
                    + "ORDER BY OrderDate DESC\n"
                    + "OFFSET ? rows\n"
                    + "FETCH NEXT ? rows only";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.setInt(2, (pageNum - 1) * proPerPage);
            statement.setInt(3, proPerPage);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order s = new Order();
                s.setOrderOwner(rs.getString("Order_Owner"));
                s.setOrderId(rs.getString("OrderId"));
                s.setTotalPrice(rs.getFloat("OrderTotalPrice"));
                s.setOrderDate(rs.getDate("OrderDate"));
                s.setPaymentMode(rs.getString("PaymentMode"));
                s.setCustomerName(rs.getString("CustomerName"));
                s.setMobileNumber(rs.getString("MobileNumber"));
                s.setAddress(rs.getString("Address"));
                s.setItems(getOrderItems(rs.getString("OrderId")));
                orderlist.add(s);
            }
            return orderlist;
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Order getOrderById(String Id) {
        try {
            String sql = "SELECT * FROM ordered s\n"
                    + "WHERE s.OrderId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order s = new Order();
                s.setOrderOwner(rs.getString("Order_Owner"));
                s.setOrderId(rs.getString("OrderId"));
                s.setTotalPrice(rs.getFloat("OrderTotalPrice"));
                s.setOrderDate(rs.getDate("OrderDate"));
                s.setPaymentMode(rs.getString("PaymentMode"));
                s.setCustomerName(rs.getString("CustomerName"));
                s.setMobileNumber(rs.getString("MobileNumber"));
                s.setAddress(rs.getString("Address"));
                s.setItems(getOrderItems(Id));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    //get Total product
    public int getNumberOfPage(int numPerPage,String Owner) {
        try {
            String sql = "Select ISNULL(COUNT(OrderId),0) as count\n"
                                +"from ordered\n"
                                + "where Order_Owner=?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1,Owner);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("count");
                return total%numPerPage==0?total/numPerPage:(total/numPerPage+1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<OrderItems> getOrderItems(String id) {
        try {
            ArrayList<OrderItems> itemlist = new ArrayList<>();
            String sql = "SELECT * FROM Order_Detail s\n"
                    + "WHERE s.OrderId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderItems s = new OrderItems();
                s.setProId(rs.getString("Product_Id"));
                s.setQuantity(rs.getInt("Product_Quantity"));
                itemlist.add(s);
            }
            return itemlist;
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

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

    public void insertOrder(String OwnerId, float OrderTotalPrice, String PaymentMode, String CustomerName, String MobileNumber, String Address, ArrayList<OrderItems> OrderItems) {
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

            OrderItems.forEach((item) -> {
                String sql2 = "INSERT INTO Order_Detail\n"
                        + "(OrderId,Product_Id,Product_Quantity)\n"
                        + "values\n"
                        + "(?,?,?)";
                try {
                    PreparedStatement statement2 = conn.getConnection().prepareStatement(sql2);
                    statement2.setString(1, OrderId);
                    statement2.setString(2, item.getProId());
                    statement2.setInt(3, item.getQuantity());
                    statement2.executeUpdate();

                    ProductDAO pDAO = new ProductDAO();
                    pDAO.decsProductAmount(item.getQuantity(), item.getProId());
                } catch (Exception ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            });
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //get new OrderID
    public String getNewId(String OwnerId) {
        String getId = "SELECT max(OrderId) as ID FROM ordered Where Order_Owner like ?";
        try {
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ID.setString(1, OwnerId);
            ResultSet IDrs = ID.executeQuery();
            if (IDrs.next()) {
                try {
                    String IDNUM = IDrs.getString("ID").substring(OwnerId.length() + 2);
                    int NUM = Integer.parseInt(IDNUM) + 1;
                    return OwnerId + "OR" + String.format("%03d", NUM);
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

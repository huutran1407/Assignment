/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.CreditCard;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fsoft
 */
public class CreditcardDAO {

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

    public boolean LinkCreditCard(String id,String CardOwner, String CardNumber, int CardExpM, int CardExpY, String CVC) {
        try {
            if (isExistCard(id)) {
                String sql = "UPDATE [PaymentCard]\n"
                        + "   SET [CardOwner] = ?\n"
                        + "          ,[CardNumber] = ?\n"
                        + "          ,[CardExpMonth] = ?\n"
                        + "          ,[CardExpYear] = ?\n"
                        + "          ,[CVC] = ?\n"
                        + " WHERE [UserId] LIKE ?";
                PreparedStatement statement = conn.getConnection().prepareStatement(sql);
                statement.setString(1, CardOwner);
                statement.setString(2, CardNumber);
                statement.setInt(3, CardExpM);
                statement.setInt(4, CardExpY);
                statement.setString(5, CVC);
                statement.setString(6, id);
                statement.executeUpdate();
            }else{
                String sql ="INSERT INTO PaymentCard\n"
                    + "(UserId,CardOwner,CardNumber,CardExpMonth,CardExpYear,CVC)\n"
                    + "values\n"
                    + "(?,?,?,?,?,?)";
                PreparedStatement statement = conn.getConnection().prepareStatement(sql);
                statement.setString(1, id);
                statement.setString(2, CardOwner);
                statement.setString(3, CardNumber);
                statement.setInt(4, CardExpM);
                statement.setInt(5, CardExpY);
                statement.setString(6, CVC);
                
                statement.executeUpdate();
            }

            return true;
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean isExistCard(String UserId) {
        String sql = "Select * From PaymentCard\n"
                + "where UserId LIKE ?";
        try {
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1, UserId);
            ResultSet rs = statment.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
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

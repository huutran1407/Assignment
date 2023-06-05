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
import entity.Users;

/**
 *
 * @author fsoft
 */
public class UsersDAO  {
    DBContext conn = new DBContext();
    public ArrayList<Users> getUsers() {
        ArrayList<Users> students = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Users]";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Users s = new Users();
                s.setUserId(rs.getString("UserId"));
                s.setUserName(rs.getString("UserName"));
                s.setPassword(rs.getString("Password"));
                s.setUserFullName(rs.getNString("User_FullName"));
                s.setIsAdmin(rs.getInt("isAdmin")==1);
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getString("Contact"));
                s.setDisplayName(rs.getNString("DisplayName"));
                students.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    
    public String checkLogin(String Username,String Password){
        String sql = "SELECT * FROM Users s\n"
                    + "WHERE s.UserName = ?";
         try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Username);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                if(Password.equals(rs.getString("Password"))){
                    return "Success";
                }
                return "Incorrect Password";
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return "Incorrect Username";
    }
    
    public Users getUsers(String id){
        try {
            String sql = "SELECT * FROM Users s\n"
                    + "WHERE s.UserId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Users s = new Users();
                s.setUserId(rs.getString("UsersId"));
                s.setUserName(rs.getString("UserName"));
                s.setPassword(rs.getString("Password"));
                s.setUserFullName(rs.getNString("User_FullName"));
                s.setIsAdmin(rs.getInt("isAdmin")==1);
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getString("Contact"));
                s.setDisplayName(rs.getNString("DisplayName"));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertUsers(String uName, String uFullName, String uPassword, boolean uIsAdmin, String uEmail, String uContact, String uDisplayName, String uId ){
        try {
            String sql = "INSERT INTO Users VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, uId);
            statement.setString(2, uName);
            statement.setString(3, uFullName);
            statement.setString(4, uPassword);
            statement.setInt(5, uIsAdmin?1:0);
            statement.setString(6, uEmail);
            statement.setString(7, uContact);
            statement.setString(8, uDisplayName);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStudent(String uName, String uFullName, String uPassword, boolean uIsAdmin, String uEmail, String uContact, String uDisplayName, String uId){
        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [UserName] = ?\n"
                    + "      ,[User_FullName] = ?\n"
                    + "      ,[Password] = ?\n"
                    + "      ,[isAdmin] = ?\n"
                    + "      ,[Email] = ?\n"
                    + "      ,[Contact] = ?\n"
                    + "      ,[DisplayName] = ?\n"
                    + " WHERE [UserId] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, uName);
            statement.setString(2, uFullName);
            statement.setString(3, uPassword);
            statement.setInt(4, uIsAdmin?1:0);
            statement.setString(5, uEmail);
            statement.setString(6, uContact);
            statement.setString(7, uDisplayName);
            statement.setString(8, uId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(String id){
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM Users\n"
                    + "WHERE User_Id=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}


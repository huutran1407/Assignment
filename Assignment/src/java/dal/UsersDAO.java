/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                s.setIsBanned(rs.getInt("Banned")==1);
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getString("Contact"));
                s.setDisplayName(rs.getNString("DisplayName"));
                s.setJoinDate(rs.getDate("joinDate"));
                s.setAvatar(rs.getString("User_Avatar"));
                students.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    
    public String checkLogin(String User,String Password){
        String sql = "SELECT * FROM Users s\n"
                    + "WHERE s.Email = ? OR s.UserName = ?";
         try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            statement.setString(2, User);
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
         return "Email or Username not existed";
    }
    
    //funtion to SignIn User Account
    public String SignInUser(String Email, String UserName, String DisplayName, String Password){
        String UserId = getNewUserId();
        if(isExistEmail(Email)){
            return "Email Existed";
        }else if(isExistUsername(UserName)){
            return "Username Existed";
        }else{
            String sql ="INSERT INTO Users\n"
                    + "(UserId,Email,UserName,DisplayName,Password)\n"
                    + "values\n"
                    + "(?,?,?,?,?)";
            try{
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1,UserId);
            statment.setString(2,Email);
            statment.setString(3,UserName);
            statment.setString(4,DisplayName);
            statment.setString(5,Password);
            statment.executeUpdate();
            }catch (Exception ex) {
                Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return "Success";
    }
    
    //check if the Username is existed
    public boolean isExistUsername(String Username){
        String sql = "Select * From Users\n"
                + "where UserName LIKE ?";
        try{
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1,Username);
            ResultSet rs = statment.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //funtion to check Exist Email
    public boolean isExistEmail(String Email){
        String sql = "Select * From Users\n"
                + "where Email LIKE ?";
        try{
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1,Email);
            ResultSet rs = statment.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //funtion to get ID for new User
    public String getNewUserId(){
        String getId = "SELECT max(UserId) as ID FROM Users Where UserId not like 'AD%'";
        try{
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ResultSet IDrs = ID.executeQuery();
             if(IDrs.next()){
                try{
                    String IDNUM = IDrs.getString("ID").substring(2);
                    int NUM = Integer.parseInt(IDNUM)+1;
                    return "US" + String.format("%03d",NUM);
                }catch(NullPointerException ex){
                    return "US001";
                }
            }
        }catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }
    
    //getUsersByID
    public Users getUsersByID(String id){
        try {
            String sql = "SELECT * FROM Users s\n"
                    + "WHERE s.UserId = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Users s = new Users();
                s.setUserId(rs.getString("UserId"));
                s.setUserName(rs.getString("UserName"));
                s.setPassword(rs.getString("Password"));
                s.setUserFullName(rs.getNString("User_FullName"));
                s.setIsAdmin(rs.getInt("isAdmin")==1);
                s.setIsBanned(rs.getInt("Banned")==1);
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getString("Contact"));
                s.setDisplayName(rs.getNString("DisplayName"));
                s.setJoinDate(rs.getDate("joinDate"));
                s.setAvatar(rs.getString("User_Avatar"));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    //get UserID
    public String getUserId(String User){
        String sql = "SELECT UserId FROM Users s\n"
                    + "WHERE s.Email = ? OR s.UserName = ?";
         try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            statement.setString(2, User);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                return rs.getString("UserId");
             }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return "Fail";
    }
    
    public boolean updateUserAvatar(String uId, String ImgPath){
        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [User_Avatar] = ?\n"
                    + " WHERE [UserId] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, ImgPath);
            statement.setString(2, uId);
            statement.executeUpdate();
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //update user profile
    public void updateUser(String uName, String uFullName, String uEmail, String uContact, String uDisplayName, String uId){
        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [UserName] = ?\n"
                    + "      ,[User_FullName] = ?\n"
                    + "      ,[Email] = ?\n"
                    + "      ,[Contact] = ?\n"
                    + "      ,[DisplayName] = ?\n"
                    + " WHERE [UserId] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, uName);
            statement.setString(2, uFullName);
            statement.setString(3, uEmail);
            statement.setString(4, uContact);
            statement.setString(5, uDisplayName);
            statement.setString(6, uId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //change User Password
    public void ChangePass(String uId, String Pass){
        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [UserId] = ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Pass);
            statement.setString(2, uId);
            statement.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteUser(String id){
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM Users\n"
                    + "WHERE UserId=?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}


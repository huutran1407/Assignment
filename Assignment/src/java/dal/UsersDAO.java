/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Cart;
import entity.OrderItems;
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
public class UsersDAO {

    DBContext conn = new DBContext();

    public ArrayList<Users> getUsers(String search, int pageNum,int proPerPage) {
        ArrayList<Users> students = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Users]\n"
                    + "WHERE UserId LIKE ? OR DisplayName LIKE ?\n"
                    + "ORDER BY UserId\n"
                    + "OFFSET ? rows\n"
                    + "FETCH NEXT ? rows only";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, "%"+search+"%");
            statement.setString(2, "%"+search+"%");
            statement.setInt(3, (pageNum-1)*proPerPage);
            statement.setInt(4, proPerPage);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users s = new Users();
                s.setUserId(rs.getString("UserId"));
                s.setUserName(rs.getString("UserName"));
                s.setPassword(rs.getString("Password"));
                s.setUserFullName(rs.getNString("User_FullName"));
                s.setIsAdmin(rs.getInt("isAdmin") == 1);
                s.setIsBanned(rs.getInt("Banned") == 1);
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
    
    public int getNumberOfPage(int numPerPage,String Name) {
        try {
            String sql = "Select ISNULL(COUNT(UserId),0) as count\n"
                                +"from Users\n"
                                +"where DisplayName LIKE ? OR UserId LIKE ?";
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1,"%"+Name+"%");
            statement.setString(2,"%"+Name+"%");
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

    public String checkLogin(String User, String Password) {
        String sql = "SELECT * FROM Users s\n"
                + "WHERE (s.Email = ? OR s.UserName = ?)\n"
                + "AND s.Banned = 0";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            statement.setString(2, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                if (Password.equals(rs.getString("Password"))) {
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
    public String SignInUser(String Email, String UserName, String DisplayName, String Password) {
        String UserId = getNewUserId();
        if (isExistEmail(Email)) {
            return "Email Existed";
        } else if (isExistUsername(UserName)) {
            return "Username Existed";
        } else {
            String sql = "INSERT INTO Users\n"
                    + "(UserId,Email,UserName,DisplayName,Password)\n"
                    + "values\n"
                    + "(?,?,?,?,?)";
            try {
                PreparedStatement statment = conn.getConnection().prepareStatement(sql);
                statment.setString(1, UserId);
                statment.setString(2, Email);
                statment.setString(3, UserName);
                statment.setString(4, DisplayName);
                statment.setString(5, Password);
                statment.executeUpdate();
            } catch (Exception ex) {
                Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return "Success";
    }

    //check if the Username is existed
    public boolean isExistUsername(String Username) {
        String sql = "Select * From Users\n"
                + "where UserName LIKE ?";
        try {
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1, Username);
            ResultSet rs = statment.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //funtion to check Exist Email
    public boolean isExistEmail(String Email) {
        String sql = "Select * From Users\n"
                + "where Email LIKE ?";
        try {
            PreparedStatement statment = conn.getConnection().prepareStatement(sql);
            statment.setString(1, Email);
            ResultSet rs = statment.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //funtion to get ID for new User
    public String getNewUserId() {
        String getId = "SELECT max(UserId) as ID FROM Users Where UserId not like 'AD%'";
        try {
            PreparedStatement ID = conn.getConnection().prepareStatement(getId);
            ResultSet IDrs = ID.executeQuery();
            if (IDrs.next()) {
                try {
                    String IDNUM = IDrs.getString("ID").substring(2);
                    int NUM = Integer.parseInt(IDNUM) + 1;
                    return "US" + String.format("%03d", NUM);
                } catch (NullPointerException ex) {
                    return "US001";
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    //getUsersByID
    public Users getUsersByID(String id) {
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
                s.setIsAdmin(rs.getInt("isAdmin") == 1);
                s.setIsBanned(rs.getInt("Banned") == 1);
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
    public String getUserId(String User) {
        String sql = "SELECT UserId FROM Users s\n"
                + "WHERE s.Email = ? OR s.UserName = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            statement.setString(2, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("UserId");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Fail";
    }

    public boolean updateUserAvatar(String uId, String ImgPath) {
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
    public void updateUser(String uName, String uFullName, String uEmail, String uContact, String uDisplayName, String uId) {
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
    public void ChangePass(String uId, String Pass) {
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

    //get average Rating
    public float getUserRating(String User) {
        String sql = "SELECT ISNULL(AVG(Rate.Rate),0) as avg\n"
                + "FROM Rate join Product on Rate.ProductId = Product.Pro_Id\n"
                + "WHERE Product.Pro_Seller LIKE ?;";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getFloat("avg");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //get total number of rating
    public int getUserNumberRating(String User) {
        String sql = "SELECT ISNULL(COUNT(Rate.Rate),0) as count\n"
                + "FROM Rate join Product on Rate.ProductId = Product.Pro_Id\n"
                + "WHERE Product.Pro_Seller LIKE ?;";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //get number of follower
    public int getNumberFollower(String User) {
        String sql = "SELECT ISNULL(COUNT(FollowedId),0) as count\n"
                + "FROM Follow\n"
                + "WHERE FollowedId LIKE ?;";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //get number of following
    public int getNumberFollowing(String User) {
        String sql = "SELECT ISNULL(COUNT(UserId),0) as count\n"
                + "FROM Follow\n"
                + "WHERE UserId LIKE ?;";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, User);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void followUser(String UserId, String FollowedId) {
        String sql = "INSERT INTO Follow\n"
                + "values(?,?)";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, FollowedId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unFollowUser(String UserId, String FollowedId) {
        String sql = "DELETE FROM Follow\n"
                + "where UserId = ? AND FollowedId = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, FollowedId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isFollowed(String UserId, String FollowedId) {
        String sql = "select ISNULL(COUNT(UserId),0) as count\n"
                + "from Follow\n"
                + "where UserId = ? AND FollowedId = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, FollowedId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") != 0;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void banUser(String UserId){
        String sql = "UPDATE Users\n"
                + "SET\n"
                + "Banned = 1\n"
                + "Where UserId = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void unBanUser(String UserId){
        String sql = "UPDATE Users\n"
                + "SET\n"
                + "Banned = 0\n"
                + "Where UserId = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateIntoCart(String UserId, String ProId, int Quantity) {
        String sql = "UPDATE UserCart\n"
                + "SET Pro_Quantity = (Select Pro_Quantity from UserCart WHERE UserId = ? AND Pro_Id = ?) + ?\n"
                + "WHERE UserId = ? AND Pro_Id = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, ProId);
            statement.setInt(3, Quantity);
            statement.setString(4, UserId);
            statement.setString(5, ProId);
            statement.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean isExistInCart(String Userid, String ProId) {
        String sql = "select ROWCOUNT_BIG() as count\n"
                + "from UserCart\n"
                + "where UserId = ? AND Pro_Id = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, Userid);
            statement.setString(2, ProId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void insertIntoCart(String UserId, String ProId, int Quantity) {
        if (isExistInCart(UserId, ProId)) {
            updateIntoCart(UserId, ProId, Quantity);
        } else {
            String sql = "INSERT INTO UserCart\n"
                    + "values\n"
                    + "(?,?,?)";
            try {
                PreparedStatement statement = conn.getConnection().prepareStatement(sql);
                statement.setString(1, UserId);
                statement.setString(2, ProId);
                statement.setInt(3, Quantity);
                statement.executeUpdate();
            } catch (Exception e) {
                Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public Cart getUserCart(String UserId) {
        String sql = "select *\n"
                + "from UserCart\n"
                + "where UserId = ?";
        try {
            PreparedStatement statement = conn.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            ResultSet rs = statement.executeQuery();
            Cart c = new Cart();
            while (rs.next()) {
                OrderItems o = new OrderItems();
                o.setProId(rs.getString("Pro_Id"));
                o.setQuantity(rs.getInt("Pro_Quantity"));
                c.addItem(o);
            }
            return c;
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void AddToCart(String UserId, String Pro_Id, int Pro_Quantity) {
        try {
            DBContext conn2 = new DBContext();
            String sql = "Insert Into UserCart\n"
                    + "values\n"
                    + "(?,?,?)";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, Pro_Id);
            statement.setInt(3, Pro_Quantity);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteCartItem(String UserId, String Pro_Id) {
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM UserCart\n"
                    + "where UserId = ? AND Pro_Id = ?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.setString(2, Pro_Id);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void clearUserCart(String UserId){
        try {
            DBContext conn2 = new DBContext();
            String sql = "DELETE FROM UserCart\n"
                    + "where UserId = ?";
            PreparedStatement statement = conn2.getConnection().prepareStatement(sql);
            statement.setString(1, UserId);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(String id) {
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

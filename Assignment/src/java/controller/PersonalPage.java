/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CreditcardDAO;
import dal.ProductDAO;
import dal.UsersDAO;
import entity.CreditCard;
import entity.Products;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author VHC
 */
@WebServlet(name="PersonalPage", urlPatterns={"/ppage"})
public class PersonalPage extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String UserId = request.getParameter("UserId");
        
        ProductDAO pDAO = new ProductDAO();
        UsersDAO DAO = new UsersDAO();
         CreditcardDAO cardDAO = new CreditcardDAO();
        
        //get cookies
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> cookieMap = new HashMap<>();
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        //get cookie by name
        Cookie UserID = cookieMap.get("loginId");
        
        String Userid = "Guest";
        
        if(UserID != null){
            Userid = UserID.getValue();
        }
        
        ArrayList<Products> ProductList = pDAO.getUserProduct(UserId);
        ArrayList<Products> SoldOut = pDAO.getUserSoldOutProduct(UserId);
        Users u = DAO.getUsersByID(UserId);
        float rating = DAO.getUserRating(UserId);
        int numRate = DAO.getUserNumberRating(UserId);
        int numFollower = DAO.getNumberFollower(UserId);
        int numFollowing = DAO.getNumberFollowing(UserId);
        String JoinDateDiff = find(u.getJoinDate());
        boolean isFollowed = DAO.isFollowed(Userid, UserId);
        CreditCard card = cardDAO.getCardByID(Userid);
        
        request.setAttribute("card", card);
        request.setAttribute("JoinDateDiff", JoinDateDiff);
        request.setAttribute("Following", numFollowing);
        request.setAttribute("Follower", numFollower);
        request.setAttribute("NumRate", numRate);
        request.setAttribute("Rating", rating);
        request.setAttribute("Products", ProductList);
        request.setAttribute("SoldOut", SoldOut);
        request.setAttribute("User", u);
        request.setAttribute("isFollowed", isFollowed);
        
        request.getRequestDispatcher("/View/Home.jsp?Content=PersonalPage.jsp").forward(request, response);
    } 
    
        protected String find(Date date1){   
        //get current date
        Date date2 = new Date();
         // Get period between the first and the second date   
        Period difference = Period.between(convertToLocalDateViaInstant(date1), convertToLocalDateViaInstant(date2));   

        return ""+ difference.getYears() + " Years "+ difference.getMonths() + " Months " + difference.getDays() + " Days";
    }
        
    public LocalDate convertToLocalDateViaInstant(Date dateToConvert) {
    return Instant.ofEpochMilli(dateToConvert.getTime())
      .atZone(ZoneId.systemDefault())
      .toLocalDate();
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

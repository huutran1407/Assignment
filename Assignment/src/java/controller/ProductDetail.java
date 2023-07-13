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
import entity.Rating;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author VHC
 */
public class ProductDetail extends HttpServlet {
   
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
        String ProId = request.getParameter("PID");
        
        UsersDAO uDAO = new UsersDAO();
        ProductDAO pDAO = new ProductDAO();
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
        
        CreditCard card = cardDAO.getCardByID(Userid);
        Products p = pDAO.getProduct(ProId);
        Users s = uDAO.getUsersByID(p.getPro_Seller());
        Users u = uDAO.getUsersByID(Userid);
        ArrayList<Rating> RateList = pDAO.getProductRates(ProId);
        
        request.setAttribute("card", card);
        request.setAttribute("RateList", RateList);
        request.setAttribute("Seller", s);
        request.setAttribute("User", u);
        request.setAttribute("Product", p);
        request.setAttribute("isRated", pDAO.isRated(Userid, ProId));
        request.getRequestDispatcher("/View/Home.jsp?Content=ProductPage.jsp").forward(request, response);
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

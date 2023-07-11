package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import dal.OrderDAO;
import dal.ProductDAO;
import dal.UsersDAO;
import entity.Cart;
import entity.OrderItems;
import entity.Products;
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
public class BuyProduct extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String Payment = request.getParameter("PaymentMethod");
        String CustomerName = request.getParameter("CustomberName");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String Address = request.getParameter("Address");
        
        //get cookies
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> cookieMap = new HashMap<>();
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        //get cookie by name
        Cookie UserID = cookieMap.get("loginId");
        
        OrderDAO oDAO = new OrderDAO();
        UsersDAO uDAO = new UsersDAO();
        
        Cart cart = uDAO.getUserCart(UserID.getValue());
        
        oDAO.insertOrder(UserID.getValue(), cart.getTotalPrice(), Payment, CustomerName, PhoneNumber, Address, cart.getProList());
        uDAO.clearUserCart(UserID.getValue());
        
        response.sendRedirect("cart");
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
        String Quantity = request.getParameter("Quantity");
        String ProId = request.getParameter("ProId");
        String TotalPrice = request.getParameter("TotalPrice");
        float OrderPrice = getPrice(TotalPrice);
        String Payment = request.getParameter("PaymentMethod");
        String CustomerName = request.getParameter("CustomberName");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String Address = request.getParameter("Address");
        
        
        //get cookies
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> cookieMap = new HashMap<>();
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        //get cookie by name
        Cookie UserID = cookieMap.get("loginId");
        
        OrderDAO oDAO = new OrderDAO();
        
        OrderItems item = new OrderItems(ProId,Integer.parseInt(Quantity));
        ArrayList<OrderItems> OrderItems = new ArrayList<>();
        OrderItems.add(item);
        
        oDAO.insertOrder(UserID.getValue(), OrderPrice, Payment, CustomerName, PhoneNumber, Address, OrderItems);
        
        response.sendRedirect("pdetail?PID="+ProId);
    }
    
    public float getPrice(String Price){
        return Float.parseFloat(Price.substring(0, Price.length()-3).replaceAll(",", ""))/1000;
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

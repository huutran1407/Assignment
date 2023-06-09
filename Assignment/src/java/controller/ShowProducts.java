/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author VHC
 */
@WebServlet(name = "ShowProducts", urlPatterns = {"/productlist"})
public class ShowProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String CID = request.getParameter("CID");
        String search = request.getParameter("search");
        int Page = Integer.parseInt(request.getParameter("Page")==null?"1":request.getParameter("Page"));
        int proPerPage = 8;
        

        ProductDAO pDAO = new ProductDAO();
        request.setAttribute("Page", Page);
        

        if (CID == null) {
            int numOfPage = pDAO.getNumberOfPage(proPerPage,"",search);
            ArrayList<Products> ProductList = pDAO.searchProducts(search,Page, proPerPage);
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("plist", ProductList);
            request.getRequestDispatcher("/View/Home.jsp?Content=ProductList.jsp").forward(request, response);
        } else {
            int numOfPage = pDAO.getNumberOfPage(proPerPage,CID,"");
            ArrayList<Products> ProductList = pDAO.getProductsByCategory(CID,Page, proPerPage);
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("plist", ProductList);
            request.getRequestDispatcher("/View/Home.jsp?Content=ProductList.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

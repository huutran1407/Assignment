/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.UsersDAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author VHC
 */
@WebServlet(name="AddProduct", urlPatterns={"/addpro"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddProduct extends HttpServlet {
   
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
            out.println("<title>Servlet AddProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath () + "</h1>");
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
        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> cList =  cDAO.getCategories();
        
        request.setAttribute("cList", cList);
        request.getRequestDispatcher("/View/Home.jsp?Content=AddProduct.jsp").forward(request, response);
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
        Part filePart = request.getPart("img");
        String pType = request.getParameter("productType");
        String pName = request.getParameter("product_name");
        String pDetails = request.getParameter("product_description");
        float pPrice = Float.parseFloat(request.getParameter("product_price"));
        int pQuantity = Integer.parseInt(request.getParameter("product_quantity"));
        
         //get cookies
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> cookieMap = new HashMap<>();
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        //get cookie by name
        Cookie UserID = cookieMap.get("loginId");
        
        String StoredPath = UpdateFile(filePart);
        
        ProductDAO DAO = new ProductDAO();
        DAO.insertProduct(pName, pQuantity, pType, UserID.getValue(), StoredPath, pDetails, pPrice);
        
        response.sendRedirect("ppage?UserId="+UserID.getValue());
    }
    
    private String UpdateFile(Part part) {
        try {
            String uploadPath = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                    + File.separator + "web"
                    + File.separator + "Database"
                    + File.separator + "IMG"
                    + File.separator + "Products";
            
            String StorePath = "Database"
                    + File.separator + "IMG"
                    + File.separator + "Products"
                    + File.separator + part.getSubmittedFileName();
            File uploadDir = new File(uploadPath);
            
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String fileName = part.getSubmittedFileName();
            File f = new File(uploadPath + File.separator + fileName);
            if (f.exists() && !f.isDirectory()) {
                fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "2" + fileName.substring(fileName.lastIndexOf("."));
                StorePath = StorePath.substring(0, StorePath.lastIndexOf(".")) + "2" + StorePath.substring(StorePath.lastIndexOf("."));
            }
            part.write(uploadPath + File.separator + fileName);
            return StorePath;
        } catch (IOException e) {
        }
        return null;
    }

    private boolean DelFile(String FilePath) {
        String path = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                + File.separator + "web"
                + File.separator + FilePath;
        File IMG = new File(path);
        return IMG.delete();
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

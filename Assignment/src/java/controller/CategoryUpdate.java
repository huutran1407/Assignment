/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import entity.Category;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;

/**
 *
 * @author VHC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class CategoryUpdate extends HttpServlet {

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
        HttpSession session = request.getSession();
        CategoryDAO DAO = new CategoryDAO();

        String CategoryID = request.getParameter("CategoryId");
        String name = request.getParameter("CategoryName");
        Part filePart = request.getPart("img");
        String OldImgpath = DAO.getCategory(CategoryID).getCategory_Img();
        String Mess;
        
        if (filePart.getSize() != 0) {
            
            String path = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                    + File.separator + "web"
                    + File.separator + "Database"
                    + File.separator + "IMG"
                    + File.separator + "Categories";
            String StorePath = "Database"
                    + File.separator + "IMG"
                    + File.separator + "Categories"
                    + File.separator + filePart.getSubmittedFileName();

            if (UpdateFile(filePart, path, OldImgpath)) {
                if (DAO.updateCategory(CategoryID, name, StorePath)) {
                    Mess = "Update Success";
                } else {
                    Mess = "Update Fail";
                }
            }else{
                Mess ="Delete and Create File fails";
            }
        } else {
            if (DAO.updateCategory(CategoryID, name, OldImgpath)) {
                Mess = "Update Success Old Path";
            } else {
                Mess = "Update Fail Old path";
            }
        }
        
        ArrayList<Category> CatList = DAO.getCategories();
        session.setAttribute("CatList", CatList);
        request.setAttribute("Mess", Mess);
        response.sendRedirect("View/Home.jsp?Content=CategoryList.jsp");
    }

    private boolean UpdateFile(Part part, String uploadPath, String OldPath) {
        boolean test = false;
        try {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            if(!DelFile(OldPath)){
                return false;
            }

            String fileName = part.getSubmittedFileName();
            File f = new File(uploadPath + File.separator + fileName);
            if (f.exists() && !f.isDirectory()) {
                fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "2" + fileName.substring(fileName.lastIndexOf("."));
            }
            part.write(uploadPath + File.separator + fileName);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    private boolean DelFile(String FilePath) {
        String path = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                + File.separator + "web"
                + File.separator + FilePath;
        File IMG = new File(path);
        return IMG.delete();
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

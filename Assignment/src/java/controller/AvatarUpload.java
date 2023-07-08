/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UsersDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author VHC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AvatarUpload extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AvatarUpload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AvatarUpload at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("avatar");

        //get cookies
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> cookieMap = new HashMap<>();
        for (Cookie cookie : cookies) {
            cookieMap.put(cookie.getName(), cookie);
        }
        //get cookie by name
        Cookie UserID = cookieMap.get("loginId");

        String Mess = "";
        UsersDAO DAO = new UsersDAO();
        Users u = DAO.getUsersByID(UserID.getValue());
        String OldImgpath = u.getAvatar();

        String path = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                + File.separator + "web"
                + File.separator + "Database"
                + File.separator + "IMG"
                + File.separator + "UserAvatar";
        String StorePath = "Database"
                + File.separator + "IMG"
                + File.separator + "UserAvatar"
                + File.separator + filePart.getSubmittedFileName();
        if (UpdateFile(filePart, path, OldImgpath, UserID.getValue(), StorePath)) {
            Mess = "Update Success";
        } else {
            Mess = "Update file fail";
        }

        response.sendRedirect("profile");
    }

    private boolean UpdateFile(Part part, String uploadPath, String OldPath, String UserId, String StorePath) {
        try {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            if (OldPath != null) {
                File OldImgPath = new File(OldPath);
                if (OldImgPath.exists()) {
                    if (!DelFile(OldPath)) {
                        return false;
                    }
                }
            }

            String fileName = part.getSubmittedFileName();
            File f = new File(uploadPath + File.separator + fileName);
            if (f.exists() && !f.isDirectory()) {
                fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "2" + fileName.substring(fileName.lastIndexOf("."));
                StorePath = StorePath.substring(0, StorePath.lastIndexOf(".")) + "2" + StorePath.substring(StorePath.lastIndexOf("."));
            }
            part.write(uploadPath + File.separator + fileName);
            UsersDAO DAO = new UsersDAO();
            return DAO.updateUserAvatar(UserId, StorePath);
        } catch (IOException e) {
        }
        return false;
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

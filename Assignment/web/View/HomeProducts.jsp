<%-- 
    Document   : HomeNavBar
    Created on : Jun 15, 2023, 12:06:35 AM
    Author     : VHC
--%>

<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            CategoryDAO DAO = new CategoryDAO();
            ArrayList<Category> obj = DAO.getCategories();
            request.setAttribute("obj",obj);
        %>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/HomeProductsCss.css?version=1">
    </head>
    <body>
        <h1 class="text-center mt-5 mb-5 font-weight-normal" style="font-size: 20px;">DANH MỤC SẢN PHẨM</h1>
        <div class="flex-b w-full m-auto justify-content-center">
            <c:forEach items="${obj}" var="o">
                <div class="Item col-md-2 ml-2 mr-2">
                    <img class="SampleImg img-fluid" src="${pageContext.request.contextPath}/${o.getCategory_Img()}" alt="alt"/>
                    <div class="Item-name">${o.getCategory()}</div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>

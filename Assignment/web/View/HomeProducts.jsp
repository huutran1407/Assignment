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
        <h1 class="text-center m-b-0 m-t-30 font-weight-normal" style="font-size: 20px;">DANH MỤC SẢN PHẨM</h1>
        <div class="Item_List w-75 m-r-auto m-l-auto m-t-18 m-b-28">
            <div class="row justify-content-start p-t-30 p-b-30">
                <c:forEach items="${obj}" var="o">
                    <div class="Item col-md-2 m-t-10 m-b-10">
                        <img class="SampleImg img-fluid bo-cir" src="${pageContext.request.contextPath}/${o.getCategory_Img()}" alt="alt"/>
                        <div class="Item-name">${o.getCategory()}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>

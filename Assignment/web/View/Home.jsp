<%-- 
    Document   : Home
    Created on : Jun 5, 2023, 1:20:02 PM
    Author     : VHC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/View/assets/images/icons/favicon.ico?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/css/bootstrap.min.css?version=1">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css?version=1">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/vendor/animate/animate.css?version=1">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/vendor/css-hamburgers/hamburgers.min.css?version=1">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/vendor/select2/select2.min.css?version=1">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/util.css">

        <%
            String Content = (String)request.getParameter("Content");
            if(Content == "" || Content == null){
                Content = "HomeProducts.jsp";
            }
            request.setAttribute("Content",Content);
        %>
    </head>
    <body>
        <%@include file="PageHeader.jsp" %>
        <div id="Content">
            <c:import url="<%=Content%>"></c:import>
         </div>
        <%@include file="PageFooter.jsp" %>

        <!--===============================================================================================-->	
        <script src="${pageContext.request.contextPath}/View/assets/vendor/jquery/jquery-3.2.1.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/js/popper.js?version=1"></script>
        <script src="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/js/bootstrap.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/select2/select2.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/tilt/tilt.jquery.min.js?version=1"></script>
        <script>
            console.log("${UserId}");
            console.log("${UserId.substring(0,2)=='AD'}");

        </script>
    </body>
</html>

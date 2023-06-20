<%-- 
    Document   : CategoryAdd
    Created on : Jun 19, 2023, 7:56:50 AM
    Author     : VHC
--%>

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/util.css?version=1">
    </head>

    <body>
        <form class="CategoryForm" action="${pageContext.request.contextPath}/CategoryUpload" method="post" enctype="multipart/form-data">
            <div class="inputValue">
                Category Name
                <input type="text" name="CategoryName">
            </div>
            <div class="inputValue">
                Category Sample img
                <input type="file" accept="image/*" name="img" size="50">
            </div>
            <button type="submit" name="submit">
                Upload
            </button>
        </form>


        <!--===============================================================================================-->	
        <script src="${pageContext.request.contextPath}/View/assets/vendor/jquery/jquery-3.2.1.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/js/popper.js?version=1"></script>
        <script src="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/js/bootstrap.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/select2/select2.min.js?version=1"></script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/vendor/tilt/tilt.jquery.min.js?version=1"></script>
    </body>
</html>

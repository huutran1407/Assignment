<%-- 
    Document   : PageHeader
    Created on : Jun 5, 2023, 3:07:37 PM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Untitled</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/HeaderStyle.css?version=1"/>
    </head>

    <body>
        <div>
            <div class="header-blue">
                <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                        <a class="navbar-brand col-2" href="#">Chợ Đồ Cũ</a>
<!--                        <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="navbar-toggler-icon"></span>
                        </button>-->
                        <div class="collapse navbar-collapse col-10"
                             id="navcol-1">
                            <ul class="nav navbar-nav">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" href="#">Link</a>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Dropdown </a>
                                    <div class="dropdown-menu" role="menu">
                                        <a class="dropdown-item" role="presentation" href="#">First Item</a>
                                        <a class="dropdown-item" role="presentation" href="#">Second Item</a>
                                        <a class="dropdown-item" role="presentation" href="#">Third Item</a>
                                    </div>
                                </li>
                            </ul>
                            <form class="form-inline mr-auto" target="_self">
                                <div class="form-group">
                                    <label for="search-field">
                                        <i class="fa fa-search"></i>
                                    </label>
                                    <input class="form-control search-field" type="search" name="search" id="search-field">
                                </div>
                            </form>
                            <c:if test="${UserId==null}">
                                <div>
                                    <span class="navbar-text"> 
                                        <a href="${pageContext.request.contextPath}/View/LoginPage.jsp" class="login">Log In</a>
                                    </span>
                                    <a class="btn btn-light action-button" role="button" href="${pageContext.request.contextPath}/View/SigninPage.jsp"">Sign Up</a>
                                </div>
                            </c:if>
                            <c:if test="${UserId!=null}">
                                <div class="flex-m">
                                    <span class="navbar-text"> 
                                        <a href="#" class="login fa fa-user"></a>
                                    </span>
                                    <form action="${pageContext.request.contextPath}/LogOut" method="post">
                                        <button class="btn btn-light action-button" role="button" href="#">
                                            <i class="fa fa-power-off" aria-hidden="true"></i>
                                            Log Out
                                        </button>
                                    </form>
                                </div>
                            </c:if>
                    </div>
                </nav>
            </div>
        </div>


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

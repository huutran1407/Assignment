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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/HeaderStyle.css"/>
    </head>

    <body>
        <c:set var="UserId" value="${cookie.loginId.value}"></c:set>
            <div>
                <div class="header-blue">
                    <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                        <a class="navbar-brand col-2" href="${pageContext.request.contextPath}/home">Chợ Đồ Cũ</a>
                    <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse col-10"
                         id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/addpro" onclick="return checkLogedIn();">Sell Product</a>
                            </li>
                        </ul>
                        <form class="search-form form-inline mr-auto" method="get" action="${pageContext.request.contextPath}/productlist" style="width: 60%" target="_self">
                            <div class="form-group w-100">
                                <label for="search-field">
                                    <i class="fa fa-search"></i>
                                </label>
                                <input class="form-control search-field" type="search" name="search" id="search-field" required placeholder="Search for product"/>
                                <button type="submit" style="display: none;"></button>
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
                                <div class="cart-drawer-container">
                                    <a class="cart-drawer fa fa-shopping-cart" href="${pageContext.request.contextPath}/cart">
                                    </a>
                                </div>
                                <span class="navbar-text">
                                    <a href="#" class="login dis-flex fa fa-user" data-toggle="dropdown" aria-expanded="false" style="font-size: 30px; margin-right: 20px">
                                        <i class="fa fa-caret-down"></i>
                                    </a>
                                    <div class="dropdown-menu" style="left: auto; right: 50px;" role="menu">
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/ppage?UserId=${UserId}">User Page</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/profile">Change Profile</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/changePass">Change Password</a>
                                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/orderlist">Ordered List</a>
                                        <c:choose>
                                            <c:when test="${UserId.substring(0,2)=='AD'}">
                                                <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/userlist">Users List</a>
                                                <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/CategoryListServlet">Categories List</a>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </span>
                                <a class="btn btn-light action-button" accesskey="1" role="button" href="${pageContext.request.contextPath}/LogOut" style="cursor: pointer;">
                                    <i class="fa fa-power-off" aria-hidden="true"></i>
                                    Log Out
                                </a>
                            </div>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
        <script>
            function checkLogedIn(){
                if(${UserId==null}){
                        alert("You need to login for selling products");
                        return false;
                }
                return true;
            }
        </script>
    </body>

</html>

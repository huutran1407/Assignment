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
        <div>
            <div class="header-blue">
                <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                    <a class="navbar-brand col-2" href="Home.jsp">Chợ Đồ Cũ</a>
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
                                    <a href="#" class="login fa fa-user dropdown-toggle dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="font-size: 30px; margin-right: 20px"></a>
                                    <div class="dropdown-menu" style="right: auto; left: auto;" role="menu">
                                        <a class="dropdown-item" role="presentation" href="#">First Item</a>
                                        <a class="dropdown-item" role="presentation" href="#">Second Item</a>
                                        <a class="dropdown-item" role="presentation" href="#">Third Item</a>
                                        <c:choose>
                                            <c:when test="${UserId.substring(0,2)=='AD'}">
                                                <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/View/Home.jsp?Content=CategoryList.jsp">Admin Item</a>
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
    </body>

</html>

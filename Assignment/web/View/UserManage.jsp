<%-- 
    Document   : UserManage
    Created on : Jul 14, 2023, 11:34:05 PM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/UserManageStyle.css?version=1"/>
    </head>
    <body>
        <c:set var="ulist" value="${requestScope.ulist}"></c:set>
        <c:set var="Page" value="${requestScope.Page}"></c:set>
        <c:set var="numOfPage" value="${requestScope.numOfPage}"></c:set>

            <div class="Product-content m-r-auto m-l-auto m-t-30 p-b-20 m-b-30">
                <div class="search m-b-10 w-75 m-r-auto m-l-auto">
                    <form action="${pageContext.request.contextPath}/userlist" method="get">
                    <input class="w-100 m-t-10" type="text" name="search" placeholder="Search User">
                    <button class="dis-none"></button>
                </form>
            </div>
            <div class="m-r-0 m-l-0 pos-relative">
                <c:forEach var="u" items="${ulist}">
                    <div class="item" onclick="window.location.href = '${pageContext.request.contextPath}/ppage?UserId=${u.getUserId()}'">
                        <div class="item_img">
                            <img src="${pageContext.request.contextPath}/${u.getAvatar()}" alt="alt"/>
                        </div>
                        <div class="item_detail text-left m-l-15">
                            <div class="item_detail-name">${u.getDisplayName()}</div>
                            <div class="item_detail-price text-danger">${u.getUserId()}</div>
                            <div class="" style="font-size: 12px">
                                <i class="fa fa-user-circle"></i>
                                ${u.getDateDiff()}
                            </div>
                            <c:if test="${u.isBanned()}">
                                <div class="Banned">
                                    <span class="font-weight-bold text-danger">Banned</span>
                                </div>
                            </c:if>

                        </div>

                    </div>
                </c:forEach>
                <div class="Paging w-100 text-center m-t-28">
                    <c:forEach var="p" begin="${Page==1?Page:Page-1}" end="${Page==numOfPage?Page:Page+1}">
                        <a href="${pageContext.request.contextPath}/userlist?Page=${p}" class="paging-num  ${p==Page?'checked':''}">${p}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>

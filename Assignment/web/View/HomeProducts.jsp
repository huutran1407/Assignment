<%-- 
    Document   : HomeNavBar
    Created on : Jun 15, 2023, 12:06:35 AM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/HomeProductsCss.css?version=1">
    </head>
    <body>
        <c:set var="Products" value="${requestScope.ProList}"></c:set>
        <c:set var="Categories" value="${requestScope.CatList}"></c:set>
        <c:set var="Page" value="${requestScope.Page}"></c:set>
        <c:set var="numOfPage" value="${requestScope.numOfPage}"></c:set>
        <c:set var="UserId" value="${cookie.loginId.value}"></c:set>
            <div class="Category">
                <h1 class="text-center m-b-0 m-t-30 font-weight-normal" style="font-size: 20px;">DANH MỤC SẢN PHẨM</h1>
                <div class="Item_List w-75 m-r-auto m-l-auto m-t-18 m-b-28">
                    <div class="ListItem dis-flex justify-content-center">
                    <c:forEach items="${Categories}" var="o">
                        <div class="Item" onclick="window.location.href = '${pageContext.request.contextPath}/productlist?CID=${o.getCategory_Id()}'">
                            <img class="SampleImg img-fluid bo-cir m-auto" src="${pageContext.request.contextPath}/${o.getCategory_Img()}" alt="alt"/>
                            <div class="Item-name">${o.getCategory()}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="Products">
            <h1 class="text-center m-b-0 m-t-30 font-weight-normal" style="font-size: 20px;">Sản phẩm mới</h1>
            <c:if test="${!Products.isEmpty()}">
                <div class=" row w-75 m-r-auto m-l-auto m-t-18 m-b-18">
                    <c:forEach var="p" items="${Products}">
                        <div class="col-md-3 item" onclick="window.location.href='${pageContext.request.contextPath}/pdetail?PID=${p.getProId()}'">
                            <div class="item_img text-center">
                                <img src="${pageContext.request.contextPath}/${p.getPro_img()}" alt="alt"/>
                            </div>
                            <div class="item_detail text-left m-l-15">
                                <div class="item_detail-name">${p.getPro_Name()}</div>
                                <div class="item_detail-price text-danger">${p.getPro_Price()}</div>
                                <div class="" style="font-size: 12px">
                                    <i class="fa fa-user-circle"></i>
                                    ${p.getDateDiff()}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="Paging w-100 text-center m-b-18">
                    <c:forEach var="p" begin="${Page==1?Page:Page-1}" end="${Page+1}">
                        <a href="${pageContext.request.contextPath}/home?Page=${p}" class="paging-num  ${p==Page?'checked':''}">${p}</a>
                    </c:forEach>
                </div>
            </c:if>
        </div>

        <script>

            $('.ListItem').slick({
                slidesToShow: 6,
                slidesToScroll: 6,
                rows: 2,
                arrows: true,
                infinite: false,
                autoplay: false,
                prevArrow: '<button class="slide-arrow prev-arrow"></button>',
                nextArrow: '<button class="slide-arrow next-arrow"></button>',
                responsive: [{
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 4,
                            slidesToScroll: 2,
                        }
                    }]
            });
        </script>
    </body>
</html>

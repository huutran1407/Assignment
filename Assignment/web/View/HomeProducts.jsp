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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/HomeProductsCss.css">
    </head>
    <body>
        <h1 class="text-center m-b-0 m-t-30 font-weight-normal" style="font-size: 20px;">DANH MỤC SẢN PHẨM</h1>
        <div class="Item_List w-75 m-r-auto m-l-auto m-t-18 m-b-28">
            <div class="ListItem dis-flex justify-content-center">
                <c:forEach items="${sessionScope.CatList}" var="o">
                    <div class="Item">
                        <img class="SampleImg img-fluid bo-cir m-auto" src="${pageContext.request.contextPath}/${o.getCategory_Img()}" alt="alt"/>
                        <div class="Item-name">${o.getCategory()}</div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script>
            $('.ListItem').slick({
                slidesPerRow: 6,
                rows: 2,
                arrows: true,
                infinite: false,
                autoplay: false,
                prevArrow: '<button class="slide-arrow prev-arrow"></button>',
                nextArrow: '<button class="slide-arrow next-arrow"></button>',
                responsive: [
                    {
                        breakpoint: 576,
                        settings: {
                            slidesPerRow: 1,
                            rows: 1
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesPerRow: 2,
                            rows: 1
                        }
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesPerRow: 3,
                            rows: 2
                        }
                    }
                ]
            });
        </script>
    </body>
</html>

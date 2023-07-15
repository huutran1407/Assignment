<%-- 
    Document   : OrderDetail
    Created on : Jul 15, 2023, 10:51:43 PM
    Author     : VHC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/OrderDetailStyle.css"/>
    </head>
    <body>
        <c:set var="order" value="${requestScope.Order}"></c:set>
            <div class="Order row m-r-auto m-l-auto m-t-30 p-b-20 m-b-30">
                <div class="Order_Sumary col-lg-6 p-l-0 p-r-0 p-b-30">
                    <div class="m-r-0 m-l-0 pos-relative">
                        <div class="Order_header m-b-20">
                            <span class="font-weight-bold p-l-10">Order Details</span>
                        </div>

                        <div class="Order_Sumary-customer-info">
                            <span class="font-weight-bold">Customer Name: </span>
                            <span class="pos-absolute right-0 p-r-10">${order.getCustomerName()}</span>
                        
                        </div>
                        <div class="Order_Sumary-customer-info">
                            <span class="font-weight-bold">Customer Address: </span>
                            <span class="pos-absolute right-0 p-r-10">${order.getAddress()}</span>
                        
                        </div>
                        <div class="Order_Sumary-customer-info">
                            <span class="font-weight-bold">Customer Phonenumber: </span>
                            <span class="pos-absolute right-0 p-r-10">${order.getMobileNumber()}</span>
                        </div>
                        <div class="Order_Sumary-customer-info">
                            <span class="font-weight-bold">Payment: </span>
                            <span class="pos-absolute right-0 p-r-10">${order.getPaymentMode()}</span>
                        </div>
                </div>
            </div>
            <div class="Order_Detail col-lg-6">

                <div class="CartSumary dis-flex w-100 justify-content-between">
                    <div class="totalMoney font-weight-bold text-dark">
                        Total Price:
                        <span class="text-danger">${order.getTotalPriceString()}</span>
                    </div>
                </div>

                <div class="m-r-0 m-l-0 pos-relative">
                    <c:forEach var="p" items="${order.getItems()}">
                        <div class="item">
                            <div class="item_img" onclick="window.location.href = '${pageContext.request.contextPath}/pdetail?PID=${p.getProduct().getProId()}';">
                                <img src="${pageContext.request.contextPath}/${p.getProduct().getPro_img()}" alt="alt"/>
                            </div>
                            <div class="item_detail text-left m-l-15">
                                <div class="item_detail-name">${p.getProduct().getPro_Name()}</div>
                                <div class="item_detail-price text-danger">${p.getProduct().getPro_Price()}</div>
                                <div class="dis-flex align-items-center">
                                    <span class="p-r-10">Quantity: </span>
                                    ${p.getQuantity()}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

    </body>
</html>

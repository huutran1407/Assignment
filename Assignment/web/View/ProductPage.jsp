<%-- 
    Document   : ProductPage
    Created on : Jul 8, 2023, 12:16:33 AM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/ProductPageStyle.css"/>

        <c:set var="p" value="${requestScope.Product}"></c:set>
        <c:set var="u" value="${requestScope.User}"></c:set>
        <c:set var="s" value="${requestScope.Seller}"></c:set>
        <c:set var="RateList" value="${requestScope.RateList}"></c:set>
        <c:set var="card" value="${requestScope.card}"></c:set>
        </head>
        <body>

            <div class="Payment pos-fixed" style="display: none;">
                <div class="Payment_window m-t-50 m-l-auto m-r-auto">
                    <form action="${pageContext.request.contextPath}/buy?PID=${p.getProId()}" method="post" onsubmit="return FormCheck()">
                    <div class="Product_preview dis-flex m-t-5 m-b-5">
                        <input type="text" name="ProId" value="${p.getProId()}" style="display: none;"/>
                        <div class="Product_img">
                            <img src="${pageContext.request.contextPath}/${p.getPro_img()}" alt="alt"/>
                        </div>
                        <div class="m-l-30">
                            <h6 class="Product-info_name">${p.getPro_Name()}</h6>
                            <div class="Product-info_Price">${p.getPro_Price()}</div>
                            <div>x <input name="Quantity" id="Product-Quantity" type="number" readonly required=""/></div>
                        </div>
                    </div>

                    <div class="Payment_method w-100 m-t-5 m-b-5">
                        <label class="dis-flex justify-content-between text-center align-items-center">
                            <span class="m-l-20 col-8">Payment Method</span>
                            <select class="PaymentMethod" name="PaymentMethod" required>
                                <option value="Offline" selected>Offline</option>
                                <option value="Online">Online</option>
                            </select>
                        </label>
                    </div>

                    <div class="CustomerInfo p-t-30 p-l-10 p-b-30">
                        <h4 class="text-center">Customer info</h4>
                        <label class="Customer_name w-100">
                            <span>Customer's name</span>
                            <input type="text" name="CustomberName" value="${u.getUserFullName()}" required>
                        </label>

                        <label class="PhoneNumber w-100">
                            <span>Customer's Phone Number</span>
                            <input type="text" name="PhoneNumber" value='${u.getContact()}' required>
                        </label>

                        <label class="CustomerAddress w-100">
                            <span>Customer's Address</span>
                            <input type="text" name="Address" required>
                        </label>
                    </div>

                    <div class="OrderResult dis-flex w-100 justify-content-between">
                        <p class="Product-info_Price">
                            Total Price: 
                            <input name="TotalPrice" class="Product-info_Price" type="text" value="" readonly required>
                        </p>
                        <div class="OrderResult_btn h-100 dis-flex justify-content-end">
                            <div style="cursor: pointer" class="btn Cancel h-100S" onclick="document.querySelector('.Payment').style.display = 'none';">Cancel</div>
                            <button style="cursor: pointer" class="Purchase h-100">Purchase</button>
                        </div>

                    </div>
                </form>
            </div>

        </div>


        <div class="Product-Content row">
            <div class="col-md-8 Product-info m-t-30">
                <div class="Product-info_img pos-relative">
                    <img src="${pageContext.request.contextPath}/${p.getPro_img()}" alt="alt"/>
                    <div class="Product-info_added">
                        <span>Posted <!-- -->${p.getDateDiff()}
                        </span>
                    </div>
                </div>

                <div class="Product-info_Detail">
                    <h1 class="Product-info_name">${p.getPro_Name()}</h1>
                    <div class="Product-info_Price">${p.getPro_Price()}</div>
                    <p class="Product-info_description">${p.getPro_des()}</p>
                </div>

                <div class="Product-feddback m-t-50 p-t-30 m-b-50">
                    <h3>User's Feedback</h3>
                    <c:forEach var="r" items="${RateList}">
                        <div class="User_Feedback w-100 dis-flex p-t-10 p-b-10">
                            <div class="Feddback-avatar">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/${r.getUser().getAvatar()}"/>
                            </div>

                            <div style="max-width: calc(100% - 50px);">
                                <div>${r.getUser().getDisplayName()}</div>
                                <div class="">
                                    <span class="feedback_rate rate_stars">
                                        <c:forEach begin="1" end="${r.getRate()}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                            </svg>
                                        </c:forEach>
                                        <c:if test="${r.getRate()%1!=0}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-half" viewBox="0 0 16 16">
                                            <path d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z"/>
                                            </svg>
                                        </c:if>
                                        <c:forEach begin="1" end="${5-r.getRate()}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star" viewBox="0 0 16 16">
                                            <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                            </svg>
                                        </c:forEach>
                                    </span>
                                </div>
                                <div class="Feedback_content">
                                    ${r.getRateMess()}
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </div>



            <div class="col-md-4">
                <div class="Seller-info m-t-30 dis-flex p-t-10" onclick="window.location.href = '${pageContext.request.contextPath}/ppage?UserId=${s.getUserId()}'">
                    <div class="Seller-info_avatar">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/${s.getAvatar()}"/>
                    </div>
                    <div class="Seller-info_profile">
                        <b class="m-r-5">${s.getDisplayName()}</b>
                        <div style="font-size: 13px;"><b>Joined: </b>${s.getDateDiff()}</div>
                    </div>
                </div>

                <div class="Seller-contact w-100 m-t-30">
                    <div class="Seller-Phone">
                        <div>
                            <span class="m-l-10" style="font-size: 14px; font-weight: 700;">
                                <img class="Phone_icon" alt="loadingIcon" src="https://static.chotot.com/storage/chotot-icons/svg/white-phone.svg">
                                ${s.getContact()}
                            </span>
                            <span style="font-size: 14px; font-weight: 700;">
                                Contact to seller
                            </span>
                        </div>
                    </div>
                    <c:if test="${p.getPro_Quantity()>0}">
                        <div class="Product_Quamtity dis-flex align-items-center">
                            <div>Quantity</div>
                            <div class="dis-flex align-items-center">
                                <div class="m-r-5 m-l-5">
                                    <div class="dis-flex align-items-center">
                                        <button class="Quantity_button" onclick="decrease()">
                                            <svg enable-background="new 0 0 10 10" viewBox="0 0 10 10" x="0" y="0" class="shopee-svg-icon"><polygon points="4.5 4.5 3.5 4.5 0 4.5 0 5.5 3.5 5.5 4.5 5.5 10 5.5 10 4.5"></polygon></svg>
                                        </button>
                                        <input class="Quantity_input" name="Quantity" type="number" value="0" min="1" max="${p.getPro_Quantity()}">
                                        <button class="Quantity_button" onclick="increase()">
                                            <svg enable-background="new 0 0 10 10" viewBox="0 0 10 10" x="0" y="0" class="shopee-svg-icon icon-plus-sign"><polygon points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5"></polygon></svg>
                                        </button>
                                    </div>
                                </div>
                                <div>${p.getPro_Quantity()} product remains</div>
                            </div>
                        </div>

                        <div class="dis-flex justify-content-between m-t-30">
                            <button style="cursor: pointer" type="button" class="btn AddCart-btn" aria-disabled="false">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="icon-add-to-cart"><g><g><polyline fill="none" points=".5 .5 2.7 .5 5.2 11 12.4 11 14.5 3.5 3.7 3.5" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polyline><circle cx="6" cy="13.5" r="1" stroke="none"></circle><circle cx="11.5" cy="13.5" r="1" stroke="none"></circle></g><line fill="none" stroke-linecap="round" stroke-miterlimit="10" x1="7.5" x2="10.5" y1="7" y2="7"></line><line fill="none" stroke-linecap="round" stroke-miterlimit="10" x1="9" x2="9" y1="8.5" y2="5.5"></line></g></svg>
                                <span>Add To Cart</span>
                            </button>
                            <button style="cursor: pointer" class="btn Buy-btn" aria-disabled="false">Buy</button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${p.getPro_Quantity()<=0}">
                    <div class="m-t-20 dis-flex justify-content-center text-danger">
                        <h4 class="font-weight-bold">SOLD OUT</h4> 
                    </div>
                </c:if>


                <div class="comments m-t-30 p-t-10">
                    <h4>Product Rating</h4>
                    <div class="avgRate">
                        <div class="rating dis-flex">
                            <p class="p-r-10">Product Rating: </p>

                            <span class="rate_stars p-r-10">
                                <c:forEach begin="1" end="${p.getRate()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                    </svg>
                                </c:forEach>
                                <c:if test="${p.getRate()%1!=0}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-half" viewBox="0 0 16 16">
                                    <path d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z"/>
                                    </svg>
                                </c:if>
                                <c:forEach begin="1" end="${5-p.getRate()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                    </svg>
                                </c:forEach>
                            </span>

                            <b class="font-weight-normal" style="font-size: ">${p.getRate()}</b>
                        </div>
                    </div>

                    <c:if test="${u.getUserId()!=s.getUserId()&&!requestScope.isRated}">
                        <form action="${pageContext.request.contextPath}/rating?PID=${p.getProId()}" method="post" class="User-Rating_input">

                            <div class="rating dis-flex">
                                <div class="m-r-10">Rate this product:</div>
                                <input type="radio" name="star" id="star-1" value="1" required="">
                                <input type="radio" name="star" id="star-2" value="2" required="">
                                <input type="radio" name="star" id="star-3" value="3" required="">
                                <input type="radio" name="star" id="star-4" value="4" required="">
                                <input type="radio" name="star" id="star-5" value="5" required="">
                                <label for="star-1"><i class="fa fa-star"></i></label>
                                <label for="star-2"><i class="fa fa-star"></i></label>
                                <label for="star-3"><i class="fa fa-star"></i></label>
                                <label for="star-4"><i class="fa fa-star"></i></label>
                                <label for="star-5"><i class="fa fa-star"></i></label>
                            </div>

                            <textarea class="w-100" name="Rate_comment" required></textarea>

                            <button class="float-r" type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </c:if>

                </div>
            </div>
        </div>
        <script>
            function increase() {
                var Quantity_input = document.querySelector(".Quantity_input");
                var value = parseInt(Quantity_input.value);
                if (value <${p.getPro_Quantity()}) {
                    value++;
                }
                Quantity_input.value = value;
                console.log(Quantity_input.value);
            }

            function decrease() {
                var Quantity_input = document.querySelector(".Quantity_input");
                var value = parseInt(Quantity_input.value);
                if (value != 1) {
                    value--;
                }
                Quantity_input.value = value;
                console.log(Quantity_input.value);
            }

            document.querySelector(".Buy-btn").addEventListener("click", function () {
                document.querySelector(".Payment").style.display = 'block';
                document.querySelector("#Product-Quantity").value = document.querySelector(".Quantity_input").value;
                var num = ${p.getPro_PriceNum()} * document.querySelector(".Quantity_input").value * 1000;
                document.querySelector(".Product-info_Price>input").value = num.toLocaleString() + 'vnđ';
            });

            function FormCheck() {
                var Payment = document.querySelector(".PaymentMethod");
                if (Payment.value == 'Online' && '${card}' == '') {
                    alert("You need to link account with credit card to do this function");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>

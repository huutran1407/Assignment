<%-- 
    Document   : AddProduct
    Created on : Jul 6, 2023, 3:02:45 AM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/AddProductStyle.css?version=1"/>
    </head>
    <body>
        <c:set var="card" value="${requestScope.card}"></c:set>
        <div class="container row justify-content-center p-0 m-0" style="background-color: #f2f6fc; max-width: 100vw;">
            <div class="col-xl-8 m-t-30 m-b-30">
                <!-- Account details card-->
                <div class="card mb-5">
                    <div class="card-header">Sell Product</div>
                    <div class="card-body">
                        <form class="row justify-content-between" action="${pageContext.request.contextPath}/addpro" method="post" enctype='multipart/form-data'>
                            <!-- Product Img -->
                            <div class="col-4">
                                <label id="Product-Img" class="Product-img" tabindex="0">
                                    <img class="output" src="#" alt="alt" style="display: none;"/>
                                    <input name="img" type="file" accept="img/*" style="display:none;" tabindex="-1" onchange="loadFile(event)" required>
                                    <span class="Product-img_icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="53" height="39" viewBox="0 0 53 39"><g fill="none" fill-rule="evenodd" stroke="none" stroke-width="1"><g stroke="#FF8800" stroke-width="2" transform="translate(-255 -179)"><g transform="translate(132 122)"><path d="M150.631 87.337c-5.755 0-10.42-4.534-10.42-10.127 0-5.593 4.665-10.127 10.42-10.127s10.42 4.534 10.42 10.127c0 5.593-4.665 10.127-10.42 10.127m10.42-24.755l-2.315-4.501h-16.21l-2.316 4.5h-11.579s-4.631 0-4.631 4.502v22.505c0 4.5 4.631 4.5 4.631 4.5h41.684s4.631 0 4.631-4.5V67.083c0-4.501-4.631-4.501-4.631-4.501h-9.263z"></path></g></g></g></svg>
                                        <span>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 20 21"><g fill="none" fill-rule="evenodd" stroke="none" stroke-width="1"><g fill="#FF8800" transform="translate(-161 -428)"><g transform="translate(132 398)"><g transform="translate(16.648 17.048)"><g transform="rotate(-180 16.142 16.838)"><rect width="2.643" height="19.82" x="8.588" y="0" rx="1.321"></rect><path d="M9.91 0c.73 0 1.321.592 1.321 1.321v17.177a1.321 1.321 0 01-2.643 0V1.321C8.588.591 9.18 0 9.91 0z" transform="rotate(90 9.91 9.91)"></path></g></g></g></g></g></svg>
                                        </span>
                                    </span>
                                    <span class="Product-img_text text-uppercase">
                                        Upload your product image
                                    </span>
                                </label>
                            </div>

                            <div class="col-8">
                                <div class="category-selection m-b-30">
                                    <label for="category-select">
                                        Category selection
                                    </label>
                                    <select name="productType" id="category-select" class="w-100">
                                        <c:forEach var="c" items="${requestScope.cList}">
                                            <option value="${c.getCategory_Id()}">${c.getCategory()}</option>
                                        </c:forEach>
                                    </select>
                                    <svg data-type="monochrome" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1em" height="1em" fill="none" class="arrow"><path d="M7.9 156.8l2.8 3.3 214.8 247.2c7.3 8.4 18.2 13.6 30.3 13.6 12.2 0 23.1-5.4 30.3-13.6l214.7-246.7 3.6-4.1c2.7-3.9 4.3-8.7 4.3-13.7 0-13.7-11.7-25-26.2-25h-453c-14.5 0-26.2 11.2-26.2 25 0 5.2 1.7 10.1 4.6 14z" fill="currentColor"></path></svg>
                                </div>

                                <div class="Product-detail">
                                    <div class="Details-titles m-b-20">Product Details</div>
                                    <div class="Product-input">
                                        <input id="product_name" type="text" name="product_name" tabindex="1" required/>
                                        <label for="product_name">
                                            Product Name
                                        </label>
                                    </div>

                                    <div class="Product-input Description">
                                        <div class="focus-capture"></div>
                                        <textarea id="Product-description" inputmode="text" name="product_description" required></textarea>
                                        <label for="Product-description">
                                            Product Description
                                        </label>
                                    </div>
                                    
                                    <div class="Product-input">
                                        <input id="product_price" type="number" name="product_price" tabindex="1" required min="0" step="0.001"/>
                                        <label for="product_price">
                                            Price
                                        </label>
                                        <div class="money"><span>,000 vnđ</span></div>
                                    </div>

                                    <div class="Product-input">
                                        <input id="product_quantity" type="number" name="product_quantity" tabindex="1" required min="1"/>
                                        <label for="product_quantity">
                                            Product Quantity
                                        </label>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-primary" type="submit">Post Product</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            window.onload=function (event){
                if('${card}' == ''){
                    alert("Please link your creditcard before add product");
                    window.location.href="${pageContext.request.contextPath}/View/Home.jsp?Content=AddPayment.jsp";
                }
            };
            
            var loadFile = function (event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.querySelector('.output');
                    var icon = document.querySelector('.Product-img_icon');
                    var text = document.querySelector('.Product-img_text');
                    icon.style.display = "none";
                    text.style.display = "none";
                    output.style.display = "block";
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            };

            $('.Product-input>input,.Product-input>textarea').blur(function () {
                tmpval = $(this).val();
                if (tmpval == '') {
                    $(this).removeClass('hasValue');
                } else {
                    $(this).addClass('hasValue');
                }
            });
        </script>
    </body>
</html>

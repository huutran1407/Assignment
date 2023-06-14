<%-- 
    Document   : LoginPage
    Created on : Jun 5, 2023, 12:15:50 PM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="${pageContext.request.contextPath}/View/assets/images/icons/favicon.ico?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/vendor/bootstrap/css/bootstrap.min.css?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/vendor/animate/animate.css?version=1"/>
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/vendor/css-hamburgers/hamburgers.min.css?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/vendor/select2/select2.min.css?version=1"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/LoginStyle.css?version=1"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/util.css?version=1"/>
        <!--===============================================================================================-->
    </head>
    <body>
        <%
            String Mess = (String)request.getAttribute("Mess");
        %>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="${pageContext.request.contextPath}/View/assets/images/img-01.png" alt="IMG">
                    </div>

                    <form action="${pageContext.request.contextPath}/Login" method="Post" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Member Login
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = ${Mess== "Email or Username not existed"?"'Email or Username not existed'":"'Username or Email Require'"}>
                            <input class="input100" type="text" name="email/user" placeholder="Email/User">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = ${Mess== "Incorrect Password"?"'Incorrect Password'":"'Password Require'"}>
                            <input class="input100" type="password" name="pass" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="#">
                                Username / Password?
                            </a>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="${pageContext.request.contextPath}/View/SigninPage.jsp">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
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
        <!--===============================================================================================-->

        <script>
            window.onload = function () {
                var input = $('.validate-input .input100');

                for (var i = 0; i < input.length; i++) {
                    if ($(input[i]).parent().attr('data-validate') == "${Mess}") {
                        showValidate(input[i]);

                    }
                }
            }(jQuery());

            function showValidate(input) {
                var thisAlert = $(input).parent();

                $(thisAlert).addClass('alert-validate');
            }

            function hideValidate(input) {
                var thisAlert = $(input).parent();

                $(thisAlert).removeClass('alert-validate');
            }

            $('.validate-form .input100').each(function () {
                $(this).focus(function () {
                    hideValidate(this);
                });
            });

            $('.js-tilt').tilt({
                scale: 1.1
            });
        </script>

        <script src="${pageContext.request.contextPath}/View/assets/js/LoginJS.js"></script>
    </body>
</html>
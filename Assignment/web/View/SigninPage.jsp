<%-- 
    Document   : SigninPage
    Created on : Jun 9, 2023, 9:57:19 AM
    Author     : VHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/SignIn.css?version=1">
        <!--===============================================================================================-->
    </head>
    <body>

        <%
    String Mess = (String)request.getAttribute("Mess");
        %>

        <div class="limiter">
            <div class="container-SignIn">
                <div class="wrap-SignIn">
                    <!-- SignIn Form -->
                    <form action="${pageContext.request.contextPath}/SignIn" method="POST" class="SignIn-form validate-form">
                        <span class="SignIn-form-title">
                            Member Sign In
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = ${Mess== "Email Existed"?"'Email Existed'":"'Email Require'"}>
                            <input class="input100" type="email" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input col-5" data-validate = ${Mess== "Username Existed"?"'Username Existed'":"'Username Require'"}>
                            <input class="input100" type="text" name="Username" placeholder="UserName">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 col-5">
                            <input class="input100" type="text" name="DisplayName" placeholder="Display Name">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password required">
                            <input class="input100 password" type="password" name="Password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>					

                        <div class="wrap-input100 validate-input" data-validate= "Password must be match">
                            <input class="input100" type="password" name="Re-Password" placeholder="Re-enter password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-SignIn-form-btn">
                            <button type="submit" class="SignIn-form-btn">
                                Create Account
                            </button>
                        </div>

                        <div class="text-center p-t-60">
                            <a class="txt2" href="${pageContext.request.contextPath}/View/LoginPage.jsp">
                                Already have Account
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
        <script >

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
            })
        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/View/assets/js/LoginJS.js"></script>

    </body>
</html>

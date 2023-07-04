<%-- 
    Document   : ChangePass
    Created on : Jul 3, 2023, 10:29:45 PM
    Author     : VHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/ChangePassStyle.css"/>
    </head>
    <body style="background-color: #f2f6fc; color: #69707a;">
        <div class="dis-flex justify-content-center m-b-50 p-b-60">
            <div class="col-md-6 offset-md-3">
                <span class="anchor" id="formChangePassword"></span>
                <hr class="mb-5">

                <!-- form card change password -->
                <div class="card card-outline-secondary">
                    <div class="card-header">
                        <h3 class="mb-0">Change Password</h3>
                    </div>
                    <div class="card-body">
                        <form name="ChangePassForm" class="form" autocomplete="off" onsubmit="return validForm();" action="${pageContext.request.contextPath}/changePass" method="POST">
                            <div class="form-group">
                                <label for="inputPasswordOld">Current Password</label>
                                <input name="OldPassword" type="password" class="OldPassword form-control" id="inputPasswordOld" placeholder="Enter Your Password( Password must not have any spaces )" required pattern="[^\s]{1,}">
                                <p class="small text-danger" id="OldPassAlert"></p>
                            </div>
                            <div class="form-group">
                                <label for="inputPasswordNew">New Password</label>
                                <input name="password" type="password" class="password form-control" id="inputPasswordNew" placeholder="Enter Your New Password( Password must not have any spaces )" required pattern="[^\s]{1,}">
                            </div>
                            <div class="form-group">
                                <label for="inputPasswordNewVerify">Verify</label>
                                <input name="Re-Password" type="password" class="form-control" id="inputPasswordNewVerify" placeholder="To confirm, type the new password again." required pattern="[^\s]{1,}">
                                <p class="small text-danger" id="RePassAlert"></p>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success btn-lg">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /form card change password -->

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/View/assets/vendor/tilt/tilt.jquery.min.js"></script>
        <!--===============================================================================================-->
        <script>

                            if ("${requestScope.Mess}" !== "") {
                                window.alert("${requestScope.Mess}");
                            }

                            function validForm() {
                                var UserPassword = '${requestScope.User.getPassword()}';

                                var OldPass = document.getElementById("inputPasswordOld").value;
                                var NewPass = document.getElementById("inputPasswordNew").value;
                                var ReNewPass = document.getElementById("inputPasswordNewVerify").value;

                                var rs = true;
                                if (OldPass !== UserPassword) {
                                    let alert = document.getElementById("OldPassAlert");
                                    alert.innerHTML = "Wrong Password";
                                    rs = false;
                                }

                                if (ReNewPass !== NewPass) {
                                    let alert = document.getElementById("RePassAlert");
                                    alert.innerHTML = "Password did not matched";
                                    rs = false;
                                }

                                return rs;
                            }

        </script>
    </body>
</html>

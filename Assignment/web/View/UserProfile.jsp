<%-- 
    Document   : UserProfile
    Created on : Jun 25, 2023, 2:35:50 AM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/UserProfileStyle.css?version=1"/>
    </head>
    <body>
        <c:set var="u" value="${requestScope.User}"></c:set>
            <div class="container-xl px-4 mt-4">
                <!-- Account page navigation-->
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <img class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/${u.getAvatar()!=null?u.getAvatar():'http://bootdey.com/img/Content/avatar/avatar1.png'}" alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                            <!-- Profile picture upload button-->
                            <form id="AvatarForm" action="${pageContext.request.contextPath}/avatar" method="post" enctype='multipart/form-data'>
                                <label class="btn btn-primary">
                                    <input name="avatar" type="file" accept="image/*" style="display: none;" onchange="form.submit()" required>
                                    Upload new image
                                </label>

                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body text-center">
                            <form action="${pageContext.request.contextPath}/profileupdate" method="post">
                                <!-- Form Group (username)-->
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputUsername">Username</label>
                                    <input name="Username" class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="${u.getUserName()}" required/>
                                </div>
                                <!-- Form Row-->
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputDíplayname">DisplayName (how your name will appear to other users on the site)</label>
                                    <input name="Displayname" class="form-control" id="inputDíplayname" type="text" placeholder="Enter your díplayname" value="${u.getDisplayName()}"/>
                                </div>
                                <!-- Form Row-->
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputFullname">FullName</label>
                                    <input name="Fullname" class="form-control" id="inputFullname" type="text" placeholder="Enter your fullname" value="${u.getUserFullName()}"/>
                                </div>
                                <!-- Form Group (email address)-->
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input name="Email" class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="${u.getEmail()}"/>
                                </div>
                                <!-- Form Row-->
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputPhonenumber">Phone number</label>
                                    <input name="Phonenumber" class="form-control" id="inputPhonenumber" type="text" placeholder="Enter your phone number" value="${u.getContact()}"/>
                                </div>
                                <div class="mb-3 text-left">
                                    <label class="small mb-1" for="inputPhonenumber">Credit Card</label>
                                    <div class="d-flex justify-content-start">
                                        <i class="fa fa-2x fa-credit-card"></i>    
                                        <div class="m-l-5" Id="BankNumber" style="width: 150px"></div>
                                        <p class="m-l-10" Id="HideShow" onclick="HideShow()" style="cursor: pointer"></p>
                                    </div>
                                    <a class="" href="${pageContext.request.contextPath}/View/Home.jsp?Content=AddPayment.jsp" style="text-decoration: none">Link Credit Card</a>
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary m-auto" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var Number = document.getElementById("BankNumber");
            let hide = document.getElementById("HideShow");
            const Num = '${requestScope.Card.getCardNumber()==null?'Unlinked Card':requestScope.Card.getCardNumber()}';
            hide.innerHTML = 'Show';
            Number.innerHTML = "****************";
            console.log(Number.innerHTML);
            
            
            function HideShow() {
                if (hide.innerHTML === 'Show') {
                    Number.innerHTML = Num;
                    hide.innerHTML = 'Hide';
                } else {
                    Number.innerHTML = "****************";
                    hide.innerHTML = 'Show';
                }

            }
        </script>
    </body>
</html>

<%-- 
    Document   : LoginPage
    Created on : Jun 5, 2023, 12:15:50 PM
    Author     : VHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Sign up/Login Form</title>
        <link rel="stylesheet" href="CSS/style.css">

    </head>
    <body>
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">

            <div class="signup">
                <form action="" method="post">
                    <label for="chk" aria-hidden="true">Sign up</label>
                    <input type="text" name="txt" placeholder="User name" required="">
                    <input type="email" name="email" placeholder="Email" required="">
                    <input type="password" name="pswd" placeholder="Password" required="">
                    <button>Sign up</button>
                </form>
            </div>

            <div class="login">
                <form action="Login" method="post">
                    <label for="chk" aria-hidden="true">Login</label>
                    <input type="text" name="username" placeholder="Username" required="">
                    <input type="password" name="pswd" placeholder="Password" required="">
                    <button>Login</button>
                </form>
            </div>
        </div>
    </body>
</html>

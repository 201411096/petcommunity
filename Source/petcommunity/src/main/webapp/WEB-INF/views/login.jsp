<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../views/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="./resources/bootstrap_template/template_01/css2/fonts1/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="./resources/bootstrap_template/template_01/css2/style.css">
    
	
</head>
<body>
    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                       <br>
                       
                       <c:if test="${! empty msg}">
                        <input type="hidden" id="message" value='${msg}'/>
                       </c:if>
                       
                        <figure><img src="./resources/bootstrap_template/template_01/img/gallery/%EB%A1%9C%EA%B7%B8%EC%9D%B82.PNG" alt="sing up image"></figure>
                        <br><br>
                        <a href="signup.do" class="signup-image-link">회원이 아니신가요?</a>
                    </div>
					
                    <div class="signin-form">
                        <h2 class="form-title">로그인</h2>
                        <form action="sign.do" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="memberId"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="memberId" id="memberId" placeholder="ID"/>
                            </div>
                            <div class="form-group">
                                <label for="memberPassword"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="memberPassword" id="memberPassword" placeholder="Password"/>
                            </div>
      
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="로그인"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="./resources/js/signup.js"></script>
    <script src="vendor/jquery/jquery-ui.min.js"></script>
    <script src="./resources/bootstrap_template/template_01/js2/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
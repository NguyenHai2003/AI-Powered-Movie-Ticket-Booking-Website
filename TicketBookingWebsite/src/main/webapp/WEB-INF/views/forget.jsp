<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/login.css"/>
<style>

.page {
	background-image: url("https://assets.nflxext.com/ffe/siteui/vlv3/0bd3a69d-6790-4edc-9818-1c8c558946c2/1f1ab65c-af21-49aa-a928-9ef1faf4fe94/VN-en-20220329-popsignuptwoweeks-perspective_alpha_website_large.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

</style>

</head>

<body class="page">
	 <%@include file="/WEB-INF/views/header.jsp"%>

		<div class="form-tt">
			  <!--    <i class="fa-solid fa-xmark iconclose"></i> -->
				<h2>Forgot Password</h2>
				<div style="color: red;font-style: italic;font-size: larger;margin-bottom: 5px;">${messageA}</div>
                <form action="http://localhost:9999/DoAnWebCinema/forget/reset.htm" method="post" name="dang-ky">
                <p
					style="color: #ff3366; font-size: 12px; display: inline;">
					${errorTK}</p>
                <div class="input-container">
                    <i class="fa-solid fa-user icon"></i>
                    <input class="input-content" type="text" name="email" placeholder="Enter your registered email" required/>
				
				</div>
				<!-- <p
					style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
					${errorMK}</p>
                <div class="input-container">
                    <i class="fa-solid fa-lock icon"></i>
                    <input class="input-content" id="content-pass" type="password" name="password" placeholder="Nhập mật khẩu" />
				
				</div>-->
                <!--<input type="checkbox" id="checkbox" name="checkbox"
                <a style="color: red;" href="">Forgot Password</a>-->
                <input type="submit" name="submit" value="Send Email" />
                <label class="psw-text"> Don't have an account?
                <a href="http://localhost:9999/DoAnWebCinema/register.htm" style="color: red;">Sign Up</a>
                </label>
                </form>	
		</div>
		
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
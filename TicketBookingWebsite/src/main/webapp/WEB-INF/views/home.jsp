<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost:9999/DoAnWebCinema/images/logo.svg" />
 <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/fonts/fontawesome-free-6.4.2-web/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
	integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Template CSS -->
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/editanh.css" />

<style>
#carousel-simple {
	text-align: center;
}

.page {
	background-image:
		
		url("https://assets.nflxext.com/ffe/siteui/vlv3/5523db5a-e2b2-497f-a88b-61f175c3dbad/924da883-2be9-48cc-84cc-45dbf5c7d2da/VN-vi-20230306-popsignuptwoweeks-perspective_alpha_website_large.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.carousel-indicators button {
	width: 20px;
	height: 20px;
	border-radius: 100%;
	background-color: #999;
	border-color: red;
}

.carousel-indicators .active {
	background-color: white;
}

.mtw_banner_right {
	position: fixed;
	right: 0px;
	z-index: 20;
}

.mtw_banner_left {
	position: fixed;
	left: 0px;
	z-index: 20;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
</style>

</head>

<body class="page">
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="main" style = "margin-top: 8%;">
		<div class="container">
			<div id="carousel-simple" class="carousel slide " data-ride="carousel">
	
				<!-- Indicators -->
				<div class="carousel-indicators">
					<button type="button" data-target="#carousel-simple" data-slide-to="0" class="active"></button>
					<button type="button" data-target="#carousel-simple" data-slide-to="1" ></button>
					<button type="button" data-target="#carousel-simple" data-slide-to="2" ></button>
					<button type="button" data-target="#carousel-simple" data-slide-to="3" ></button>
					<button type="button" data-target="#carousel-simple" data-slide-to="4" ></button>
					<button type="button" data-target="#carousel-simple" data-slide-to="5" ></button>
				</div>
	
				<!-- Wrapper for slides -->
				<c:forEach var="phim" items="${phimList}" varStatus="status">
		            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
		               <div class="img-center"><img src="${phim.getLinkAnh()}" class="d-block w-75" alt="${phim.getTenPhim()}"></div> 
		            </div>
		        </c:forEach>
	
				<!-- Controls -->
				<a class="carousel-control-prev" href="#carousel-simple"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
class="sr-only"></span>
				</a> <a class="carousel-control-next" href="#carousel-simple"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only"></span>
				</a>
			</div>
		</div>
	</div>
	

	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
   <!--  <script src="http://localhost:9999/QuanLyRapChieuPhim/resources/js/main.js"></script> -->
</body>
</html>
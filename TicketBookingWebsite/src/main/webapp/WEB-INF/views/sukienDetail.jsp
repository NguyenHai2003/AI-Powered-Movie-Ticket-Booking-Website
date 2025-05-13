<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TU TRU CINEMA</title>
	<base href="${pageContext.servletContext.contextPath}/"> 
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/bootstrap.min.css" rel="stylesheet" >
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/editanh.css" rel="stylesheet">
	<link href="css/all.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 	Phần đầu -->
	<section id="top">
		<div class="container">
			 <div class="row top_1">
			 	<div class="col-md-3">
 				   <div class="top_1l pt-1">
		    			<h3 class="mb-0"><a class="text-white" href=""><i class="fa fa-video-camera col_red me-1"></i>Tu Tru Cinema</a></h3>
		   			</div>
			 	</div>
			 	<div class="col-md-5">
   	 				<div class="top_1m">
    					<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="/DoAnWebCinema/search.htm">
							<input type="search" class="form-control form-control-dark" placeholder="Tìm kiếm..." aria-label="Search" name="search">
						</form>
        			</div>
    			</div>
				<div class="col-md-4">
				    <div class="top_1r text-end mt-1">
				        <c:choose>
				            <c:when test="${user.tenKH != null}">
				                <p><i class="bi bi-person-circle"></i><span> </span><a href="customer/account.htm"><strong>${user.tenKH}</strong></a></p>
				            </c:when>
				            <c:otherwise>
				                <div>
				                    <i class="bi bi-person-circle"></i>
				                    <a href="login.htm"><b>Login</b></a>
				                    <a href="register.htm"><b>Sign Up</b></a>
				                </div>
				            </c:otherwise>
				        </c:choose>
				    </div>
				</div>
			 </div>
		</div>
	</section>
	<!-- 	Phần Menu -->
	<section id="header">
		<nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
			<div class="container">
				<a class="navbar-brand text-white fw-bold" href=""><i class="fa fa-video-camera col_red me-1"></i>TU TRU CINEMA</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
			    </button>
    			<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-0">
			        	<li class="nav-item">
			          		<a class="nav-link active" aria-current="page" href="trangchu.htm">Home</a>
			        	</li>
			     		<li class="nav-item">
			          		<a id="dat-ve-link" class="nav-link" href="#">Book Now</a>
			        	</li>
			        	<li class="nav-item dropdown">
			          		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Movie</a>
			          		<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
						    	<li><a class="dropdown-item" href="phimsapchieu.htm?tab=home">Now Showing</a></li>
						    	<li><a class="dropdown-item border-0" href="phimsapchieu.htm?tab=profile">Coming Soon</a></li>
			          		</ul>
			        	</li>
						<li class="nav-item">
			          		<a class="nav-link" href="gioithieu.htm">About Us</a>
		        		</li>
						<li class="nav-item">
			          		<a class="nav-link" href="lienhe.htm">Contact</a>
			        	</li>
			      	</ul>
				</div>
			</div>
		</nav>
	</section>
	
	<section id="popular" class="pt-4 pb-5 bg_grey">
		<div class="container">
		 	<div class="row trend_1">
				  <div class="col-md-12">
					   <div class="trend_1l">
						    <h4 class="mb-0"><i class="fa fa-youtube-play align-middle col_red me-1"></i> Featured <span class="col_red">Events</span></h4>
					   </div>
				  </div>
		 	</div>
		</div>
		<div class="container-xl">
	  <div class="row blog_1">
	    <div class="blog_1l">
		 <div class="blog_1l1">
		   <div class="popular_2i1lm position-relative clearfix">
			   <div class="popular_2i1lm1 clearfix">
			   </div>
			  </div>
			  <div class="text-center">
					   <div class="blog_1l1i mt-3">
			<h2 class="mt-3"><a class="col_red" href="blog_detail.html">${sukien.getTenSK()}	</a></h2>
			<h5><img src="images/icon-chuong.gif" class="icon-chuong"> ${sukien.getMoTaSK()}</h5>
			  </div>
			  </div>
			  <hr>
			<p class="mt-3">${sukien.getCTSK()}</p>
			<div class="text-center">
						<h6 class="fw-normal mt-3 col_light">
			<span><i class="fa fa-clock-o me-1 align-middle col_red"></i> 14 December 2021</span>
			<span class="ms-3"><i class="fa fa-user me-1 align-middle col_red"></i> Admin</span>
			<span class="ms-3"><i class="fa fa-comment me-1 align-middle col_red"></i> Comment</span>
			</h6>
			</div>
		   </div>
		 </div>
		</div>
	   </div>   
	 </div>
	</section>
	<section id="footer">
		<div class="footer_m clearfix">
			<div class="container">
				<div class="row footer_1">
					<div class="col-md-4">
						<div class="footer_1i">
							<h3>
								<a class="text-white" href="index.html"><i
									class="fa fa-video-camera col_red me-1"></i> <span
									class="col_red">Contact</span></a>
							</h3>
							<p class="mt-3">Tu Tru. Where Emotions Converge.</p>
							<h6 class="fw-normal">
								<i class="fa fa-map-marker fs-5 align-middle col_red me-1"></i>97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam
							</h6>
							<h6 class="fw-normal mt-3">
								<i class="fa fa-envelope fs-5 align-middle col_red me-1"></i>
								tutrucinema@gmail.com
							</h6>
							<h6 class="fw-normal mt-3 mb-0">
								<i class="fa fa-phone fs-5 align-middle col_red me-1"></i> 1900
								0099
							</h6>
						</div>
					</div>
					<div class="col-md-4">
						<div class="footer_1i">
							<h4>
								<span class="col_red">Newsletter </span>
							</h4>
							<p class="mt-3">Subscribe to our newsletter to receive the latest news and updates from us.</p>
							<div class="input-group">
								<input type="text" class="form-control bg-black"
									placeholder="Email"> <span class="input-group-btn">
									<button class="btn btn text-white bg_red rounded-0 border-0"
										type="button">Sign Up</button>
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="footer_1i text-center">
							<h4 class="mb-4">
								<span class="col_red">Connect with Us</span>
							</h4>
							<div class="footer_1i1">
								<ul class="social-network social-square mb-0 mt-4">
									<li class=""><a
										href="https://www.facebook.com/profile.php?id=100018102729044"><img
											src="images/facebook.png" height="50" title="Facebook"
											alt="Facebook"></a></li>
									<li class=""><a href=""><img
											src="images/instagram.png" height="50" title="Instagram"
											alt="Instagram"></a></li>
									<li class=""><a href=""><img
											src="images/tiktok.png" height="50" title="Tiktok"
											alt="Tiktok"></a></li>
									<li class=""><a href=""><img
											src="images/youtube.png" height="50" title="Youtube"
											alt="Youtube"></a></li>
								</ul>
							</div>
							<div class="footer_1i1 mt-3">
								<a
									href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=30278"
									target="_blank"> <img src="images/bocongthuong.png"
									height="80" alt="abc">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
    // Lấy ngày hiện tại
    var curDate = new Date();
    var date = curDate.getDate();
    var month = curDate.getMonth() + 1; // Tháng bắt đầu từ 0
    var year = curDate.getFullYear();

    // Định dạng ngày theo định dạng yyyy-mm-dd
    var formattedDate = year + '-' + (month < 10 ? '0' + month : month) + '-' + (date < 10 ? '0' + date : date);

    // Cập nhật liên kết href
    var link = document.getElementById('dat-ve-link');
    if (link) { // Kiểm tra xem phần tử có tồn tại không
        link.href = '/DoAnWebCinema/datve/' + formattedDate + '.htm?chinhanh=1';
    }
</script>
</html>
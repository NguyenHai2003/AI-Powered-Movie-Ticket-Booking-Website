<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TỨ TRỤ CINEMA</title>
<link rel="icon" type="images/png" href="images/logocinema.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/global.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/all.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 	Phần đầu -->
	<section id="top">
		<div class="container">
			 <div class="row top_1">
			 	<div class="col-md-3">
 				   <div class="top_1l pt-1">
		    			<h3 class="mb-0"><a class="text-white" href=""><i class="fa fa-video-camera col_red me-1"></i>Tứ Trụ Cinema</a></h3>
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

<section id="center" class="center_o pt-2 pb-2">
		<div class="container-xl">
			<div class="row center_o1">
				<div class="col-md-5">
					<div class="center_o1l">
						<h2 class="mb-0">Contact</h2>
					</div>
				</div>
				<div class="col-md-7">
					<div class="center_o1r text-end">
						<h6 class="mb-0 col_red">
							<a href="#">Home</a> <span class="me-2 ms-2 text-light"><i
								class="fa fa-caret-right align-middle"></i></span> Contact
						</h6>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="contact" class="pt-4 pb-4 bg_grey">
		<div class="container-xl">
			<div class="row contact_1 bg_dark  pt-5 pb-5">
				<div class="col-md-3">
					<div class="contact_1i row">
						<div class="col-md-2 col-2">
							<div class="contact_1il">
								<span class="col_red fs-3"><i class="fa fa-map-marker"></i></span>
							</div>
						</div>
						<div class="col-md-10 col-10">
							<div class="contact_1ir">
								<h5 class="col_red">Location</h5>
								<p class="mb-0">
97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="contact_1i row">
						<div class="col-md-2 col-2">
							<div class="contact_1il">
								<span class="col_red fs-3"><i class="fa fa-clock-o"></i></span>
							</div>
						</div>
						<div class="col-md-10 col-10">
							<div class="contact_1ir">
								<h5 class="col_red">Operating Hours</h5>
								<p class="mb-0">8:00 - 23:00</p>
								<p class="mb-0">All days, including holidays and Tet</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="contact_1i row">
						<div class="col-md-2 col-2">
							<div class="contact_1il">
								<span class="col_red fs-3"><i class="fa fa-envelope"></i></span>
							</div>
						</div>
						<div class="col-md-10 col-10">
							<div class="contact_1ir">
								<h5 class="col_red">E-mail</h5>
								<p class="mb-0">tutrucinema@gmail.com</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="contact_1i row">
						<div class="col-md-2 col-2">
							<div class="contact_1il">
								<span class="col_red fs-3"><i class="fa fa-phone"></i></span>
							</div>
						</div>
						<div class="col-md-10 col-10">
							<div class="contact_1ir">
								<h5 class="col_red">Hotline</h5>
								<p class="mb-0">1900 0099</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row contact_2 mt-4">
				<div class="col-md-3">
					<div class="contact_2r">
						<h5 class="mb-3">Headquarters</h5>
						<p>
							<i class="fa fa-car col_red me-1"></i>
97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam
						</p>
						<p>
							<i class="fa fa-phone col_red me-1"></i> 1900 0099
						</p>
						<p>
							<i class="fa fa-globe col_red me-1"></i> <a href="#">info@gmail.com</a>
						</p>
						<p>
							<i class="fa fa-envelope col_red me-1"></i> <a href="#">tutrucinema@gmail.com</a>
						</p>
						<h5 class="mb-3 mt-4">Office Hours</h5>
						<p>
							Monday – Friday: <span class="fw-bold text-white">8:00 -
								22:00</span>
						</p>
						<p>
							Saturday : <span class="fw-bold text-white">8:00 to 13:00</span>
						</p>
						<p>
							Sunday : <span class="fw-bold text-white">Closed</span>
						</p>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact_2l row">
						<div class="col-md-12">
							<h4>CONTACT</h4>
						</div>
					</div>
					<div class="contact_2l1 mt-3 row">
						<div class="col-md-6">
							<div class="contact_2l1i">
								<input class="form-control" placeholder="Full Name*" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="contact_2l1i">
								<input class="form-control" placeholder="Email*" type="text">
							</div>
						</div>

					</div>

					<div class="contact_2l1 mt-3 row">
						<div class="col-md-12">
							<div class="contact_2l1i">
								<textarea placeholder="Content to contact usc"
									class="form-control form_text"></textarea>
								<h6 class="mt-3 mb-0">
									<a class="button" href="#">Send</a>
								</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row contact_3 mt-4">
				<div class="col-md-12">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.520141589769!2d106.7840897748836!3d10.847986989305172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752772b245dff1%3A0xb838977f3d419d!2sPosts%20and%20Telecommunications%20Institute%20of%20Technology%20HCM%20Branch!5e0!3m2!1sen!2s!4v1715764857608!5m2!1sen!2s"
						height="450" style="border: 0; width: 100%;" allowfullscreen=""></iframe>
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
								<i class="fa fa-map-marker fs-5 align-middle col_red me-1"></i>
97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam
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
								<span class="col_red">Newsletter</span>
							</h4>
							<p class="mt-3">
Subscribe to our newsletter to receive the latest news and updates from us.</p>
							<div class="input-group">
								<input type="text" class="form-control bg-black"
									placeholder="Email"> <span class="input-group-btn">
									<button class="btn btn text-white bg_red rounded-0 border-0"
										type="button">Sign up</button>
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

	<section id="footer_b" class="pt-3 pb-3 bg_grey">
		<div class="container">
			<div class="row footer_1 text-center">
				<p class="mb-0">© 2024 Tu Tru Cinema. All Rights Reserved</p>
			</div>
		</div>
	</section>

<script>
window.onscroll = function() {myFunction()};

var navbar_sticky = document.getElementById("navbar_sticky");
var sticky = navbar_sticky.offsetTop;
var navbar_height = document.querySelector('.navbar').offsetHeight;

function myFunction() {
  if (window.pageYOffset >= sticky + navbar_height) {
    navbar_sticky.classList.add("sticky")
	document.body.style.paddingTop = navbar_height + 'px';
  } else {
    navbar_sticky.classList.remove("sticky");
	document.body.style.paddingTop = '0'
  }
}
</script>
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
</body>

</html>
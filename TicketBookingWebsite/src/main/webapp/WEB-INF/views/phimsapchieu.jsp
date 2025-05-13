 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TỨ TRỤ CINEMA</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/bootstrap.min.css" rel="stylesheet" >
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
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
							<input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search" name="search">
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

<%-- <%@ page import="java.util.*" %>
<%
    String tab = (String) request.getAttribute("tab");
    if (tab == null || (!tab.equals("home") && !tab.equals("profile"))) {
        tab = "home"; // mặc định là tab "Phim đang chiếu"
    }
%> --%>

<section id="popular" class="pt-4 pb-5 bg_grey">
    <div class="container">
        <div class="row trend_1">
            <div class="col-md-12">
                <div class="trend_1l">
                    <h4 class="mb-0"><i class="fa fa-youtube-play align-middle col_red me-1"></i> Movie <span class="col_red">Categories</span></h4>
                </div>
            </div>
        </div>
        <div class="row popular_1 mt-4">
            <ul class="nav nav-tabs  border-0 mb-0">
                <li class="nav-item">
                    <a id="home-tab" href="#home" data-bs-toggle="tab" aria-expanded="false" class="nav-link ${tab.equals('home') ? 'active' : ''}">
                        <span class="d-md-block">NOW SHOWING</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a id="profile-tab" href="#profile" data-bs-toggle="tab" aria-expanded="true" class="nav-link ${tab.equals('profile') ? 'active' : ''}">
                        <span class="d-md-block">COMING SOON</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="popular_2 row mt-4">
            <div class="tab-content">
                <div class="tab-pane ${tab.equals('home') ? 'active' : ''}" id="home">
                    <div class="popular_2i row">
                        <c:forEach var="phim" items="${phimListDangChieu}" varStatus="status">
                            <div class="col-md-6">
                                <div class="popular_2i1 row">
                                    <div class="col-md-4 col-4">
                                        <div class="popular_2i1lm position-relative clearfix">
                                            <div class="popular_2i1lm1 clearfix">
                                                <div class="grid">
                                                    <figure class="effect-jazz mb-0">
                                                        <a href="#"><img src="/DoAnWebCinema/uploads/${phim.getLinkAnh()}" class="w-100" alt="img25"></a>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-8">
                                        <div class="popular_2i1r">
                                            <h5><a class="col_red" href="#"></a></h5>
                                            <h6></h6>
                                            <h6> ${phim.getDiem()}/10 Imdb<span class="ms-2"><i class="fa fa-star col_red me-1"></i></span> Year : ${phim.getNamSX()} <span class="ms-2">Duration: ${phim.getThoiLuong()}m</span></h6>
                                            <h4 class="col_red">${phim.getTenPhim()}</h4>
                                            <p>${phim.getMoTa()}</p>
                                            <h6 class="mb-0"><a class="button" href="/DoAnWebCinema/datve/${currentDate}.htm"> Book Now</a></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="tab-pane ${tab.equals('profile') ? 'active' : ''}" id="profile">
                    <div class="popular_2i row">
                        <c:forEach var="phim" items="${phimListSapChieu}" varStatus="status">
                            <div class="col-md-6">
                                <div class="popular_2i1 row">
                                    <div class="col-md-4 col-4">
                                        <div class="popular_2i1lm position-relative clearfix">
                                            <div class="popular_2i1lm1 clearfix">
                                                <div class="grid">
                                                    <figure class="effect-jazz mb-0">
                                                        <a href="#"><img src="/DoAnWebCinema/uploads/${phim.getLinkAnh()}" class="w-100" alt="img${status.index + 1}"></a>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-8">
                                        <div class="popular_2i1r">
                                            <h5><a class="col_red" href="#"></a></h5>
                                            <h6></h6>
                                            <h6> ${phim.getDiem()}/10 Imdb<span class="ms-2"><i class="fa fa-star col_red me-1"></i></span> Năm : ${phim.getNamSX()} <span class="ms-2">Duration: ${phim.getThoiLuong()}m</span></h6>
                                            <h4 class="col_red">${phim.getTenPhim()}</h4>
                                            <p>${phim.getMoTa()}</p>
                                       <b><p>Release Date: <span style="color: red;"><fmt:formatDate value="${phim.ngayKhoiChieu}" pattern="dd-MM-yyyy"/></span></p></b>
			                            <h6 class="mb-0"><a class="button" href="javascript:void(0)" onclick="openLightbox('${phim.getLinkTrailer()}', 'lightbox-${status.index}', 'lightbox-video-${status.index}')"> Watch Trailer</a></h6>
			                               <!-- Lightbox với ID riêng cho mỗi phim -->
			                                <div id="lightbox-${status.index}" style="display:none; position:fixed; z-index:999; left:0; top:0; width:100%; height:100%; background-color:rgba(0,0,0,0.8); justify-content:center; align-items:center;">
			                                    <div style="position:relative; width:80%; max-width:800px;">
			                                        <span onclick="closeLightbox('lightbox-${status.index}', 'lightbox-video-${status.index}')" style="position:absolute; top:10px; right:20px; color:white; font-size:30px; cursor:pointer;">&times;</span>
			                                        <iframe id="lightbox-video-${status.index}" width="100%" height="450px" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			                                    </div>
			                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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
							<p class="mt-3">Tu Tru. Where Emotions Converge..</p>
							<h6 class="fw-normal">
								<i class="fa fa-map-marker fs-5 align-middle col_red me-1"></i> 97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam
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
//Hàm mở lightbox với ID cụ thể
function openLightbox(linkTrailer, lightboxId, videoId) {
    document.getElementById(lightboxId).style.display = 'flex';  // Hiển thị lightbox
    document.getElementById(videoId).src = linkTrailer.replace("watch?v=", "embed/");  // Nhúng video YouTube
}

// Hàm đóng lightbox với ID cụ thể
function closeLightbox(lightboxId, videoId) {
    document.getElementById(lightboxId).style.display = 'none';  // Ẩn lightbox
    document.getElementById(videoId).src = '';  // Dừng video bằng cách xóa src
}
</script>
<script>
    // Lấy link trailer từ database (ở đây là từ phimListHot)
    var originalLink = "${phimListHot[0].getLinkTrailer()}"; // Ví dụ: https://www.youtube.com/watch?v=dQw4w9WgXcQ

    // Chuyển đổi link thành dạng nhúng
    var embedLink = originalLink.replace("watch?v=", "embed/");

    // Thiết lập lại link cho iframe
    document.getElementById("videoID").src = embedLink + "?autoplay=1&mute=1";
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

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy giá trị của tham số 'tab' từ URL
        const urlParams = new URLSearchParams(window.location.search);
        const tab = urlParams.get('tab');

        // Nếu tab là 'profile', thêm class 'active' cho tab "Phim sắp chiếu", ngược lại thì tab "Phim đang chiếu" là active
        if (tab === 'profile') {
            document.getElementById('profile-tab').classList.add('active');
        } else {
            document.getElementById('home-tab').classList.add('active');
        }
    });
</script>


   </body>
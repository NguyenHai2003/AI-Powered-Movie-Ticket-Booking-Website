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
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/bootstrap.min.css" rel="stylesheet" >
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/about.css" rel="stylesheet">
	<link href="css/all.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
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
			          		<a class="nav-link" aria-current="page" href="trangchu.htm">Home</a>
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
			          		<a class="nav-link active" href="gioithieu.htm">About Us</a>
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
	  <h2 class="mb-0">Who Are We?</h2>
	 </div>
   </div>
   <div class="col-md-7">
     <div class="center_o1r text-end">
	  <h6 class="mb-0 col_red"><a href="#">Home</a> <span class="me-2 ms-2 text-light"><i class="fa fa-caret-right align-middle"></i></span> About Us</h6>
	 </div>
   </div>
  </div>
 </div>
</section>

<section id="about_pg">
 <div class="about_pgm">
  <div class="container-xl">
  <div class="row about_pg1">
    <div class="col-md-12">
	 <h2><span class="col_red">We are Tu Tru Cinema</span><br>
		Specializing in movie services</h2>
		<p class="mt-3 w-50">"Tu Tru Cinema" was born with the mission of providing the fastest and most accurate movie services.</p>
		<p class="w-50">Are you looking to watch movies with your loved ones or simply enjoy heartfelt emotions on the big screen alone?</p>
		<p class="w-50">Come to us, where we bring you relaxing moments after long and tiring days.</p>

	</div>
  </div>
 </div>
 </div>
</section>

<section id="team" class="pt-4 pb-5">
 <div class="container-xl">
  <div class="row trend_1">
  <div class="col-md-12">
   <div class="trend_1l">
    <h4 class="mb-0"><i class="fa fa-youtube-play align-middle col_red me-1"></i> Contact <span class="col_red">Members</span></h4>
   </div>
  </div>
 </div>
  <div class="row team_1 mt-4">
    <div id="carouselExampleCaptions1" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions1" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions1" data-bs-slide-to="1" aria-label="Slide 2" class="" aria-current="true"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="team_1i row">
	    <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/tuanNew.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Le Van Tuan</h4>
			<h6>Manager</h6>
			<p>Dreams only come true when we wake up.</p>
		  <ul class="social-network social-circle mb-0 mt-3">
		  	<li><a href="https://www.facebook.com/nhatdong.1808" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>		
		</ul>
		 </div>
		</div>
	   </div>
	   <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/dong.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Tra Nha Dong</h4>
		  <h6>Manager</h6>
		  <p>Success comes from preparation, hard work, and the ability to learn from failures.</p>

		  <ul class="social-network social-circle mb-0 mt-3">
		  	<li><a href="https://www.facebook.com/quockhoa.nguyen.374" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>
		</ul>
		 </div>
		</div>
	   </div>
	   <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/hai.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Nguyen Vu Hai</h4>
			<h6>Manager</h6>
			<p>Life is 10% what happens to you and 90% how you react to it.</p>
		  <ul class="social-network social-circle mb-0 mt-3">
		  <li><a href="https://www.facebook.com/profile.php?id=100018102729044" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>		
		</ul>
		 </div>
		</div>
	   </div>
	  </div>
	  
    </div>
    <div class="carousel-item">
      <div class="team_1i row">
	   <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/khoa.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Nguyen Quoc Khoa</h4>
		<h6>Manager</h6>
		<p>Success comes from preparation, hard work, and the ability to learn from failures.</p>
		  <ul class="social-network social-circle mb-0 mt-3">
		  	<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>
		</ul>
		 </div>
		</div>
	   </div>
	  <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/tuanNew.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Le Van Tuan</h4>
			<h6>Manager</h6>
			<p>Dreams only come true when we wake up.</p>
		  <ul class="social-network social-circle mb-0 mt-3">		
			<li><a href="https://www.facebook.com/profile.php?id=100012240107106" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="https://www.instagram.com/tuanle7112/" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>
		</ul>
		 </div>
		</div>
	   </div>
	   <div class="col-md-4">
	    <div class="team_1i1 clearfix position-relative">
		 <div class="team_1i1i clearfix">
		   <div class="grid clearfix">
				  <figure class="effect-jazz mb-0">
					<a href="#"><img src="images/tuanNew.jpg" class="w-100" alt="abc"></a>
				  </figure>
			  </div>
		 </div>
		 <div class="team_1i1i1 clearfix position-absolute w-100 bottom-0">
		  <h4 class="col_red">Le Van Tuan</h4>
			<h6>Manager</h6>
			<p>Dreams only come true when we wake up.</p>
		  <ul class="social-network social-circle mb-0 mt-3">		
			<li><a href="https://www.facebook.com/profile.php?id=100012240107106" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="https://www.instagram.com/tuanle7112/" class="icoRss" title="Rss"><i class="fa fa-instagram"></i></a></li>
		</ul>
		 </div>
		</div>
	   </div>
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
      <h3><a class="text-white" href="index.html"><i class="fa fa-video-camera col_red me-1"></i> <span class="col_red">Contact</span></a></h3>
       <p class="mt-3">Tu Tru. Where Emotions Converge.</p>
       <h6 class="fw-normal"><i class="fa fa-map-marker fs-5 align-middle col_red me-1"></i>97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam</h6>
       <h6 class="fw-normal mt-3"><i class="fa fa-envelope fs-5 align-middle col_red me-1"></i> tutrucinema@gmail.com</h6>
       <h6 class="fw-normal mt-3 mb-0"><i class="fa fa-phone fs-5 align-middle col_red me-1"></i>  1900 0099</h6>
     </div>
    </div>
   <div class="col-md-4">
    <div class="footer_1i">
     <h4><span class="col_red">Newsletter </span></h4>
      <p class="mt-3">Subscribe to our newsletter to receive the latest news and updates from us.</p>
       <div class="input-group">
        <input type="text" class="form-control bg-black" placeholder="Email">
         <span class="input-group-btn">
          <button class="btn btn text-white bg_red rounded-0 border-0" type="button">Sign up</button>
         </span>
        </div>
       </div>
      </div>
  <div class="col-md-4">
    <div class="footer_1i text-center">
        <h4 class="mb-4"> <span class="col_red">Connect with Us</span></h4>
        <div class="footer_1i1">
            <ul class="social-network social-square mb-0 mt-4">
                <li class=""><a href="https://www.facebook.com/profile.php?id=100018102729044"><img  src="images/icon-facebook.png" height="50" title="Facebook" alt="Facebook"></a></li>
                <li class=""><a href=""><img  src="images/icon-instagram.png" height="50" title="Instagram" alt="Instagram"></a></li>
                <li class=""><a href=""><img  src="images/icon-tiktok.png" height="50" title="Tiktok" alt="Tiktok"></a></li>
                <li class=""><a href=""><img  src="images/icon-youtube.png" height="50" title="Youtube" alt="Youtube"></a></li>
            </ul>
        </div>
        <div class="footer_1i1 mt-3">
            <a href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=30278" target="_blank">
                <img src="images/icon-bocongthuong.png" height="80" alt="abc">
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

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy tất cả các mục trong menu
        const menuItems = document.querySelectorAll('.navbar-nav .nav-item a');
        
        // Lấy đường dẫn của trang hiện tại
        const currentPath = window.location.pathname;

        // Duyệt qua từng mục menu
        menuItems.forEach(function(item) {
            // Kiểm tra nếu href của mục menu trùng với đường dẫn hiện tại
            if (item.getAttribute('href') === currentPath) {
                // Thêm lớp active vào mục menu
                item.classList.add('active');
            } else {
                // Loại bỏ lớp active khỏi các mục menu khác
                item.classList.remove('active');
            }
        });
    });
</script>

</body>

</html>
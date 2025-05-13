<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TU TRU CINEMA</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
	<base href="${pageContext.servletContext.contextPath}/">
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/global.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/all.css" rel="stylesheet">
	<link href="css/chatbot.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/bootstrap.bundle.min.js"></script>
	<style>
	.divider-line {
    border: 0;
    margin: 20px 0;  /* Khoảng cách trên và dưới */
}
	
    .button-row {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        gap: 10px;
    }
    .showtimes {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .showtimes-container {
        display: flex;
        justify-content: space-between;
    }
    .showtime-item {
	    margin-bottom: 20px;
	}
    .btn-group {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }
    .btn {
        margin: 5px;
        padding: 15px;
        border-radius: 5px;
        text-align: center;
        color: #fff;
        background-color: #4CAF50; /* Màu xanh lá đẹp */
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease, text-shadow 0.3s ease;
    }
    .btn-gio {
        margin: 5px;
        padding: 15px;
        border-radius: 5px;
        text-align: center;
        color: #333;
        background-color: white; /* Màu nền trắng */
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease, text-shadow 0.3s ease;
    }
    .btn-gio:hover {
        background-color: #c3e6cb; /* Màu nền khi hover */
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Tạo hiệu ứng bóng cho chữ */
    }
    .btn:hover {
        background-color: #c3e6cb; /* Màu nền khi hover */
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Tạo hiệu ứng bóng cho chữ */
    }

    .select-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #branch-select {
        width: 100%;
        max-width: 350px;
        padding: 10px 15px;
        font-size: 16px;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 5px;
        transition: all 0.3s ease;
        cursor: pointer;
    }
    #branch-select:hover {
        border-color: #808080;
        background-color: #f0f8ff;
    }
    #branch-select:focus {
        outline: none;
        border-color: #808080;
        box-shadow: 0 0 5px rgba(128, 128, 128, 0.5);
        background-color: #ffffff;
    }
    #branch-select option {
        padding: 10px;
        background-color: #fff;
        font-size: 16px;
        color: #333;
        transition: background-color 0.2s ease;
    }
    #branch-select option:hover {
        background-color: #f1f1f1;
    }
    #branch-select option:checked {
        background-color: #b5b4b4;
        color: #fff;
    }
    
    .message-heading {
        text-align: center;
        font-size: 1.5em;
        color: #333;
        font-weight: bold;
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        padding: 10px;
        border: 2px solid #4CAF50; /* Viền xanh lá */
        border-radius: 8px;
        background-color: #e8f5e9; /* Nền xanh nhạt */
        max-width: 500px;
        margin: 20px auto;
    }

    .icon {
        font-size: 1.8em; /* Kích thước biểu tượng */
        color: #4CAF50; /* Màu xanh lá */
    }

    .message-heading:hover {
        background-color: #c8e6c9; /* Màu nền khi hover */
        border-color: #388e3c; /* Viền khi hover */
    }

    .message-heading span {
        animation: pulse 1.5s infinite; /* Hiệu ứng nhấp nháy cho biểu tượng */
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
        }
        50% {
            transform: scale(1.2);
        }
        100% {
            transform: scale(1);
        }
    }
</style>
	
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
				                    <a href="login.htm"><b>Login</a>
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
						<h2 class="mb-0">Movie Schedule</h2>
					</div>
				</div>
				<div class="col-md-7">
					<div class="center_o1r text-end">
						<h6 class="mb-0 col_red">
							<a href="#">Home</a> <span class="me-2 ms-2 text-light"><i
								class="fa fa-caret-right align-middle"></i></span>Book Now
						</h6>
					</div>
				</div>
			</div>
		</div>   
	</section>
	
	<section id="contact" class="pt-4 pb-4 bg_grey">

    <div class="container-xl">
        <div class="row contact_1 bg_dark pt-5 pb-5">   
            <div id="showtimes">
            	<div class="select-container">
    <select id="branch-select">
        <c:forEach var="chinhanh" items="${chiNhanhList}">
            <option value="${chinhanh.maChiNhanh}">${chinhanh.tenChiNhanh}</option>
        </c:forEach>
    </select>
</div>
<hr>
            	
                <div class="showtimes">
                    <div class="showtimes-container">
                        <div id="showtimes-list" class="showtime-dates"></div>
                    </div>
                    <br>
                    <h3 class="message-heading">
					    <span class="icon">&#128250;</span> <!-- Biểu tượng vé -->
					    Click on the showtime to book tickets.
					</h3>
                    <div class="popular_2 row mt-4">
                        <div class="tab-content">
                            <div class="tab-pane active" id="home">
                                <div class="popular_2i row">
                                   <c:forEach var="phim" items="${phimListDangChieu}" varStatus="status">
									    <div class="popular_2i1 row">
									        <div class="col-md-4 col-4">
									            <div class="popular_2i1lm position-relative clearfix">
									                <div class="popular_2i1lm1 clearfix">
									                    <div class="grid">
									                        <figure class="effect-jazz mb-0">
									                            <a href="#"><img src="/DoAnWebCinema/uploads/${phim.linkAnh}" class="w-100" alt="img25"></a>
									                        </figure>
									                    </div>
									                </div>
									            </div>
									        </div>
									        <div class="col-md-8 col-8">
									            <div class="popular_2i1r">
									                <h4><a class="col_red" href="#">${phim.tenPhim}</a></h4>
									                <h6>
									                <c:choose>
            						<c:when test="${phim.getDiem() == null}">
							            <span class="col_red me-3">No reviews yet</span>
							        </c:when>
									<c:when test="${phim.getDiem() < 1}">
                    					<span class="col_red me-3">
                       						<i class="fa fa-star-half-o"></i>                  					
                       					</span>
									</c:when>
									<c:when test="${phim.getDiem() < 2}">
                   						<span class="col_red me-3">
                        					<i class="fa fa-star"></i>
                    					</span>
									</c:when>
									<c:when test="${phim.getDiem() < 3}">
                   						<span class="col_red me-3">
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                    					</span>
									</c:when>
									<c:when test="${phim.getDiem() < 4}">
                   						<span class="col_red me-3">
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                    					</span>
									</c:when>
									<c:when test="${phim.getDiem() < 4.5}">
                   						<span class="col_red me-3">
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                    					</span>
									</c:when>
									<c:when test="${phim.getDiem() < 5}">
                   						<span class="col_red me-3">
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star"></i>
                        					<i class="fa fa-star-half-o"></i> 
                    					</span>
									</c:when>
									<c:otherwise>
					                    <span class="col_red me-3">
					                        <i class="fa fa-star"></i>
					                        <i class="fa fa-star"></i>
					                        <i class="fa fa-star"></i>
					                        <i class="fa fa-star"></i>
					                        <i class="fa fa-star"></i>
					                    </span>
									</c:otherwise>
								</c:choose>
									                                   			    <c:if test="${phim.getDiem() != null}">
							        ${phim.getDiem()}/5 (Rate)
							    </c:if></h6>
									             	<h6>Director: ${phim.getDaoDien().getTenDaoDien()}</h6>
									             	<h6>
									             	Cast:
									                							    <c:if test="${not empty phim.vaiDiens}">
							        <c:forEach var="chiTietdienvien" items="${phim.vaiDiens}" varStatus="status">
							            <c:out value="${chiTietdienvien.getDienVien().tenDienVien}" />
							            <c:if test="${!status.last}">, </c:if>
							        </c:forEach>
							    </c:if>
									             	</h6>
									                <h6>
									                    Year: ${phim.namSX}
									                    <span class="ms-2">Duration: ${phim.thoiLuong}m</span>
									                    <a href="${phim.linkTrailer}" style="color: lightblue;">Watch Trailer</a>
									                </h6>
									                <label class="small mb-2 font-weight-bold d-block text-while">2D with Vietnamese subtitles.</label>
									                <hr>
									                <div class="button-row">
									                    <c:forEach var="lichChieu" items="${lc}" varStatus="status">
									                        <c:if test="${lichChieu.dsPhim.maPhim == phim.maPhim}">
									                            <div class="mb-1 showtime-item">
									                                <a href="http://localhost:9999/DoAnWebCinema/customer/payment/${lichChieu.maSC}.htm" class="btn-gio btn-sm btn-showtime btn-light is-ticketing">
									                                    <span class="time">${lichChieu.formattedGioChieu}</span>
									                                </a>
									                            </div>
									                        </c:if>
									                    </c:forEach>
									                </div>
									            </div>
									        </div>
									    </div>
									    <hr class="divider-line">
									</c:forEach>
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
	      <h3><a class="text-white" href="index.html"><i class="fa fa-video-camera col_red me-1"></i> <span class="col_red">Liên hệ</span></a></h3>
	       <p class="mt-3">Tu Tru. Where Emotions Converge.</p>
	       <h6 class="fw-normal"><i class="fa fa-map-marker fs-5 align-middle col_red me-1"></i>97 Man Thiện St., Hiệp Phú, Thủ Đức, Ho Chi Minh City, Vietnam</h6>
	       <h6 class="fw-normal mt-3"><i class="fa fa-envelope fs-5 align-middle col_red me-1"></i> tutrucinema@gmail.com</h6>
	       <h6 class="fw-normal mt-3 mb-0"><i class="fa fa-phone fs-5 align-middle col_red me-1"></i>  1900 0099</h6>
	     </div>
	    </div>
	   <div class="col-md-4">
	    <div class="footer_1i">
	     <h4><span class="col_red">Newsletter</span></h4>
	      <p class="mt-3">Subscribe to our newsletter to receive the latest news and updates from us.</p>
	       <div class="input-group">
	        <input type="text" class="form-control bg-black" placeholder="Email">
	         <span class="input-group-btn">
	          <button class="btn btn text-white bg_red rounded-0 border-0" type="button">Sign Up</button>
	         </span>
	        </div>
	       </div>
	      </div>
	  <div class="col-md-4">
	    <div class="footer_1i text-center">
	        <h4 class="mb-4"> <span class="col_red">Connect with Us</span></h4>
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
	            <a href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=30278" target="_blank">
	                <img src="images/bocongthuong.png" height="80" alt="abc">
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
document.addEventListener('DOMContentLoaded', function() {
    const showtimesList = document.getElementById('showtimes-list');
    const branchSelect = document.getElementById('branch-select');

    const days = ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA'];
    var curDate = new Date();
    var html = '';

    function updateShowtimes(branchId, selectedDate) {
        html = '';
        for (var i = 0; i < 7; i++) {
            var nextDate = new Date(curDate.getTime() + i * 24 * 60 * 60 * 1000);
            var day = days[nextDate.getDay()];
            var date = nextDate.getDate();
            var month = nextDate.getMonth() + 1;
            var year = nextDate.getFullYear();
            var isActive = (nextDate.toISOString().split('T')[0] === selectedDate) ? ' active' : '';
            var formattedDate = year + '-' + (month < 10 ? '0' + month : month) + '-' + (date < 10 ? '0' + date : date);
            html += '<a href="/DoAnWebCinema/datve/' + formattedDate + '.htm?chinhanh=' + branchId + '" class="btn btn-light ' + day + ' text-muted' + isActive + '" data-date="' + formattedDate + '">' + day + '<br>' + date + '/' + month + '</a>';
        }

        showtimesList.innerHTML = html;
    }

    var urlParams = new URLSearchParams(window.location.search);
    var branchId = urlParams.get('chinhanh') || branchSelect.value;

    branchSelect.value = branchId;

    var pathParts = window.location.pathname.split('/');
    var selectedDate = pathParts[pathParts.length - 1].split('.')[0];
    console.log("selectedDate1", selectedDate);
    updateShowtimes(branchId, selectedDate);

    branchSelect.addEventListener('change', function() {
        var branchId = branchSelect.value;
        var pathParts = window.location.pathname.split('/');
        var selectedDate = pathParts[pathParts.length - 1].split('.')[0];
        console.log("selectedDate2", selectedDate);

        updateShowtimes(branchId, selectedDate);

        var newUrl = window.location.pathname.split('?')[0] + '?chinhanh=' + branchId;
        window.history.pushState({}, '', newUrl);

        if (selectedDate) {
            fetch('/DoAnWebCinema/datve/' + selectedDate + '.htm?chinhanh=' + branchId, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                console.log("Thành công!");
                window.location.href = '/DoAnWebCinema/datve/' + selectedDate + '.htm?chinhanh=' + branchId;
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
        } else {
            console.log("Lỗi selectedDate!");
        }
    });

    showtimesList.addEventListener('click', function(e) {
        // Kiểm tra xem người dùng có click vào <a> không
        const clickedLink = e.target.closest('a');
        if (!clickedLink) return; // Nếu không phải <a>, thoát khỏi xử lý

        // Loại bỏ lớp 'active' khỏi tất cả các nút trong danh sách
        const dateOptions = showtimesList.querySelectorAll('a');
        dateOptions.forEach(opt => opt.classList.remove('active'));

        // Thêm lớp 'active' vào đúng nút được click
        clickedLink.classList.add('active');
    });


    function updateShowtimesWithData(data) {
        html = '';
        data.forEach(showtime => {
            var formattedDate = showtime.date;
            var isActive = showtime.isActive ? ' active' : '';
            html += '<a href="/DoAnWebCinema/datve/' + formattedDate + '.htm?chinhanh=' + showtime.branchId + '" class="btn text-muted' + isActive + '" data-date="' + formattedDate + '">' + showtime.day + '<br>' + showtime.date + '</a>';
        });

        showtimesList.innerHTML = html;
    }
});

</script>
<!-- Chatbox Icon -->
<div class="chatbox-icon" onclick="openModal()">
    <div id="greeting" class="greeting-message">
        <b>AI Tu Tru is always ready to assist!</b>
    </div>
    <div class="chat-icon">
        <img src="/DoAnWebCinema/images/chatboxicon.gif" alt="Chat Icon">
    </div>
</div>

<!-- Modal -->
<div id="chatModal" class="modal">
    <!-- Modal Content -->
    <div class="modal-content">
		<div class="modal-header">
		    <div class="header-left">
		        <img src="http://localhost:9999/DoAnWebCinema/images/logocinema.png" alt="Tứ Trụ Cinema Logo" class="logo-icon" />
		        <div class="brand-text">
		            <span class="cinema-name"><b>Tu Tru Cinema</b></span>
		            <span class="subtitle">Online Customer Support</span>
		        </div>
		    </div>
		    <button class="close-btn" onclick="closeModal()">&times;</button>
		</div>
<!-- 		<div class="scrolling-message">
            <p style="color: black;">Welcome to our support system, we are always ready to answer your questions.</p>
        </div> -->
        <div class="modal-body">
            <div id="chat-content">
                <!-- Dynamic chat messages will be appended here -->
            </div>
        </div>
        <div class="modal-footer">
            <input type="text" id="chat-input" placeholder="Enter your message..." />
            <button id="send-btn">Send</button>
        </div>
    </div>
</div>


<script>
//Mở modal chat
function openModal() {
    document.getElementById('chatModal').style.display = 'flex';
}

// Đóng modal chat
function closeModal() {
    document.getElementById('chatModal').style.display = 'none';
}

// Hàm gửi tin nhắn
function sendMessage() {
    const input = document.getElementById('chat-input');
    const message = input.value.trim();

    if (message) {
        const chatContent = document.getElementById('chat-content');

        // Hiển thị tin nhắn của người dùng
        const userMessage = document.createElement('div');
        userMessage.classList.add('chat-message', 'user-message');

        const messageContent = document.createElement('div');
        messageContent.classList.add('message-content');
        messageContent.textContent = message;

        userMessage.appendChild(messageContent);
        chatContent.appendChild(userMessage);

        // Tự động cuộn xuống dưới
        chatContent.scrollTop = chatContent.scrollHeight;

        input.value = '';

        // Gửi tin nhắn đến chatbot Python qua API Flask
        fetch('http://127.0.0.1:5000/handle_message', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ message: message }),
        })
            .then(response => response.json())
            .then(data => {
                // Hiển thị phản hồi từ chatbot
                const botMessage = document.createElement('div');
                botMessage.classList.add('chat-message', 'bot-message');

                const botMessageContent = document.createElement('div');
                botMessageContent.classList.add('message-content');
                botMessageContent.innerHTML = data.response;

                botMessage.appendChild(botMessageContent);
                chatContent.appendChild(botMessage);

                // Tự động cuộn xuống dưới
                chatContent.scrollTop = chatContent.scrollHeight;
            })
            .catch(error => {
                console.error('Lỗi khi gọi API Flask:', error);
            });
    }
}

// Sự kiện nhấn nút Gửi
document.getElementById('send-btn').addEventListener('click', sendMessage);

// Sự kiện nhấn phím Enter
document.getElementById('chat-input').addEventListener('keydown', function (event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // Ngăn hành vi mặc định
        sendMessage();
    }
});

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


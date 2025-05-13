<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ticket Booking Successful</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/style_payment.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/resources/fontawesome-pro-6.1.1-web/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	<base href="${pageContext.servletContext.contextPath}/">
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/all.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
  	<style>
  		.dropdown:hover .dropdown-menu {
			display: block;
			margin-top: 0;
		}
		
		.confirm-panel {
		    padding: 20px;
		    border: 1px solid #ccc;
		    border-radius: 8px;
		    background-color: #f9f9f9;
		    max-width: 600px;
		    margin: 20px auto;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.confirm-panel-header {
		    text-align: center;
		    margin-bottom: 20px;
		}
		
		.panel-title {
		    font-size: 24px;
		    color: #333;
		}
		
		.qrcode-label {
		    font-weight: bold;
		}
		
		.panel-info {
		    margin-top: 20px; /* Tạo khoảng cách phía trên */
		}
		
		.info-item {
		    margin-bottom: 10px;
		    color: #555; /* Màu chữ cho thông tin */
		}
		
		.edit-final {
		    display: flex;
		    justify-content: center;
		    margin-top: 20px;
		}
		
		.btn {
		    padding: 10px 20px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		.btn-primary {
		    background-color: #5eb742;
		    color: #fff;
		    margin-right: 10px;
		    transition: background-color 0.3s ease;
		}
		
		.btn-primary:hover {
		    background-color: #4cae50;
		}
		
		.btn-secondary {
		    background-color: #e01027;
		    color: #fff;
		    transition: background-color 0.3s ease;
		}
		
		.btn-secondary:hover {
		    background-color: #c62a34;
		}
		
		.qr-image {
		    margin-left: 50px; /* Dời mã QR một chút */
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
						    	<li><a class="dropdown-item" href="phim/phimsapchieu.htm?tab=home">Now Showing</a></li>
						    	<li><a class="dropdown-item border-0" href="phim/phimsapchieu.htm?tab=profile">Coming Soon</a></li>
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
<!---->
  <div class="main">

    <!-- Tab items -->
    <div class="tabs">
      <!-- <div class="tab-item active">
        <span class="selected-ticket">1. Chọn Vé</span>
      </div> -->
      <div class="tab-item" id="tab-item-1">
        <span class="selected-ticket" id="tab-item-1">1. Select Tickets</span>
      </div>
      <div class="tab-item" id="tab-item-2">
        <span class="selected-ticket">2. Payment</span>
      </div>
      <div class="tab-item active" id="tab-item-3">
        <span class="selected-ticket">3. Confirmation</span>
      </div>
      <div class="line"></div>
    </div>

    <!-- Tab content -->
    <div class="tab-content">
    <div class="tab-pane active" id="tab-pane-2">
        <div class="confirm-panel">
            <div class="confirm-panel-header">
                <h3 class="panel-title">TICKET BOOKING SUCCESSFUL!</h3>
                <p>Thank you for booking your tickets. Below is your booking information:</p>
            </div>
            <div class="confirm-panel-content">
                <div class="panel-qrcode">
                    <span class="qrcode-label">Room Access Code:</span>
                    <div class="qr-image" id="qrcode"></div>
                </div>
				<div class="panel-info">
				    <div class="info-item"><b>Seat List:</b> <span>${ghe}</span></div>
					<div class="info-item"><b>Theater:</b> <span>${lc.getDsPhong().getChiNhanh().getTenChiNhanh()}</span></div>
					<div class="info-item"><b>Movie:</b> <span>${lc.dsPhim.tenPhim}</span></div>
					<div class="info-item"><b>Showtime:</b> <span>${lc.formattedGioChieu} (${lc.ngayChieu})</span></div>
					<div class="info-item"><b>Total Payment:</b> <span>${tongTien}</span></div>
				</div>
            </div>
            <div class="edit-final">
                <form action="/DoAnWebCinema/customer/payment/${lc.maSC}.htm">
                    <button type="submit" class="btn btn-primary" id="btn-continue1">Book Again</button>
                </form>
                <form action="/DoAnWebCinema/">
                    <button class="btn btn-secondary" type="submit">Home</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

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
    // Hàm tạo mã QR
    function generateQRCode(text) {
        $('#qrcode').empty(); // Xóa mã QR cũ
        $('#qrcode').qrcode({
            text: text,
            width: 128,
            height: 128
        });
    }

    // Gọi hàm tạo mã QR với giá trị khác nhau
    const roomCode = "MaPhong_" + Math.floor(Math.random() * 10000); // Tạo mã phòng ngẫu nhiên
    generateQRCode(roomCode);
</script>
</body>

</html>
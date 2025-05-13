<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserve Seat</title>
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/style_payment.css">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/fonts/fontawesome-free-6.4.2-web/css/all.min.css" />
	<base href="${pageContext.servletContext.contextPath}/">
	<link rel="icon" type="images/png" href="images/logocinema.png">
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/all.css" rel="stylesheet">
	<link href="css/ghe.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/bootstrap.bundle.min.js"></script>
  	<style>
  		.container1
  		{
  			width: 100%;
  			display: grid;
  			grid-template-columns: auto auto auto auto auto auto auto auto;
  			grid-gap: 10px 10px;
  		}
  		.dropdown:hover .dropdown-menu {
			display: block;
			margin-top: 0;
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
  <div class="main">
 
    <!-- Tab items -->
    <div class="tabs">
      <!-- <div class="tab-item active">
        <span class="selected-ticket">1. Chọn Vé</span>
      </div> -->
      <div class="tab-item active" id="tab-item-1">
        <span class="selected-ticket" id="tab-item-1">1. Select Tickets</span>
      </div>
      <div class="tab-item" id="tab-item-2">
        <span class="selected-ticket">2. Payment</span>
      </div>
      <div class="tab-item" id="tab-item-3">
        <span class="selected-ticket">3. Confirmation</span>
      </div>
      <div class="line"></div>
    </div>
    
    <div class="tab-content">
    <div class="tab-pane active" id="tab-pane-1">
        <div class="info-film">
			<div class="info-film-container" style="display: flex; align-items: center; text-align: left;">
			    <img style="width: 100%; max-width: 250px;" class="movie-poster" src="/DoAnWebCinema/uploads/${phim.linkAnh}" alt="">
			    <div class="detail-movie-poster" style="margin-left: 20px;">
			        <h4 style="color: #6ac441;" class="movie-name">${phim.tenPhim}</h4>
			        <h5 style="color: #fff;">Showtime Schedule</h5>
			        <h6 style="color: #fff;">Showtime ${lc.formattedGioChieu} (${lc.ngayChieu})</h6>
			        <h6 style="color: red;">Theater ${lc.getDsPhong().getChiNhanh().getTenChiNhanh()}</h6>
			    </div>
			</div>
            <br>
            <br>
            <h3 style="color: #6ac441; font-weight: 300;">SELECT SEAT</h3>
            <br>
            <br>
            <p class="p-notify">
			    Please select seats from the seating chart below. 
			    <b><i>Standard</i></b> seats cost <b style="color: #6ac441; font-weight:200;">45,000Đ</b>, 
			    typically in the first three rows, including the first two and last two seats of the following rows. 
			    <b><i>VIP</i></b> seats cost <b style="color: #6ac441; font-weight:200;">50,000Đ</b>, 
			    usually located in the rows following the first three, with seat numbers 3 to 8. 
			    <b><i>Couple</i></b> seats cost <b style="color: #6ac441; font-weight:200;">100,000Đ</b>, 
			    typically in the last row.
			</p>
			<div style="text-align: center; margin-top: 10px;">
			    <span style="display: inline-block; width: 15px; height: 15px; background-color: #6ac441; margin-right: 5px;"></span>
			    <span style="margin-right: 30px; color: white;">Available Seat</span>
			    
			    <span style="display: inline-block; width: 15px; height: 15px; background-color: red; margin-right: 5px;"></span>
			    <span style="margin-right: 30px; color: white;">Purchased Seat</span>
			    
			    <span style="display: inline-block; width: 15px; height: 15px; background-color: #d3d3d3; margin-right: 5px;"></span>
			    <span style="color: white;">Selected Seat</span>
			</div>
            <br>
            <div class="screen">Screen</div>
            <br>
            <div class="seat-container">
                <c:forEach var="hang" items="${gheTheoHang}">
                    <div class="row">
                        <c:forEach var="ghe" items="${hang.value}">
                            <span class="seat ${ghe.trangThaiDat ? 'occupied' : ''}" 
                                  data-seat="${ghe.tenGhe}" 
                                  data-price="${ghe.gia}" 
                                  data-id="${ghe.idGhe}">
                                ${ghe.tenGhe}
                            </span>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
            <div id="reserveFooter" class="reserve-footer" style="display: none;">
				<c:if test="${phantramthaydoi > 0}">
				    <p>
				        <b style="color: #fff;">
						    You are receiving a discount of 
						    <i><fmt:formatNumber value="${(1 - phantramthaydoi) * 100}" pattern="#"/>%</i> 
						    for the event <i>"${lydothaydoi}"</i>.
						</b>

				    </p>
				</c:if>		
                <p><b style="color: #fff;">Selected Seat:</b> <span id="selectedSeatsDisplay">No seat selected</span></p>
				<p><b style="color: #fff;">Total Payment:</b> <span id="totalPrice">0 VND</span></p>
				<form action="" method="POST">
				    <button type="submit" name="" class="btn-submit">Confirm</button>
				</form>
            </div>
        </div>
    </div>
</div>
    
<!-- Thêm mã JavaScript -->
<script>
    let selectedSeats = [];
    let totalPrice = 0;
    let maSC = ${lc.maSC};
    let phantram = ${phantramthaydoi}
    const footer = document.getElementById('reserveFooter');
    const selectedSeatsDisplay = document.getElementById('selectedSeatsDisplay');
    const totalPriceDisplay = document.getElementById('totalPrice');
    function updateFormAction() {
        const selectedSeatNames = selectedSeats.map(seat => seat.tenGhe).join(","); // Lấy danh sách tên ghế
        console.log("Selected seats:", selectedSeatNames);
        const formAction = '/DoAnWebCinema/customer/payment_1/' + maSC + '/' + selectedSeatNames + '.htm';
        document.querySelector('.reserve-footer form').setAttribute('action', formAction);
    }
    
    // Hàm chọn ghế
    document.querySelectorAll('.seat').forEach(seat => {
        seat.addEventListener('click', () => {
            if (!seat.classList.contains('occupied')) { 
                seat.classList.toggle('selected');
                updateSelectedSeats();
            }
        });
    });

    function updateSelectedSeats() {
        selectedSeats = [...document.querySelectorAll('.seat.selected')].map(seat => {
            return {
                tenGhe: seat.dataset.seat,
                idGhe: seat.dataset.id,
                price: parseInt(seat.dataset.price, 10) // Lấy giá ghế
            };
        });

        if (selectedSeats.length > 0) {
            footer.style.display = 'block';
            selectedSeatsDisplay.textContent = selectedSeats.map(seat => seat.tenGhe).join(', ');

            totalPriceDisplay.textContent = selectedSeats.reduce((total, seat) => {
                if (phantram > 0) {
                    return total + seat.price * phantram; // áp dụng giảm giá
                } else {
                    return total + seat.price; // không áp dụng giảm giá
                }
            }, 0) + ' VNĐ';
            
            updateFormAction();
        } else {
            footer.style.display = 'none';
            resetSelection();
        }

    }

    function resetSelection() {
        selectedSeats.forEach(seat => {
            const seatElement = document.querySelector(`[data-seat="${seat.tenGhe}"]`);
            if (seatElement) {
                seatElement.classList.remove('selected'); // Xóa lớp 'selected' của ghế
            }
        });

        // Đặt lại các giá trị
        selectedSeats = [];
        totalPrice = 0;
        footer.style.display = 'none';
        selectedSeatsDisplay.textContent = "Chưa chọn ghế";
        totalPriceDisplay.textContent = "0 VNĐ";
    }
</script>

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
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
  <script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
    crossorigin="anonymous"></script>
  <script src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>
  <!--<script src="/DoAnWebCinema/js/payment.js"></script>-->
</body>

</html>
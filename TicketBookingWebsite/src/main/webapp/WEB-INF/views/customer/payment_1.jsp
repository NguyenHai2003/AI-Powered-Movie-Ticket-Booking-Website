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
  <title>Payment</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/style_payment.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/fonts/fontawesome-pro-6.1.1-web/css/all.min.css" />
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
		
		.modal {
		    display: none; /* Ẩn modal khi chưa mở */
		    position: fixed; 
		    z-index: 1050; 
		    left: 0;
		    top: 0;
		    width: 100%; 
		    height: 100%; 
		    overflow: auto; 
		    background-color: rgba(0, 0, 0, 0.5); /* Nền mờ */
		}
		.modal-dialog {
		    margin: 15% auto;
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
				                    <a href="login.htm"><b>Login</b></a>
				                    <a href="register.htm"><b>Log Out</b></a>
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
      <div class="tab-item active" id="tab-item-2">
        <span class="selected-ticket">2. Payment</span>
      </div>
      <div class="tab-item" id="tab-item-3">
        <span class="selected-ticket">3. Confirmation</span>
      </div>
      <div class="line"></div>
    </div>

    <!-- Tab content -->
    <div class="tab-content">
      

      <div class="tab-pane-show " id="tab-pane-1">
        <div class="row" style="border-radius: 5px ;">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted">Your Tickets</span>
              
            </h4>
            <ul class="list-group mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Movie</h6>
                  <small class="text-muted">${lc.dsPhim.tenPhim }</small>
                </div>
                
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Room</h6>
                  <small class="text-muted">${lc.dsPhong.maPhong }</small>
                </div>
          
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Seat List</h6>
                  <small class="text-muted">${ghe}</small>
                </div>
      
              </li>
              <li class="list-group-item d-flex justify-content-between bg-light">
                <div class="text-success">
                  <h6 class="my-0">Showtime Schedule</h6>
                  <small>Showtime ${lc.formattedGioChieu} (${lc.ngayChieu })</small>
                </div>
				<li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Theater</h6>
                  <small class="text-muted">${lc.getDsPhong().getChiNhanh().getTenChiNhanh()}</small>
                </div>
      
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
              	  <c:if test="${phantramthaydoi} != null">
					<h6 class="my-0">Discount: <fmt:formatNumber value="${(1 - phantramthaydoi) * 100}" pattern="#"/>%</h6>
				  </c:if>
                  <c:if test="${lydothaydoi} != null">
						<small class="text-muted">Event ${lydothaydoi}</small>
				  </c:if>
              </div>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                <span><b>Total Payment</b></span>
                <strong>${tongTien}</strong>
              </li>
            </ul>
             <!-- <hr class="mb-4"> -->
             <div id="countdown-timer" style="font-weight: bold; color: red; text-align: center; margin-bottom: 10px;">
			  <!-- Thời gian giữ ghế sẽ được hiển thị tại đây -->Seat Hold Time: 05:00
			</div>
          </div>
          <div class="col-md-8 order-md-1">
            <h4 class="mb-3" style="color: 
            #eeede9">Payment</h4>
            <form class="needs-validation" novalidate id="form-payment">
              <div class="row">

                <div class="col-md-6 mb-3">
                </div>
              </div>

              <div class="mb-3">
                <label for="username" style="color: 
                #eeede9">Full Name</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input type="text" class="form-control" id="username" placeholder="Tên" value="${user.tenKH}" readonly>
                  <div class="invalid-feedback" style="width: 100%;" value="">
                    Your username is required.
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="email" style="color: 
                #eeede9">Email <span class="text-muted"></span></label>
                <input type="email" class="form-control" id="email" placeholder="...@gmail.com" value="${user.dstaikhoan.email }" readonly>
                <div class="invalid-feedback">
                  Please enter a valid email address for shipping updates.
                </div>
              </div>



              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Phone Numbers<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" value="${user.soDT }" readonly>
              </div>
              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Address<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" value="${user.diaChi }" readonly>
              </div>




              <h4 class="mb-3" style="color: #fff;">Payment</h4>

              <div class="d-block my-3">
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                  <label class="custom-control-label" for="credit" style="color: #fff;">MoMo</label>
                </div>
                <!--<div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="debit" style="color: #fff;">Tiền Mặt</label>
                </div>-->
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="paypal" style="color: #fff;">ZaLoPay</label>
                </div>
              </div>
            </form>
             <div class="btn-trangthai" style="margin-left:190px; display: flex;">
				<form id="cancelForm" action="/DoAnWebCinema/customer/payment/${lc.maSC}.htm" method="POST">
				    <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="resetSelection()"
				        style="background:#e01027; color: #fff; border: none; cursor: pointer">Cancel Booking</button>
				</form>

				<form id="paymentForm" action="/DoAnWebCinema/customer/payment_2/${lc.maSC}/${ghe}.htm">
				    <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn-continue1"
				        style="background:#5eb742; color: #fff; border: none; margin-left: 5px; cursor: pointer">Payment
				    </button>
				</form>
              </div>
            <!-- <button class="btn-continue" id="btn-continue1">Tiep tuc</button> -->
          </div>

        </div>
      </div>

    </div>
</div>
<!-- Modal Thông báo -->
<div id="timeoutModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black;">Notification</h5>
            </div>
            <div class="modal-body">
                <p style="color: black;">Seat Reservation Time Expired!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="redirectToPayment(${lc.maSC})">Rebook Tickets</button>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var ghe = "${ghe}";
        ghe = ghe.replace(/\[|\]|/g, '');
        ghe = ghe.replace(/\s+/g, '');
        var maSC = "${lc.maSC}";
        document.getElementById('paymentForm').action = '/DoAnWebCinema/customer/payment_2/' + maSC + '/' + ghe + '.htm';
        document.getElementById('paymentForm').addEventListener('submit', function(event) {
            event.preventDefault();
            this.submit();
        });
        console.log("Processed seats:", ghe);
    });
</script>
<script>
    var timeRemaining = 300;
    var countdownElement;
    function startCountdown(duration) {
        let timer = duration, minutes, seconds;
        countdownElement = document.getElementById('countdown-timer');

        const interval = setInterval(() => {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            countdownElement.textContent = "Seat Hold Time: " + minutes + ":" + seconds;

            if (--timer < 0) {
                clearInterval(interval);
                showModal();
                resetSelection();
            }
        }, 1000);
    }
    function showModal() {
        document.getElementById('timeoutModal').style.display = 'block';
    }

    function redirectToPayment(masc) {
        window.location.href = 'http://localhost:9999/DoAnWebCinema/customer/payment/' + masc + '.htm';
    }

    function resetSelection() {
    	const selectedSeats = "${ghe}".replace(/[\[\] ]/g, '').split(',');
        const maPhong = "${lc.dsPhong.maPhong}";
        const maSC = "${lc.maSC}";

        if (selectedSeats.length === 0 || !maPhong || !maSC) {
            console.error("Incomplete information to update seat status.");
            return;
        }

        const url = '/DoAnWebCinema/customer/update-ticket-status.htm';
        const data = {
            ghe: selectedSeats.join(','),
            maPhong: maPhong,
            maSC: maSC
        };
		
        console.log("Sending data to:", url);
        console.log("Payload:", JSON.stringify(data));
        
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
            	ghe: data.ghe,
                maPhong: data.maPhong,
                maSC: data.maSC
	        }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            console.log(data);
            window.location.href = `/customer/payment/${maSC}.htm`;

        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
    }
    window.onload = function() {
        startCountdown(timeRemaining);
    };
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
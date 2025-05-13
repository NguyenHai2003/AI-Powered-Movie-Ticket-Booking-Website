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
    <title>Personal Information</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/bootstrap.min.css">
    <!-- Favicon -->

    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/fonts/fontawesome-pro-6.1.1-web/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Template CSS -->
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/main.css" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/alertify.min.css" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/account.css">
   	<link href="http://localhost:9999/DoAnWebCinema/css/font-awesome.min.css" rel="stylesheet" >
	<link href="http://localhost:9999/DoAnWebCinema/css/global.css" rel="stylesheet">
	<link href="http://localhost:9999/DoAnWebCinema/css/index.css" rel="stylesheet">
	<link href="http://localhost:9999/DoAnWebCinema/css/all.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="http://localhost:9999/DoAnWebCinema/js/bootstrap.bundle.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
    <style>
    	.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
	      }

    	@media (min-width: 768px) {
	    	.bd-placeholder-img-lg {
	        	font-size: 3.5rem;
	        }
	    }	   
	    
    </style>
    <!-- Custom styles for this template -->

    <style>
        #carousel-simple {
            text-align: center;
        }
         
    	.errors{
    		color: red;
    	}
    	.col-3 .text-center{
    		background: #088178;
    		color: #222222;
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
<div  class="alert-flag "  aType='${message.type}'
		aMessage="${message.message }">
</div>
<main class="main bg-light vh-90" style="background: #132028 url(https://www.bhdstar.vn/wp-content/themes/bhd/assets/images/bg-cinema-10.png) center top repeat;">
        <section class="pt-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="dashboard-menu">
                                    <ul class="nav flex-column" role="tablist" style="background-color: #fff;">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="account-detail-tab" data-bs-toggle="tab"
                                                href="#account-detail" role="tab" aria-controls="account-detail"
                                                aria-selected="true"><i class="fa-regular fa-user mr-10"></i>Personal Information</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="dashboard-tab" data-bs-toggle="tab"
                                                href="#dashboard" role="tab" aria-controls="dashboard"
                                                aria-selected="false"><i class="fa-solid fa-arrows-rotate mr-10"></i>
                                                Change Password</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="orders-tab" data-bs-toggle="tab" href="#orders"
                                                role="tab" aria-controls="orders" aria-selected="false">
                                                <i class="fa-light fa-ballot mr-10"></i>Transactions</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/DoAnWebCinema/login/logout.htm">
                                                 <i class="fa-solid fa-arrow-right-from-bracket mr-10"></i>Log out</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content dashboard-content">
                                    <div class="tab-pane fade" id="dashboard" role="tabpanel"
                                        aria-labelledby="dashboard-tab">

                                        <div class="card shadow">
                                            <div class="card-header">
                                                <h5 class="mb-0">Change Password</h5>
                                            </div>  
                                            <div class="ten">
                                            <div class="card-body">
                                                <div class="row">
                                                    <form class="col-4 mx-auto pt-5 card" method="post" action="/DoAnWebCinema/customer/change/password.htm">
                                                        <div class="form-group col-md-12">
                                                            <label for="input-current-password">Current Password</label>
                                                            <input type="password" name="oldPass" class="form-control"
                                                                id="input-current-password" required/>
                                                           <%--  ${message_o} --%>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="input-new-password">New Password</label>
                                                            <input type="password" name="newPass" class="form-control"
                                                                id="input-new-password" required/>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="input-confirm-new-password">Confirm new password</label>
                                                            <input type="password" name="confirmPass"
                                                                class="form-control" id="input-confirm-new-password" required/>
                                                            ${message_n}
                                                        </div>

                                                        <div class="form-group col-12">
                                                            <button type="submit" name="btnpw"
                                                                class="btn btn-primary col-12">
                                                                Save Changes
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            </div>                                      
                                            
                                        </div>
                                    </div>
                                    
                                   <div class="tab-pane fade" id="orders" role="tabpanel" aria-labelledby="orders-tab">
        <div class="card shadow">
            <div class="card-header">
                <h5 class="mb-0 d-flex justify-content-between align-center">
                    Your Order
                    <form class="row popup">
                        <div class="d-flex gap-1">
                            <div class="input-group">
                                <input type="text" class="form-control" id="order-search" placeholder="Search" />
                                <div class="input-group-text bg-brand text-white">
                                    <i class="fa fa-search"></i>
                                </div>
                            </div>
                            <div class="popup-btn">
                                <button class="btn">
                                    <i class="fa fa-filter"></i>
                                </button>
                                <div class="popup-card p-10"></div>
                            </div>
                        </div>
                    </form>
                </h5>
            </div>
            <div class="card-body shadow">
            
                <div class="col-12 bg-white p-10 rounded mb-10 bg-brand text-white">
                    <div class="row">
                        <div class="col-2 text-center">Order Code</div>
						<div class="col-3 text-center">Order Date</div>
						<div class="col-2 text-center">Showtime</div>
						<div class="col-3 text-center">Price</div>
						<div class="col-2 text-center">Actions</div>
                    </div>
                </div>
                               
                <div class="col-12">
                <div class="ten">
                <c:forEach var="s" items="${lv}">
                        <div class="col-12 bg-white p-10 rounded-1 mb-5 product border border-brand">
                            <div class="row align-items-center custome-checkbox">
                                <div class="col-2 text-center product-name">
                                    <h5 class="ten">
                                        <a href="shop-product-right.html" style="color: black">${s.maVe}</a>
                                    </h5>
                                </div>
                                <div class="col-3 text-center order-date">
                                    <span>${s.ngayBan}</span>
                                </div>
                                <div class="col-2 text-center product-state">
                                    <span class="badge rounded-pill bg-brand">${s.dsLichChieu.formattedGioChieu}</span>
                                </div>
                                <div class="col-3 text-center">${s.chiTietGhePhong.loaiGhe.gia}</div>
                                <div class="col-2 d-flex justify-content-center gap-md-3 order-action">
                                    <a href="#" class="text-muted my-tooltip" data-bs-toggle="modal" data-bs-target="#order-details${s.maVe}" aria-label="Details">
                                        <i class="fa fa-info-circle"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                    
                </div> 
            </div>
        </div>
    </div>
									
                                    <div class="tab-pane fade active show" id="account-detail" role="tabpanel"
                                        aria-labelledby="account-detail-tab">
                                        <div class="card shadow">
                                            <div class="card-header">
                                                <h5>Personal Information</h5>
                                                <%-- <div style="color: red;">${message}</div> --%>
                                            </div>
                                           <form action="/DoAnWebCinema/customer/update/${user.maKH }.htm" method="POST"
                                                            class="needs-validation" enctype="multipart/form-data">
                                            <div class = "ten">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-4">
														    <div class="avatar-wrapper">
														        <img class="profile-pic" src="uploads/${user.avatar}" />
														        <div class="upload-button">
														            <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
														        </div>
														        <input class="file-upload" type="file" accept="image/*" name="photo" />
														    </div>
                                                        <div class="col-12 text-center text-brand-dark">
                                                            <span class="fs-5"><b>${user.tenKH}</b></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-8">
                                                            <div class="row">
                                                                <div class="form-group col-md-12">
                                                                    <label>Full Name
                                                                        <span class="required">*</span></label>
                                                                        <div class="errors">${errors_tenKH}</div>
                                                                    <input class="form-control" name="tenKH" value="${user.tenKH }" type="text"
                                                                        required />
                                                                </div>

                                                                <fieldset class="col-md-12">
                                                                    <legend class="col-form-label col-sm-2 pt-0">
                                                                        Gender
                                                                    </legend>
                                                                    <div class="col-sm-12 d-flex gap-4 ml-10">
                                                                        <div class="form-check custom-radio">
                                                                            <input class="form-check-input" type="radio"
                                                                                name="gioiTinh" id="female" value="false"
                                                                                checked />
                                                                            <label class="form-check-label"
                                                                                for="female">
                                                                                Female
                                                                            </label>
                                                                        </div>
                                                                        <div class="form-check custom-radio">
                                                                            <input class="form-check-input" type="radio"
                                                                                name="gioiTinh" id="male" value="true" />
                                                                            <label class="form-check-label" for="male">
                                                                                Male
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>
                                                                <div class="form-group col-md-12">
                                                                    <label>Date of Birth
                                                                        <span class="required">*</span></label>
                                                                    <div class="errors">${errors_ngaySinh }</div>
                                                                    <input class="form-control" name="ngaySinh"
                                                                        type="date" value="${user.ngaySinh }" required/>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label>Address
                                                                        <span class="required">*</span></label>
                                                                    <div class="errors">${errors_diaChi }</div>
                                                                    <input  class="form-control"
                                                                        name="diaChi" type="text" value="${user.diaChi }" required/>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label>Phone Number
                                                                        <span class="required">*</span></label>
                                                                    <div class="errors">${errors_soDT }</div>
                                                                    <input class="form-control" name="soDT"
                                                                        type="tel" value="${user.soDT }" required/>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <button type="submit" class="btn" name="submit"
                                                                        value="Submit">
                                                                        Confirm
                                                                    </button>
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- confirm modal -->
    <div class="modal fade" id="confirm-modal" tabindex="-1" aria-labelledby="confirm-modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                    Are you sure you want to delete the selected product?
                </div>
                <div class="text-end p-10">
                    <button type="button" class="btn">Confirm</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
	<!-- order details modal -->
<c:forEach var="s" items="${lv}">
    <div class="modal fade" id="order-details${s.maVe}" tabindex="-1" aria-labelledby="confirm-modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="order_review border-0">
                            <div class="mb-20 d-flex justify-content-between">
                                <h4>Ticket Code: <span class="text-brand">${s.maVe}</span></h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="table-responsive order_table text-center">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th colspan="2">MOVIE</th>
                                            <th>PRICE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="image product-thumbnail">
                                                <img src="/DoAnWebCinema/uploads/${s.dsLichChieu.dsPhim.linkAnh}" alt="#" />
                                            </td>
                                            <td>
                                                <h5>
                                                    <a href="/DoAnWebCinema/film/detail/ma=${s.dsLichChieu.dsPhim.maPhim}.htm" style="color:black">${s.dsLichChieu.dsPhim.tenPhim}</a>
                                                </h5>
                                            </td>
                                            <td>${s.chiTietGhePhong.loaiGhe.gia}</td>
                                        </tr>
                                        <tr>
											    <th>Room</th>
											    <td class="product-subtotal" colspan="2">${s.dsLichChieu.dsPhong.maPhong}</td>
											</tr>
											<tr>
											    <th>Seat Code</th>
											    <td class="product-subtotal" colspan="2">${s.chiTietGhePhong.ghe.tenGhe}</td>
											</tr>
											<tr>
											    <th>Showtime</th>
											    <td colspan="2"><em>${s.dsLichChieu.formattedGioChieu} (${s.dsLichChieu.ngayChieu})</em></td>
											</tr>
											<tr>
											    <th>Total Payment</th>
											    <td colspan="2" class="product-subtotal">
											        <span class="font-xl text-brand fw-900">${s.chiTietGhePhong.loaiGhe.gia}</span>
											    </td>
										</tr>

                                    </tbody>
                                </table>
                            </div>
                            <div class="bt-1 border-color-1 mt-30 mb-30"></div>
                           <div class="payment_method">
						    <div class="mb-25">
						        <h5>
						            Cinema Address:
						            <span class="text-brand">${s.dsLichChieu.getDsPhong().getChiNhanh().getTenChiNhanh()}</span>
						        </h5>
						    </div>
						</div>
						<div class="bt-1 border-color-1 mt-30 mb-30"></div>
						<div class="payment_method">
						    <div class="mb-25">
						        <h5>
						            Payment Method:
						            <span class="text-brand">Online Payment</span>
						        </h5>
						    </div>
						</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
	
    <!--  -->
        <script src=""></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/vendor/jquery-migrate-3.3.0.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/vendor/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/slick.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery.syotimer.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/wow.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery-ui.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/perfect-scrollbar.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/magnific-popup.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/select2.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/waypoints.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/counterup.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery.countdown.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/images-loaded.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/isotope.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/scrollup.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery.vticker-min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery.theia.sticky.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/plugins/jquery.elevatezoom.js"></script>
    <!-- Template  JS -->
    <script src="http://localhost:9999/DoAnWebCinema/js/account.js"></script>


    <script src="http://localhost:9999/DoAnWebCinema/js/shop.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/inputNumber.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/quickView.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/alertify.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/showMessage.js"></script>
	<script src="http://localhost:9999/DoAnWebCinema/js/alertify.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		if ($(".alert-flag").attr("aType")) {
			console.log(1)
			alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 5, function() { console.log('dismissed'); });
			alertify.set('notifier', 'position', 'top-right');
			
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
    document.querySelector(".file-upload").addEventListener("change", function() {
        var reader = new FileReader();

        reader.onload = function(e) {
            document.querySelector(".profile-pic").src = e.target.result;
        }

        reader.readAsDataURL(this.files[0]);
    });

    document.querySelector(".upload-button").addEventListener("click", function() {
        document.querySelector(".file-upload").click();
    });

    </script>

</body>

</html>
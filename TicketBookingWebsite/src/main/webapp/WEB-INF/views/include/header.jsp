<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<img
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"
					src="http://localhost:9999/QuanLyRapChieuPhim/resources/assets/brand/logo.png" width="45" height="45"
					alt="Lỗi tải file">
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="http://localhost:9999/QuanLyRapChieuPhim/home.htm" class="nav-link px-2 text-white">Trang chủ</a></li>
					<li><a href="http://localhost:9999/QuanLyRapChieuPhim/film/showing.htm" class="nav-link px-2 text-white">Phim</a></li>
					<!-- <li><a href="#" class="nav-link px-2 text-white">Thức ăn</a></li>
					<li><a href="#" class="nav-link px-2 text-white">Vé của tôi</a></li>-->
				</ul>

				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="/QuanLyRapChieuPhim/search.htm">
					<input type="search" class="form-control form-control-dark"
						placeholder="Tìm kiếm..." aria-label="Search" name="search">
				</form>
				<c:if test="${login == false}">
					<div class="text-end">
						<a href="http://localhost:9999/QuanLyRapChieuPhim/login.htm" type="button" class="btn btn-outline-light me-2">Đăng nhập</a>
						<a href="http://localhost:9999/QuanLyRapChieuPhim/register.htm" type="button" class="btn btn-warning">Đăng ký</a>
					</div>
				 </c:if>
				<c:if test="${login == true}">
					<div class="text-end">

                    <div class="header-action-2 dropdown">
                        <div class="header-action-icon-2 view-user ">
                            <a href="account.htm" style="color: #fff;"> <i class="fa-regular fa-circle-user" style="margin-left: 80px;font-size: 25px;"></i>
                            </a>
                            <div class="cart-dropdown-wrap cart-dropdown-hm2 dropdown-menu" style="width: 240px; padding: 10px">
                                <ul style="padding-left: 0;">
                                    <li class="dropdown-item"><a href="/QuanLyRapChieuPhim/customer/account.htm"> <img src="https://static.wikia.nocookie.net/servamp/images/4/4c/Kuro_ep_7.jpg/revision/latest?cb=20160816113402"
                                                class="rounded-circle" style="width: 36px; height: 36px;"
                                                alt="" />${user.tenKH }
                                        </a></li>
                                    <!--<li><a style="color: #39317a;"><i class="fa-regular fa-ballot-check"></i>Đơn
                                            mua</a></li>-->
                                    <li class="dropdown-item"><a style="color: #39317a;" href="http://localhost:9999/QuanLyRapChieuPhim/login.htm"><i class="fa-solid fa-arrow-right-from-bracket" style="transform: none;padding: 10px 0;"></i>Đăng xuất
                                        </a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
				 </c:if>
			</div>
		</div>
	</header>

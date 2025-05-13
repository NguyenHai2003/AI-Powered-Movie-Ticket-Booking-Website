<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/register.css"/>

<style>

.page {
	background-image: url("https://assets.nflxext.com/ffe/siteui/vlv3/5523db5a-e2b2-497f-a88b-61f175c3dbad/924da883-2be9-48cc-84cc-45dbf5c7d2da/VN-vi-20230306-popsignuptwoweeks-perspective_alpha_website_large.jpg");
	background-size: auto;
	background-repeat: no-repeat;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
.icon{
	color: #fff;
}
</style>

</head>

<body class="page">
	
	<div class="wrap">
		<div class="login"  style = "margin-top: 20%;">
			<!--<i class="fa-solid fa-xmark iconclose1"></i>-->
			<h2 class="login-header">Sign Up</h2>
			<div style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">${message }</div>			
			<form:form class="login-form" method="POST" action="/DoAnWebCinema/register/insert.htm" modelAttribute="KhachHang">
				<label class="form-label" for="">Name<span style="color: red;">*</span></label>
				<div class="input-container">
					<i class="fa-solid fa-user icon"></i> 
					<form:input type="text"  pattern="[^\d]+" class="input-content" placeholder="Full Name" path="tenKH"  />
					<p
						style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
						<form:errors path="tenKH" cssClass="errors" />
					</p>
				</div>
				
				<div class="input-container">
					<i class="fa-solid fa-globe icon"></i> 
					<form:select path="gioiTinh" id="cars" class="select input-content" placeholder="Gender">
						<option value="true">Male</option>
						<option value="false">Female</option>
					</form:select>
				</div>
				
				<div class="input-container">
					<i class="fa-solid fa-phone icon"></i>
				 	<form:input type="text" class="input-content" placeholder="Phone Number" path="soDT" />
				 	<p
						style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
						<form:errors path="soDT" cssClass="errors" />
					</p>
				</div>
				
				<div class="input-container">
					<i class="fa-solid fa-envelope icon"></i> 
					<form:input type="email" class="input-content" placeholder="Email" path="dstaikhoan.email"/>
					<p
						style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
						<form:errors path="dstaikhoan.email" cssClass="errors" />
					</p>
				</div>
<div class="input-container">
					<i class="fa-solid fa-lock icon"></i>
					<form:input type="password" class="input-content" placeholder="Password" path="dstaikhoan.password"/>
					<p
						style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;">
						<form:errors path="dstaikhoan.password" cssClass="errors" />
					</p>
				</div>
				
				<div class="input-container">
					<i class="fa-solid fa-globe icon"></i> 
					<form:select path="diaChi" id="cars" class="select">
						<option class="opacity-value" value>Select Area</option>
						<option value="Ho Chi Minh">Ho Chi Minh</option>
						<option value="Ha Noi">Hanoi</option>
						<option value="Vung Tau">Vung Tau</option>
						<option value="Dong Nai">Dong Nai</option>
						<option value="Nam Dinh">Nam Dinh</option>
						<option value="Dak Lak">Dak Lak</option>
						<option value="Hai Phong">Hai Phong</option>
						<option value="Thai Binh">Thai Binh</option>
					</form:select>
				</div>
				
				<div>
					<label class="form-label" for="">Date of Birth</label> 
						<select name="day" id="day" class="select-date" required>
							<option value>Date</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>

						<select name="month" id="month" class="select-date" required>
							<option value>Month</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
<select name="year" id="year" class="select-date" required>
						    <option value="">Year</option>
						    <% for (int year = 1990; year <= 2020; year++) { %>
						        <option value="<%= year %>"><%= year %></option>
						    <% } %>
						</select>
				</div>
				<div class="submit-row">
					<button type="submit" class="btn-submit">Sign up</button>
					<!--<div class="term-policy-container"> By signing up, you agree to our&nbsp; <a href="#" class="link">
							Terms of Use </a> &nbsp;and&nbsp; <a href="#" class="link">
							Privacy Policy </a>
					</div>-->
				</div>
			</form:form>
			<div class="login-footer">Do you already have an account? 
			<a href="http://localhost:9999/DoAnWebCinema/login.htm" class="sign-up-link">Login</a>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
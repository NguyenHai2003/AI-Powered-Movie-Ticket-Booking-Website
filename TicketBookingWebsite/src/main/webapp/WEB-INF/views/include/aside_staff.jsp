<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="left-sidebar" data-sidebarbg="skin6">
	<!-- Sidebar scroll-->
	 <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
	<nav class="sidebar-nav">
		<ul id="sidebarnav">
			<!-- User Profile-->
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/profile.htm"
				aria-expanded="false"> <i class="fa fa-user" aria-hidden="true"></i>
					<span class="hide-menu" style="color:black;">Hồ Sơ</span>
			</a></li>
			<li class="sidebar-item">
			    <a class="sidebar-link waves-effect waves-dark sidebar-link"
			       href="http://localhost:9999/DoAnWebCinema/staff/support.htm" aria-expanded="false">
			        <i class="fa-solid fa-headset"></i>
			        <span class="hide-menu" style="color:black;">Hỗ trợ khách hàng</span>
			    </a>
			</li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/password.htm" aria-expanded="false"> <i
					class="fa-solid fa-arrows-rotate mr-10"></i> <span class="hide-menu" style="color:black;">Đổi Mật Khẩu</span>
			</a><li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/customer.htm"" aria-expanded="false"> <i
					class="fa-solid fa-users"></i> <span class="hide-menu" style="color:black;">Khách Hàng</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/movie.htm"
				aria-expanded="false"> <i class="fa-solid fa-film"></i> <span
					class="hide-menu" style="color:black;">Phim</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/directors.htm"
				aria-expanded="false"> <i class="fa-solid fa-clapperboard"></i> <span
					class="hide-menu" style="color:black;">Đạo diễn</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/actors.htm"
				aria-expanded="false"> <i class="fa-solid fa-theater-masks"></i> <span
					class="hide-menu" style="color:black;">Diễn viên</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/seat.htm"" aria-expanded="false"> <i
					class="fa-solid fa-ticket-simple"></i> <span class="hide-menu" style="color:black;">Loại ghế</span>
			</a></li>
			<li class="sidebar-item">
			    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="http://localhost:9999/DoAnWebCinema/staff/order.htm?filter=today" aria-expanded="false">
			        <i class="fa-solid fa-bookmark"></i> <span class="hide-menu" style="color:black;">Vé đã đặt</span>
			    </a>
			</li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/room.htm"" aria-expanded="false"> <i
					class="fa-solid fa-house-chimney"></i> <span class="hide-menu" style="color:black;">Phòng</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/showtimes.htm" aria-expanded="false"> <i class="fa-solid fa-calendar-days"></i><span 
						class="hide-menu" style="color:black;">Lịch Chiếu</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/staff/type.htm" aria-expanded="false"> <i class="fa-solid fa-align-center"></i> <span 
						class="hide-menu" style="color:black;">Thể loại</span>
			</a></li>
			<li class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="http://localhost:9999/DoAnWebCinema/login.htm" aria-expanded="false"> <i
					class="fa-solid fa-arrow-right-from-bracket"></i> <span
					class="hide-menu" style="color:black;">Đăng Xuất</span>
			</a></li>
		</ul>

	</nav>
	<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>
<script>
    const currentDate = new Date();
    const month = currentDate.getMonth() + 1;
    const year = currentDate.getFullYear();
    const dashboardLink = document.getElementById("dashboard-link");
    dashboardLink.href = 'http://localhost:9999/DoAnWebCinema/staff/dashboard.htm?month=' +  month + '&year=' + year;
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>Lịch Chiếu</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="http://localhost:9999/DoAnWebCinema/imgs/favicon.png">
<!-- Custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<link
	href="http://localhost:9999/DoAnWebCinema/css/chartist.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/chartist-plugin-tooltip.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Custom CSS -->
<link
	href="http://localhost:9999/DoAnWebCinema/css/style.min.css"
	rel="stylesheet">
<link
	href="http://localhost:9999/DoAnWebCinema/css/employee.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/detail-test.css">
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/fix-test.css">
<!-- <link href="../css/add-employee.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
	    <link rel="stylesheet"
	href="<c:url value='/css/alertify.min.css'/>" />
</head>
<style>
<style>
/* Modal header styling */
.modal-header {
    background-color: #007bff;
    color: white;
    font-size: 1.25rem;
}

/* Modal body styling */
.modal-body {
    padding: 30px;
}

img.img-fluid {
    border-radius: 8px;  /* Bo góc ảnh */
    object-fit: cover;   /* Giữ nguyên tỷ lệ ảnh mà không làm biến dạng */
    width: 100%;          /* Đảm bảo ảnh chiếm đủ không gian */
    height: auto;         /* Chiều cao tự động thay đổi theo chiều rộng */
}

/* Status label styling */
.status {
	margin: auto;
    font-size: 1.1rem;
    font-weight: bold;
    color: #28a745;
}

/* Container for info boxes */
.info-box {
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    transition: all 0.3s ease;
}

.info-box:hover {
    background-color: #f1f1f1;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Label styling */
.label {
    font-size: 1rem;
    font-weight: bold;
    color: #333;
}

/* Info details styling */
.info-detail {
	margin-left: 10px;
    font-size: 1.1rem;
    font-weight: normal;
    color: #555;
}

/* Button styling */
button.btn-outline-primary {
    width: 100%;
    padding: 10px;
    background-color: transparent;
    border: 2px solid #007bff;
    color: #007bff;
    font-weight: bold;
}

button.btn-outline-primary:hover {
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}
/* Mở rộng Label và Input */
.info-detail.input-large {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* Mở rộng Textarea */
textarea.input-large {
    height: 150px;
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}


/* Thêm margin cho các label */
.label {
    font-weight: bold;
    font-size: 14px;
    color: #333;
    margin-top: 10px;
    margin-bottom: 5px;
}

/* Cải thiện các nút */
.button-add {
    background-color: #007bff;
    color: white;
    padding: 12px 24px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.button-add:hover {
    background-color: #0056b3;
}

/* Định dạng cho section lọc */
.filter-section {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

/* Định dạng cho label */
.filter-label {
    font-size: 16px;
    font-weight: bold;
    margin-right: 15px;
    color: #333;
}

/* Wrapper cho select */
.select-wrapper {
    position: relative;
    display: inline-block;
    width: 200px;
}

/* Định dạng cho select */
.filter-select {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    color: #333;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
    transition: all 0.3s ease;
}

/* Đổi màu khi hover */
.filter-select:hover {
    border-color: #007BFF;
}

/* Thêm hiệu ứng focus */
.filter-select:focus {
    border-color: #007BFF;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* Định dạng cho các option */
.filter-select option {
    padding: 10px;
    font-size: 16px;
}


/* Responsive design */
@media (max-width: 768px) {
    .modal-body {
        padding: 15px;
    }

    .info-box {
        padding: 8px;
    }

    img.img-fluid {
        width: 120px;
        height: 180px;
    }
}

</style>
</style>
<body>
	<!-- <div class="container" style="width:100%";>
<h2> Bootstrap Sort Table </h2> -->
<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
    data-sidebartype="full" data-sidebar-position="absolute"
    data-header-position="absolute" data-boxed-layout="full">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->

    <%@include file="/WEB-INF/views/include/header_admin.jsp"%>

    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->

    <%@include file="/WEB-INF/views/include/aside.jsp"%>

    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper" style="min-height: 250px;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb bg-white">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Showtime Schedule</h4>
                </div>

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="box-header">
                            <div>
                                <h3 class="box-title">List of Showtimes</h3>
                            </div>
                            <!-- Filter by date -->
                            <div class="filter-section">
                                <form action="${pageContext.request.contextPath}/admin/showtimes.htm" method="get">
                                    <label for="filterDate" class="filter-label">Select Date:</label>
                                    <div class="select-wrapper">
                                        <select id="filterDate" name="filterDate" class="filter-select" onchange="this.form.submit()">
                                            <c:forEach var="date" items="${dateOptions}">
                                                <option value="${date}" ${date == filterDate ? 'selected' : ''}>${date}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="btn-add-e">
                                <a href="#">
                                    <button class="button-header1-e" data-bs-toggle="modal"
                                        data-bs-target="#add-employee">
                                        <i class="fa-solid fa-circle-exclamation"
                                            data-bs-toggle="modal" data-bs-target="#add-employee"></i>
                                        Add New
                                    </button>
                                </a>

                            </div>
                        </div>


                        <div class="table-responsive">

                            <table class="table table-striped table-hover" id="sortTable">
                                <thead>
                                    <tr>
                                        <th class="border-top-0">Showtime ID</th>
                                        <th class="border-top-0">Movie Name</th>
                                        <th class="border-top-0">Room ID</th>
                                        <th class="border-top-0">Show Date</th>
                                        <th class="border-top-0">Show Time</th>
                                        <th class="border-top-0">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="l" items="${lc}">
                                        <tr>
                                            <td>${l.maSC}</td>
                                            <td>${l.dsPhim.tenPhim }</td>
                                            <td>${l.dsPhong.maPhong }</td>
                                            <td><fmt:formatDate value="${l.ngayChieu }" pattern="dd-MM-yyyy"/></td>
                                            <td>${l.formattedGioChieu}</td>
                                            <td><a href="#">
                                                    <button class="button" data-bs-toggle="modal"
                                                        data-bs-target="#info-${l.maSC }">
                                                        <i class="fa-solid fa-circle-exclamation"></i>
                                                    </button>
                                            </a> <a href="#">
                                                    <button class="button" data-bs-toggle="modal"
                                                        data-bs-target="#fix-${l.maSC }">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </button>
                                            </a>
                                            <a href="#">
                                                        <button class="button" data-bs-toggle="modal"
                                                        data-bs-target="#e-${l.maSC}" >
                                                            <i class="fa-solid fa-trash"></i>
                                                        </button>
                                            </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Popup modal add employee  -->
                        <div class="modal fade" id="add-employee" tabindex="-1"
                            role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary text-white">
                                        <h4 class="modal-title" id="myCenterModalLabel">Add Showtime</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body" style="margin: 0 auto;">
                                        <!-- <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center"> -->
                                        <div class="row">
                                            <!-- <div class="col-12"> -->
                                            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                                <div class="row tm-edit-product-row">
                                                    <!-- <div class="col-12"> -->
                                                    <!-- <div class="header-info">
                                                        <!-- <h3 class="header-name-info">Employee Information</h3> 
                                                    </div> -->
                                                    <form class="contener1-fix"
                                                        action="/DoAnWebCinema/admin/showtimes/add.htm"
                                                        method="post" modelAttribute="showtimes">
                                                        <div class="body-full-fix">

                                                            <div class="detail-info-fix">
                                                                <p class="detail-info-top-fix">Movie Name</p>

                                                                <select class="detail-info-buton-fix" name="maPhim">
                                                                    <c:forEach var="p" items="${pt}">
                                                                        <option value=${p.maPhim }>${p.tenPhim }</option>

                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="detail-info-fix">
                                                                <p class="detail-info-top-fix">Room</p>
                                                                <select class="detail-info-buton-fix" name="maPhong">
                                                                    <c:forEach var="p" items="${pct}">
                                                                        <option value=${p.maPhong }>${p.maPhong }</option>

                                                                    </c:forEach>

                                                                </select>
                                                            </div>
                                                            <!--  <div class="detail-info-fix">
                                                                <p class="detail-info-top-fix"></p>
                                                                <input class="detail-info-buton-fix"></input>
                                                            </div> -->
                                                            <div class="detail-info-fix">
                                                                <p class="detail-info-top-fix">Select Hour</p>
                                                                <select class="detail-info-buton-fix" name="gioChieu">
                                                                    <option value="08">08</option>
                                                                    <option value="09">09</option>
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
                                                                    <option value="21">22</option>
                                                                    <option value="21">23</option>
                                                                </select>
                                                            </div>
                                                            <div class="detail-info-fix">
                                                                <p class="detail-info-top-fix">Select Minutes</p>
                                                                <select class="detail-info-buton-fix" name="phutChieu">
                                                                    <option value="00">00</option>
                                                                    <option value="15">15</option>
                                                                    <option value="30">30</option>
                                                                    <option value="45">45</option>
                                                                </select>
                                                            </div>

                                                            <div class="detail-info-fix">
                                                                <!-- <div class="detail-info-fix-left"> -->
                                                                <p class="detail-info-top-fix">Show Date</p>

                                                                <input type="date" name="ngayChieu"
                                                                    class="detail-info-buton-fix" name="" id="" required>

                                                            </div>
                                                        </div>
                                                        <div class="body-botton-fix">
                                                            <button class="button-fix-f"
                                                                style="width: 85%; margin-left: 25px;">Add
                                                                New</button>
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
                </div>
            </div>


    <c:forEach var="s" items="${lc}">
    <div class="modal fade" id="e-${s.maSC}" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm v-modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <p>Click delete to remove the showtime</p>

                    </div>
                    <form method="post" modelAttribute="nhanVien" action="/DoAnWebCinema/admin/showtimes/delete/${s.maSC}.htm">
                        <div class="modal-footer">

                            <button type="submit"
                                class="btn-green btn btn-primary">Delete</button>


                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
<!--         VIEW DETAILS -->
                <c:forEach var="l" items="${lc}">
    <div class="modal fade" id="info-${l.maSC}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title">Showtime Information</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Movie Image and Status -->
                            <div class="col-md-4 text-center">
                                <img src="/DoAnWebCinema/uploads/${l.dsPhim.linkAnh}" alt="movie-poster" class="img-fluid rounded mb-3"/>
                                <button class="btn btn-outline-primary mb-3" style="margin:auto;">Showtime ID: <span>${l.maSC}</span></button>
                                <p class="btn-f btn-solid-f">Status: ${l.trangThai}</p>
                            </div>

                            <!-- Showtime details -->
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Movie Name</p>
                                            <h6 class="info-detail">${l.dsPhim.tenPhim}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Screen</p>
                                            <h6 class="info-detail">${l.dsPhong.maPhong}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Show Time</p>
                                            <h6 class="info-detail">${l.gioChieu}</h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info-box">
                                            <p class="label">Show Date</p>
                                            <h6 class="info-detail"><fmt:formatDate value="${l.ngayChieu}" pattern="dd-MM-yyyy"/></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    <!-- Popup fix employee -->
    <c:forEach var="l" items="${lc}">
        <div class="modal fade" id="fix-${l.maSC }" tabindex="-1"
            role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myCenterModalLabel">Edit Showtime</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="margin: 0 auto;">
                        <form class="contener1-fix" action="/DoAnWebCinema/admin/showtimes/edit/${l.maSC}.htm"
                            method="post" modelAttribute="showtimes">
                            <div class="body-full-fix">
                                <div class="detail-info-fix">
                                    <p class="detail-info-top-fix">Movie Name</p>

                                    <select class="detail-info-buton-fix" name="maPhim">
                                        <c:forEach var="p" items="${pt}">
                                            <option value=${p.maPhim } ${l.dsPhim.maPhim == p.maPhim ? 'selected' : ''}>${p.tenPhim }</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="detail-info-fix">
                                    <p class="detail-info-top-fix">Room</p>
                                    <select class="detail-info-buton-fix" name="maPhong">
                                        <c:forEach var="p" items="${pct}">
                                            <option value=${p.maPhong } ${l.dsPhong.maPhong == p.maPhong ? 'selected' : ''}>${p.maPhong }</option>

                                        </c:forEach>

                                    </select>
                                </div>
                                <div class="detail-info-fix">
				    <p class="detail-info-top-fix">Choose Hour</p>
				    <select class="detail-info-buton-fix" name="gioChieu">
						<c:forEach var="hour" items="${hours}">
						    <option value="${hour}" ${hour == l.gioChieu.toLocalTime().getHour() ? 'selected' : ''}>${hour}</option>
						</c:forEach>
				    </select>
				</div>
				<div class="detail-info-fix">
				    <p class="detail-info-top-fix">Choose Minute</p>
				    <select class="detail-info-buton-fix" name="phutChieu">
				    	<c:forEach var="minute" items="${minutes}">
						    <option value="${minute}" ${minute == l.gioChieu.toLocalTime().getMinute() ? 'selected' : ''}>${minute}</option>
						</c:forEach>
				    </select>
				</div>
			
			                                <div class="detail-info-fix">
			                                    <p class="detail-info-top-fix">Show Date</p>
			
			                                    <input type="date" name="ngayChieu"
			                                        class="detail-info-buton-fix" value="${l.ngayChieu }" required>
			
			                                </div>
			
			                            </div>
			                            <div class="body-botton-fix">
			                                <button class="button-fix-f" style="width: 85%; margin-left: 25px;">Save Changes</button>
			                            </div>
			
			                        </form>
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

	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script>
		$('#sortTable').DataTable();
	</script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="http://localhost:9999/DoAnWebCinema/js/bootstrap.bundle.min.js"></script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/app-style-switcher.js"></script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script
		src="http://localhost:9999/DoAnWebCinema/js/waves.js"></script>
	<!--Menu sidebar -->
	<script
		src="http://localhost:9999/DoAnWebCinema/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="http://localhost:9999/DoAnWebCinema/js/custom.js"></script>
	<!--This page JavaScript -->
	<!--chartis chart-->
	<script
		src="http://localhost:9999/DoAnWebCinema/js/chartist.min.js"></script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/chartist-plugin-tooltip.min.js"></script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/dashboard1.js"></script>
			<script src=" <c:url value='/js/alertify.min.js'/>"></script>
	
	<script type="text/javascript">
		if ($(".alert-flag").attr("aType")) {
			console.log(1)
			alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 5, function() { console.log('dismissed'); });
			alertify.set('notifier', 'position', 'top-right');
		}
	</script>
</body>
</html>

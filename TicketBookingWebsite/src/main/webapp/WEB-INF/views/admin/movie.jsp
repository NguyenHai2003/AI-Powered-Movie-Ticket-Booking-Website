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
<title>Phim</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/imgs/favicon.png">
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
<link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/detail_test.css">
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/fix-test.css">
<link rel="stylesheet"
	href="http://localhost:9999/DoAnWebCinema/css/add-test.css">
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
</head>
<body>
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	<!-- <div class="container" style="width:100%";>
<h2> Bootstrap Sort Table </h2> -->
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
						<h4 class="page-title">Movies</h4>
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
									<h3 class="box-title">Movies List</h3>
								</div>
								<div class="btn-add-e">
									<a href="#">
										<button class="button-header1-e" data-bs-toggle="modal"
											data-bs-target="#add-employee">
											<i class="fa-solid fa-circle-exclamation"
												data-bs-toggle="modal" data-bs-target="#add-employee"></i>
											Add
										</button>
									</a>

								</div>
							</div>


							<div class="table-responsive">

								<table class="table table-striped table-hover" id="sortTable">
									<thead>
										<tr>
											<th class="border-top-0">Movie ID</th>
											<th class="border-top-0">Movie Title</th>
											<th class="border-top-0">Release Date</th>
											<th class="border-top-0">Duration</th>
											<th class="border-top-0">Director</th>
											<th class="border-top-0">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="p" items="${phim}">
											<tr>
												<td>${p.maPhim }</td>
												<td>${p.tenPhim }</td>
												<td><fmt:formatDate value="${p.ngayKhoiChieu}" pattern="dd-MM-yyyy"/></td>
												<td>${p.thoiLuong }</td>
												<td>${p.daoDien.tenDaoDien }</td>              
												<td><a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#show${p.maPhim}">
															<i class="fa-solid fa-circle-exclamation"></i>
														</button>
												</a> <a href="#">
														<button class="button" data="${p.maPhim}" data-bs-toggle="modal"
															data-bs-target="#f-${p.maPhim}">
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
												</a> <a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#e-${p.maPhim}">
															<i class="fa-solid fa-trash"></i>
														</button>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- THÊM PHIM  -->
							<div class="modal fade" id="add-employee" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h4 class="modal-title" id="myCenterModalLabel">Add New Movie</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
    <div class="container-fluid">
    <form action="/DoAnWebCinema/admin/movie/add.htm" method="post" modelAttribute="movie" enctype="multipart/form-data">
        <div class="row">
            <!-- Ảnh phim và trạng thái -->
			<div class="col-md-4 text-center">
			    <img id="movie-poster-1" src="/DoAnWebCinema/images/default-movie.jpg" alt="movie-poster" class="img-fluid rounded mb-3 movie-poster"/>
			    <button type="button" class="btn btn-outline-primary mb-3" style="margin:auto;" onclick="document.getElementById('file-upload-1').click();">
			        Add photo
			    </button>
			    <input id="file-upload-1" type="file" accept="image/*" name="moviePhoto" style="display: none;" onchange="previewImage(event, 'movie-poster-1')"/>
			    <p class="detail-info-top-left-add">Status:</p>
			    <select name="maTT" class="custom-select" style="margin-left:auto;">
			        <option value="1">Now Showing</option>
			        <option value="2">Coming Soon</option>
			    </select>
			</div>
            
            <!-- Thông tin chi tiết phim -->
            <div class="col-md-8">
                <div class="row">
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Movie Title</p>
                            <input class="info-detail input-large" name="tenPhim" required />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Description</p>
                            <textarea class="info-detail input-large" name="moTa" required></textarea>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Genre:</p>
                            <div style="display: grid; grid-template-columns: 1fr 1fr;">
                                <c:forEach var="t" items="${dsCTTL}">
                                    <div>
                                        <input type="checkbox" name="TL" id="${t.maTL}" value="${t.maTL}">
                                        <label for="${t.maTL}">${t.tenTL}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="info-box">
                            <p class="label">Year of Production</p>
                            <input class="info-detail" name="namSX" required />
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="info-box">
                            <p class="label">Country of Production</p>
                            <input class="info-detail" name="nuocSX" required />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Director Name</p>
                            <input class="info-detail" name="tenDaoDien" required />
                        </div>
                    </div>
					<div class="col-12">
					    <div class="info-box">
					        <p class="label">List of Actors:</p>
					        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 10px;">
					            <!-- Tạo 3 ô để nhập diễn viên cho phim -->
					            <c:forEach var="i" begin="1" end="3">
					                <div>
					                    <label for="dienVien-${i}">Actor ${i}:</label>
					                    <select name="dienVien-${i}" id="dienVien-${i}" style="width: 100%;">
					                        <c:forEach var="actor" items="${listDienVien}">
					                            <option value="${actor.idDienVien}">${actor.tenDienVien}</option>
					                        </c:forEach>
					                    </select>
					                    <input type="text" name="vaiDien-${i}" placeholder="Nhập vai diễn" style="margin-top: 5px; width: 100%;" />
					                </div>
					            </c:forEach>
					        </div>
					    </div>
					</div>
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Duration</p>
                            <input class="info-detail" name="thoiLuong" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="info-box">
                            <p class="label">Release Date</p>
                            <input type="date" name="ngayKhoiChieu" required />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Submit Button -->
        <div class="body-botton">
            <button class="button-add">Add New</button>
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

			<!-- Popup info employee -->
<c:forEach var="p" items="${phim}">
    <div class="modal fade" id="show${p.maPhim}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title">Movie Details</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Ảnh phim và trạng thái -->
                            <div class="col-md-4 text-center">
                                <img src="/DoAnWebCinema/uploads/${p.linkAnh}" alt="movie-poster" class="img-fluid rounded mb-3"/>
                                <button class="btn btn-outline-primary mb-3" style="margin:auto;">Movie ID: <span>${p.maPhim}</span></button>
                                <p class="btn-f btn-solid-f">
                                    ${p.maTT == 1 ? "Now Showing" : p.maTT == 2 ? "Coming Soon" : "Stopped"}
                                </p>
                            </div>
                            
                            <!-- Thông tin chi tiết phim -->
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Movie Title</p>
                                            <h6 class="info-detail">${p.tenPhim}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Genre</p>
                                            <h6 class="info-detail">
                                                <c:if test="${not empty p.chiTietTheLoais}">
                                                    <c:forEach var="chiTiet" items="${p.chiTietTheLoais}" varStatus="status">
                                                        <c:out value="${chiTiet.theLoai.tenTL}" />
                                                        <c:if test="${!status.last}">, </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Description</p>
                                            <h6 class="info-detail">${p.moTa}</h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info-box">
                                            <p class="label">Release Date</p>
                                            <h6 class="info-detail">
                                                <fmt:formatDate value="${p.ngayKhoiChieu}" pattern="dd-MM-yyyy" />
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info-box">
                                            <p class="label">Year of Production</p>
                                            <h6 class="info-detail">${p.namSX}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Director Name</p>
                                            <h6 class="info-detail">${p.daoDien.tenDaoDien}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Actors</p>
                                                					    <c:if test="${not empty p.vaiDiens}">
							        <c:forEach var="chiTietdienvien" items="${p.vaiDiens}" varStatus="status">
							            <c:out value="${chiTietdienvien.getDienVien().tenDienVien}" />
							            <c:if test="${!status.last}">, </c:if>
							        </c:forEach>
							    </c:if>
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

	<c:forEach var="s" items="${phim}">
		<div class="modal fade" id="e-${s.maPhim}" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-sm v-modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<p>Confirm the deletion of this movie?</p>

					</div>
					<form method="post" modelAttribute="nhanVien"
						action="/DoAnWebCinema/admin/movie/delete/${s.maPhim}.htm">
						<div class="modal-footer">

							<button type="submit" class="btn-green btn btn-primary">OK</button>


						</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
<c:forEach var="p" items="${phim}">
    <!-- CHỈNH SỬA PHIM  -->
    <div class="modal fade" id="f-${p.maPhim}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title" id="myCenterModalLabel">Movie Edit</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                        <div class="container-fluid">
                          <form action="/DoAnWebCinema/admin/movie/update/${p.maPhim}.htm" method="post" modelAttribute="movieUpdate" enctype="multipart/form-data">
                            <div class="row">
                                <!-- Ảnh phim và trạng thái -->
								<div class="col-md-4 text-center">
								   <img id="movie-poster-${p.maPhim}" src="/DoAnWebCinema/uploads/${p.linkAnh}" alt="movie-poster" class="img-fluid rounded mb-3 movie-poster"/>
									<button type="button" class="btn btn-outline-primary mb-3" style="margin:auto;" onclick="document.getElementById('file-upload-${p.maPhim}').click();">
									    Edit photo
									</button>
									<input id="file-upload-${p.maPhim}" type="file" accept="image/*" name="moviePhoto1" style="display: none;" onchange="previewImage(event, 'movie-poster-${p.maPhim}')"/>
								    <p class="detail-info-top-left-add">Status:</p>
								    <select name="maTT" class="custom-select" style="margin-left:auto;">
								        <option value="0" <c:if test="${p.maTT == 0}">selected</c:if>>Stopped</option>
								        <option value="1" <c:if test="${p.maTT == 1}">selected</c:if>>Now Showing</option>
								        <option value="2" <c:if test="${p.maTT == 2}">selected</c:if>>Coming Soon</option>
								    </select>
								</div>
                                <!-- Thông tin chi tiết phim -->
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Movie Title</p>
                                                <input class="info-detail input-large" name="tenPhim" value="${p.tenPhim}" required />
                                                <input type="hidden" value="${p.maPhim }" name="maPhimN" />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Description</p>
                                                <textarea class="info-detail input-large" name="moTa" required>${p.moTa}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Genre:</p>
                                                <div style="display: grid; grid-template-columns: 1fr 1fr;">
                                                    <c:forEach var="t" items="${dsCTTL}">
                                                        <div>
                                                            <input type="checkbox" name="TL" id="${t.maTL}" value="${t.maTL}"
                                                               <c:forEach var="tl" items="${p.chiTietTheLoais}">
                                                                   <c:if test="${tl.theLoai.maTL == t.maTL}">checked</c:if>
                                                               </c:forEach>>
                                                            <label for="${t.maTL}">${t.tenTL}</label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="info-box">
                                                <p class="label">Year of Production</p>
                                                <input class="info-detail" name="namSX" value="${p.namSX}" required />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="info-box">
                                                <p class="label">Country of Production</p>
                                                <input class="info-detail" name="nuocSX" value="${p.nuocSX}" required />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Director Name</p>
                                                <input class="info-detail" name="daoDien" value="${p.daoDien.tenDaoDien}" required />
                                            </div>
                                        </div>
			                            <div class="col-12">
										    <div class="info-box">
										        <p class="label">Actors List:</p>
										        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
										            <!-- Kiểm tra nếu không có vai diễn thì tạo các ô trống -->
										            <c:choose>
										                <c:when test="${empty p.vaiDiens}">
										                    <!-- Tạo 4 ô trống nếu không có diễn viên -->
										                    <c:forEach var="i" begin="1" end="3">
										                        <div>
										                            <label for="dienVien-${i}">Diễn Viên ${i}:</label>
																	<select name="dienVien-${i}" id="dienVien-${i}" style="width: 100%;">
																	    <c:forEach var="actor" items="${listDienVien}">
																	        <option value="${actor.idDienVien}">${actor.tenDienVien}</option>
																	    </c:forEach>
																	</select>
																	<input type="text" name="vaiDien-${i}" placeholder="Nhập vai diễn" style="margin-top: 5px; width: 100%;" />
										                        </div>
										                    </c:forEach>
										                </c:when>
										                <c:otherwise>
											                <!-- Nếu có diễn viên, hiển thị thông tin các vai diễn đã chọn -->
															<c:forEach var="vaidien" items="${p.vaiDiens}" varStatus="status">
															    <div>
															        <label for="dienVien-${vaidien.dienVien.idDienVien}">Diễn Viên ${status.index + 1}:</label>
															        <select name="dienVien-${vaidien.dienVien.idDienVien}" id="dienVien-${vaidien.dienVien.idDienVien}" style="width: 100%;">
															            <c:forEach var="actor" items="${listDienVien}">
															                <option value="${actor.idDienVien}" 
															                        <c:if test="${actor.idDienVien == vaidien.dienVien.idDienVien}">selected</c:if>>
															                    ${actor.tenDienVien} 
															                </option>
															            </c:forEach>
															        </select>
															        <input type="text" name="vaiDien-${vaidien.dienVien.idDienVien}" 
															               placeholder="Nhập vai diễn" 
															               value="${vaidien.tenVaiDien != null ? vaidien.tenVaiDien : ''}"
															               style="margin-top: 5px; width: 100%;" />
															    </div>
															</c:forEach>
										                </c:otherwise>
										            </c:choose>
										        </div>
										    </div>
										</div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Duration</p>
                                                <input class="info-detail" name="thoiLuong" value="${p.thoiLuong}" required />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Release Date</p>
                                                <input type="date" name="ngayKhoiChieu" value="<fmt:formatDate value='${p.ngayKhoiChieu}' pattern='yyyy-MM-dd' />" required />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="info-box">
                                                <p class="label">Link Trailer</p>
                                                <input class="info-detail input-large" name="linkTrailer" value="${p.linkTrailer}" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                            <!-- Submit Button -->
                            <div class="body-botton">
                                <button class="button-add">Save</button>
                            </div>
                            </div>
                            </form>
                        </div>
                </div>    
            </div>
        </div>
    </div>
</c:forEach>
<script>
function previewImage(event, imgId) {
    const reader = new FileReader();
    reader.onload = function () {
        setTimeout(() => {
            const img = document.getElementById(imgId);
            if (img) {
                img.src = reader.result;
            } else {
                console.warn('Không tìm thấy phần tử ảnh với ID:', imgId);
            }
        }, 100);
    };
    reader.readAsDataURL(event.target.files[0]);
}

</script>
	
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
		src="http://localhost:9999/DoAnWebCinema/jschartist-plugin-tooltip.min.js"></script>
	<script
		src="http://localhost:9999/DoAnWebCinema/js/pages/dashboards/dashboard1.js"></script>
	<script src=" <c:url value='/js/alertify.min.js'/>"></script>

	<script type="text/javascript">
		if ($(".alert-flag").attr("aType")) {
			console.log(1)
			alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag")
					.attr("aType"), 5, function() {
				console.log('dismissed');
			});
			alertify.set('notifier', 'position', 'top-right');
		}
		
		$(".button").click(function() {
			const maPhim = this.getAttribute("data");
			
			$(".tlc-" + maPhim).each(function() {
				$("#tlm-" + maPhim + "-" + this.value).prop("checked", true)
			})
			
			
		})
		
		$(".inputTL").each(function(){
			console.log(this.value)
		}) 
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Loại Vé</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="http://localhost:9999/DoAnWebCinema/imgs/favicon.png">
<!-- Custom CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
						<h4 class="page-title">Loại Vé</h4>
						
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
									<h3 class="box-title">Bảng Loại Vé</h3>
								</div>
								<div class="btn-add-e">
									<a href="#">
										<button class="button-header1-e" data-bs-toggle="modal"
											data-bs-target="#add-food">
											<i class="fa-solid fa-circle-exclamation"
												data-bs-toggle="modal" data-bs-target="#add-food"></i> Thêm
											mới
										</button>
									</a>

								</div>
							</div>

							<div class="table-responsive">

								<table class="table table-striped table-hover" id="sortTable">
									<thead>
										<tr>
											<th class="border-top-0">STT</th>
											<th class="border-top-0">Mã vé</th>
											<th class="border-top-0">Tên loại vé</th>
											<th class="border-top-0">Giá vé</th>
											<th class="border-top-0">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" items="${lv}" varStatus="status">
											<tr>
												<td>${status.index +1}</td>
												<td>${v.maVe }</td>
												<td>${0 }</td>
												<td>${0 }</td>
												<td>
													<!--<a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#delete-food">
															<i class="fa-solid fa-trash"></i>
														</button>
												</a>--> <a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#t-${v.maVe }">
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
												</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Popup model add employee  -->
			<div class="modal fade" id="add-food" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myCenterModalLabel"></h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div
								class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
								<div class="row">
									<div class="col-12">
										<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
											<div class="row tm-edit-product-row">
												<div class="col-12">
													<div class="header-add-e">
														<h3 class="header-name-add-e">Thêm Mới Loại Vé</h3>
													</div>
													<!--<div class="tieude-add-e">
														<span class="chitiet-left-add-e">Mã Nhân Viên:</span> <span
															class="chitiet-add-e">${user.tenNV }</span>

													</div>-->
													<form class="container-add-e tm-edit-product-form"
														action="/DoAnWebCinema/admin/ticket/add.htm"
														method="post" modelAttribute="ticket">
														<div class="body-add-e">
															<div class="tieude1-add-e">
																<span class="chitiet-left-add-e">Mã Loại Vé :</span>
																<div class="input-add-e">
																	<input type="text" name="maVe" id=""
																		class="input-name-add-e" required>
																</div>
															</div>
															<div class="tieude1-add-e">
																<span class="chitiet-left-add-e">Tên Loại Vé :</span>
																<div class="input-add-e">
																	<input type="text" name="tenLV" id=""
																		class="input-name-add-e" required>
																</div>
															</div>
															<div class="tieude1-add-e">
																<span class="chitiet-left-add-e">Giá:</span>
																<div class="input-add-e">
																	<input type="text" name="gia" id=""
																		class="input-name-add-e" required>
																</div>
															</div>


															<div class="tieude-btn-add-e">
																<button type="submit" class="button-add-add-e">Thêm
																	Mới</button>
																<button class="button-dong-add-e">Đóng</button>
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
				</div>
			</div>

			<!-- Popup info employee -->
			<!-- Popup model add employee  -->
			<c:forEach var="v" items="${lv}" varStatus="status">
				<div class="modal fade" id="t-${v.maVe }" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myCenterModalLabel"></h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div
									class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
									<div class="row">
										<div class="col-12">
											<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
												<div class="row tm-edit-product-row">
													<div class="col-12">
														<div class="header-add-e">
															<h3 class="header-name-add-e">Sửa Thông Tin Loại Vé</h3>
														</div>

														<!--<div class="tieude-add-e">
															<span class="chitiet-left-add-e">Mã Nhân Viên:</span> <span
																class="chitiet-add-e">1001</span>

														</div>-->

														<form class="container-add-e tm-edit-product-form"
															action="/DoAnWebCinema/admin/ticket/update/${v.maVe }.htm"
															method="post" modelAttribute="ticketUpdate">
															<div class="body-add-e">
																<div class="tieude1-add-e">
																	<span class="chitiet-left-add-e">Mã Loại Vé:</span>
																	<div class="input-add-e">
																		<input type="text" name="maVe"
																			class="input-name-add-e" value=${0 } readonly />
																	</div>
																</div>
																<div class="tieude1-add-e">
																	<span class="chitiet-left-add-e">Tên Loại Vé:</span>
																	<div class="input-add-e">
																		<input type="text" name="tenLV"
																			class="input-name-add-e" value=${0}>
																	</div>
																</div>
																<div class="tieude1-add-e">
																	<span class="chitiet-left-add-e">Giá:</span>
																	<div class="input-add-e">
																		<input type="text" name="gia" id=""
																			class="input-name-add-e" value=${0 } readonly>
																	</div>
																</div>


																<div class="tieude-btn-add-e">
																	<button type="submit" class="button-add-add-e">Cập
																		Nhật</button>
																	<!--<button class="button-dong-add-e">Đóng</button>-->
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
					</div>
				</div>
			</c:forEach>
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
	</script>
</body>

</html>
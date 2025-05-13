<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Loại Ghế</title>
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
    <div class="alert-flag" aType='${message.type}' aMessage="${message.message }"></div>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <%@include file="/WEB-INF/views/include/header_admin.jsp"%>
        <%@include file="/WEB-INF/views/include/aside.jsp"%>
        
        <div class="page-wrapper" style="min-height: 250px;">
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Seat Types</h4>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <div class="box-header">
                                <div>
                                    <h3 class="box-title">Seat Types Table</h3>
                                </div>
                                <div class="btn-add-e">
                                    <a href="#">
                                        <button class="button-header1-e" data-bs-toggle="modal" data-bs-target="#add-food">
                                            <i class="fa-solid fa-circle-exclamation" data-bs-toggle="modal" data-bs-target="#add-food"></i> Add New
                                        </button>
                                    </a>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="sortTable">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">No.</th>
                                            <th class="border-top-0">Seat Code</th>
                                            <th class="border-top-0">Seat Type Name</th>
                                            <th class="border-top-0">Seat Price</th>
                                            <th class="border-top-0">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="g" items="${lg}" varStatus="status">
                                            <tr>
                                                <td>${status.index +1}</td>
                                                <td>${g.idLoaiGhe }</td>
                                                <td>${g.tenLoai }</td>
                                                <td>${g.gia }</td>
                                                <td>
                                                    <a href="#">
                                                        <button class="button" data-bs-toggle="modal" data-bs-target="#t-${g.idLoaiGhe }">
                                                            <i class="fa-solid fa-pen-to-square"></i>
                                                        </button>
                                                    </a>
                                                    <a href="#">
                                                        <button class="button" data-bs-toggle="modal" data-bs-target="#e-${g.idLoaiGhe }" >
                                                            <i class="fa-solid fa-trash"></i>
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

            <c:forEach var="g" items="${lg}">
                <div class="modal fade" id="e-${g.idLoaiGhe}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm v-modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Click delete to remove the projection schedule</p>
                            </div>
                            <form method="post" modelAttribute="nhanVien" action="/DoAnWebCinema/admin/seat/delete/${g.idLoaiGhe}.htm">
                                <div class="modal-footer">
                                    <button type="submit" class="btn-green btn btn-primary">Delete</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="modal fade" id="add-food" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myCenterModalLabel"></h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                            <div class="row tm-edit-product-row">
                                                <div class="col-12">
                                                    <div class="header-add-e">
                                                        <h3 class="header-name-add-e">Add New Seat Type</h3>
                                                    </div>
                                                    <form class="container-add-e tm-edit-product-form" action="/DoAnWebCinema/admin/seat/add.htm" method="post" modelAttribute="seat">
                                                        <div class="body-add-e">
                                                            <div class="tieude1-add-e">
                                                                <span class="chitiet-left-add-e">Seat Type Name:</span>
                                                                <div class="input-add-e">
                                                                    <input type="text" name="tenLoai" class="input-name-add-e" required>
                                                                </div>
                                                            </div>
                                                            <div class="tieude1-add-e">
                                                                <span class="chitiet-left-add-e">Price:</span>
                                                                <div class="input-add-e">
                                                                    <input type="text" name="gia" class="input-name-add-e" required>
                                                                </div>
                                                            </div>

                                                            <div class="tieude-btn-add-e">
                                                                <button type="submit" class="button-add-add-e">Add New</button>
                                                                <button class="button-dong-add-e">Close</button>
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

            <c:forEach var="g" items="${lg}" varStatus="status">
                <div class="modal fade" id="t-${g.idLoaiGhe }" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myCenterModalLabel"></h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                                <div class="row tm-edit-product-row">
                                                    <div class="col-12">
                                                        <div class="header-add-e">
                                                            <h3 class="header-name-add-e">Edit Seat Type Information</h3>
                                                        </div>
                                                        <form class="container-add-e tm-edit-product-form" action="/DoAnWebCinema/admin/seat/update/${g.idLoaiGhe}.htm" method="post" modelAttribute="seatUpdate">
                                                            <div class="body-add-e">
                                                                <div class="tieude1-add-e">
                                                                    <span class="chitiet-left-add-e">Seat Type Code:</span>
                                                                    <div class="input-add-e">
                                                                        <input type="text" name="idLoaiGhe" class="input-name-add-e" value="${g.idLoaiGhe }" readonly />
                                                                    </div>
                                                                </div>
                                                                <div class="tieude1-add-e">
                                                                    <span class="chitiet-left-add-e">Seat Type Name:</span>
                                                                    <div class="input-add-e">
                                                                        <input type="text" name="tenLoai" class="input-name-add-e" value="${g.tenLoai }">
                                                                    </div>
                                                                </div>
                                                                <div class="tieude1-add-e">
                                                                    <span class="chitiet-left-add-e">Price:</span>
                                                                    <div class="input-add-e">
                                                                        <input type="text" name="gia" class="input-name-add-e" value="${g.gia }" readonly>
                                                                    </div>
                                                                </div>

                                                                <div class="tieude-btn-add-e">
                                                                    <button type="submit" class="button-add-add-e">Update</button>
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
        </div>
    </div>

    <script>
        $('#sortTable').DataTable();
    </script>
    <script src="http://localhost:9999/DoAnWebCinema/js/jquery.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/app-style-switcher.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/jquery.sparkline.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/waves.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/sidebarmenu.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/custom.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/chartist.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/chartist-plugin-tooltip.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/pages/dashboards/dashboard1.js"></script>
    <script src=" <c:url value='/js/alertify.min.js'/>"></script>

    <script type="text/javascript">
        if ($(".alert-flag").attr("aType")) {
            alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 5, function() {
                console.log('dismissed');
            });
            alertify.set('notifier', 'position', 'top-right');
        }
    </script>
</body>

</html>
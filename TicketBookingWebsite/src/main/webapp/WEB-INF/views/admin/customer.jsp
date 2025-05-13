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
    <title>Customer</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:9999/DoAnWebCinemaimgs/favicon.png">
    <!-- Custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <link href="http://localhost:9999/DoAnWebCinema/css/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/chartist-plugin-tooltip.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Custom CSS -->
    <link href="http://localhost:9999/DoAnWebCinema/css/style.min.css" rel="stylesheet">
    <link href="http://localhost:9999/DoAnWebCinema/css/employee.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/detail-test.css">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/fix-test.css">
    <!-- <link href="../css/add-employee.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
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

/* Customer photo styling */
img.img-fluid {
    border-radius: 50%;
    border: 3px solid #ddd;
}

/* Status label styling */
.status {
    font-size: 1.1rem;
    font-weight: bold;
    color: #28a745;
}

/* Container for info boxes */
.info-box {
    background-color: #f9f9f9;
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
        height: 120px;
    }
}
    
    	
    </style>
</head>

<body>
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
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
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
                        <h4 class="page-title">Khách Hàng</h4>
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
                                    <h3 class="box-title">Customer List</h3>
                                </div>
                                <div class="btn-add-e">
                                    <a href="#">
                                    <button class="button-header1-e" data-bs-toggle="modal"
                                        data-bs-target="#add-employee">
                                        <i class="fa-solid fa-circle-exclamation" data-bs-toggle="modal"
                                            data-bs-target="#add-employee"></i>
                                        Add
                                    </button>
                                    </a>

                                </div>
                            </div>


                            <div class="table-responsive">

                                <table class="table table-striped table-hover" id="sortTable">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">No.</th>
                                            <th class="border-top-0">Customer ID</th>
                                            <th class="border-top-0">Full Name</th>
                                            <th class="border-top-0">Phone Number</th>
                                            <th class="border-top-0">Gender</th>
                                            <th class="border-top-0">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="s" items="${kh}" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${s.maKH }</td>
                                            <td>${s.tenKH }</td>
                                            <td>${s.soDT }</td>
                                            <c:choose>
                                            	<c:when test="${s.gioiTinh == false}">
                                            		<td>Nữ</td>
                                            	</c:when>
                                            	<c:when test="${s.gioiTinh == true}">
                                            		<td>Nam</td>
                                            	</c:when>
                                            </c:choose>
                                            <td>

                                                <a href="#">
                                                    <button class="button" data-bs-toggle="modal"
                                                        data-bs-target="#show${s.maKH }">
                                                        <i class="fa-solid fa-circle-exclamation"></i>
                                                    </button>
                                                </a>
                                               
                                            </td>
                                        </tr>                            
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Popup model add employee  -->
                            <div class="modal fade" id="add-employee" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myCenterModalLabel">Add New Customer</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center"> -->
                                            <div class="row">
                                                <!-- <div class="col-12"> -->
                                                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                                    <div class="row tm-edit-product-row">
                                                        <!-- <div class="col-12"> -->
                                                        <!-- <div class="header-info">
                                                    <!-- <h3 class="header-name-info">Thông Tin Nhân Viên</h3> 
                                                </div> -->
                                                        <form class="contener1-fix">
                                                            <div class="body-full-fix">

                                                                <div class="body-fix">
                                                                    <div class="body-right-fix">
                                                                        <div class="photo-fix">
                                                                            <img src="http://localhost:9999/DoAnWebCinema/images/user.gif" alt="user" style="width: 200px;"/>
                                                                        </div>

                                                                        <div class="btn-fix">
                                                                            <button class="button-ma-fix">Add photo</button>
                                                                        </div>
                                                                        <div class="body-right-detail-info-fix">
                                                                            <p class="detail-info-top-left-fix">Status:</p>
                                                                            <div id="buttons-fix">
                                                                                <a href="#"
                                                                                    class="btn-f btn-solid-f">Active</a>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="body-left-fix">
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">Full Name
                                                                            </p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">Email</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">Phone</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">Address</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="same-fix">
                                                                            <div class="detail-info-fix-left">
                                                                                <p class="detail-info-top-fix">Date of Birth
                                                                                </p>
                                                                                <form class="input-date">
                                                                                    <input type="date" name="" id=""
                                                                                        class="input-name-fix">
                                                                                </form>
                                                                            </div>
                                                                            <div class="detail-info-fix-right">
                                                                                <p class="detail-info-top-fix">Gender
                                                                                </p>
                                                                                <div class="input-fix">
                                                                                    <input type="radio" name="" id="">Female
                                                                                    <input type="radio" name=""
                                                                                        id="">Male
                                                                                </div>
                                                                            </div>
                                                                        </div>




                                                                    </div>


                                                                </div>
                                                                <div class="body-botton-fix">
                                                                    <button class="button-fix-f">Save</button>
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
<!-- Popup info customer -->
<c:forEach var="s" items="${kh}">
    <div class="modal fade" id="show${s.maKH}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title">Customer Information</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Customer Image and Status -->
                            <div class="col-md-4 text-center">
                                <img src="http://localhost:9999/DoAnWebCinema/images/user.gif" alt="user" class="img-fluid rounded-circle mb-3" style="width: 150px; height: 150px; object-fit: cover;"/>
                                <button class="btn btn-outline-primary mb-3">Customer ID: ${s.maKH}</button>
                                <p class="status text-success">Active</p>
                            </div>
                            
                            <!-- Detailed Customer Information -->
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Customer Name</p>
                                            <h6 class="info-detail">${s.tenKH}</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Phone Number</p>
                                            <h6 class="info-detail">${s.soDT}</h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info-box">
                                            <p class="label">Date of Birth</p>
                                            <h6 class="info-detail"><fmt:formatDate value="${s.ngaySinh}" pattern="MM-dd-yyyy"/></h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="info-box">
                                            <p class="label">Gender</p>
                                            <h6 class="info-detail">
                                                <c:choose>
                                                    <c:when test="${s.gioiTinh == false}">Female</c:when>
                                                    <c:when test="${s.gioiTinh == true}">Male</c:when>
                                                </c:choose>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="info-box">
                                            <p class="label">Address</p>
                                            <h6 class="info-detail">${s.diaChi}</h6>
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
    <div class="modal fade" id="fix-employee" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myCenterModalLabel">Chỉnh Sửa Nhân Viên</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center"> -->
                    <div class="row">
                        <!-- <div class="col-12"> -->
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row tm-edit-product-row">
                                <!-- <div class="col-12"> -->
                                <!-- <div class="header-info">
                                                    <!-- <h3 class="header-name-info">Thông Tin Nhân Viên</h3> 
                                                </div> -->
                                <form class="contener1-fix">
                                    <div class="body-full-fix">

                                        <div class="body-fix">
                                            <div class="body-right-fix">
                                                <div class="photo-fix">
                                                    <i class="fa-solid fa-file-image"
                                                        onclick="document.getElementById('fileIput').click();"></i>
                                                </div>

                                                <div class="btn-fix">
                                                    <button class="button-ma-fix">Sửa Ảnh</button>
                                                </div>
                                                <div class="body-right-detail-info-fix">
                                                    <p class="detail-info-top-left-fix">Trạng Thái:</p>
                                                    <div id="buttons-fix">
                                                        <a href="#" class="btn-f btn-solid-f">Hoạt Động</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="body-left-fix">
                                                <li class="tieude-fix">
                                                    <span class="chitiet-left-fix">Mã Nhân Viên:</span>
                                                    <span class="chitiet-fix">1001</span>

                                                </li>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">Tên Nhân Viên</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">CMND</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">SĐT</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">Địa Chỉ</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="same-fix">
                                                    <div class="detail-info-fix-left">
                                                        <p class="detail-info-top-fix">Ngày Sinh</p>
                                                        <form class="input-date">
                                                            <input type="date" name="" id="" class="input-name-fix">
                                                        </form>
                                                    </div>
                                                    <div class="detail-info-fix-right">
                                                        <p class="detail-info-top-fix">Giới Tính</p>
                                                        <div class="input-fix">
                                                            <input type="radio" name="" id="">Nữ
                                                            <input type="radio" name="" id="">Nam
                                                        </div>
                                                    </div>
                                                </div>




                                            </div>


                                        </div>
                                        <div class="body-botton-fix">
                                            <button class="button-fix-f">Thêm Mới</button>
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
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End footer -->
    
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
  
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script>
        $('#sortTable').DataTable();
    </script>
    <script src="http://localhost:9999/DoAnWebCinema/js/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="http://localhost:9999/DoAnWebCinema/js/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/app-style-switcher.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="http://localhost:9999/DoAnWebCinema/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="http://localhost:9999/DoAnWebCinema/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="http://localhost:9999/DoAnWebCinema/js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="http://localhost:9999/DoAnWebCinema/js/chartist.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/chartist-plugin-tooltip.min.js"></script>
    <script src="http://localhost:9999/DoAnWebCinema/js/dashboard1.js"></script>
</body>

</html>
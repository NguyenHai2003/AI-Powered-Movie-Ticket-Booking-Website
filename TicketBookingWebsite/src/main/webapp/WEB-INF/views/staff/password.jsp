<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Set Password</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:9999/DoAnWebCinema/imgs/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="http://localhost:9999/DoAnWebCinema/css/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/chartist-plugin-tooltip.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="http://localhost:9999/DoAnWebCinema/css/style.min.css" rel="stylesheet">
    <link href="http://localhost:9999/DoAnWebCinema/css/employee.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/detail-test.css">
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/fix-test.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/alertify.min.css'/>" />
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
	
	<%@include file="/WEB-INF/views/include/aside_staff.jsp"%> 
	
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
						<h4 class="page-title">Change Password</h4>
						<%-- <div style="color: red;">${message }</div> --%>
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
                        
						<div class="card-body">
                                                <div class="row">
                                                <div class="ten">
                                                <form class="col-4 mx-auto pt-5 card" method="post" action="/DoAnWebCinema/admin/password.htm">
                                                        <div class="form-group col-md-12">
                                                            <label for="input-current-password"><b>Current Password</b></label>
                                                            <input type="password" name="oldPass" class="form-control"
                                                                id="input-current-password" required/>
                                                            ${message_o}
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="input-new-password"><b>Save Changes</b></label>
                                                            <input type="password" name="newPass" class="form-control"
                                                                id="input-new-password" required/>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="input-confirm-new-password"><b>Confirm New Password</b></label>
                                                            <input type="password" name="confirmPass"
                                                                class="form-control" id="input-confirm-new-password" required/>
                                                            ${message_n}
                                                        </div>

                                                        <div class="form-group col-12">
                                                            <button type="submit" name="btnpw"
                                                                class="btn btn-primary col-12" style="background-color: #0083f7; color: #fff; height: 35px; border: none00; border: none; border-radius: 5px;">
                                                                Save Changes
                                                            </button>
                                                        </div>
                                                    </form>
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
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
</div>
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

<script src="http://localhost:9999/DoAnWebCinema/js/pages/dashboards/dashboard1.js"></script>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	#navbarSupportedContent{
    		background-color: #2f323e;
    	}
    .logo-icon {
        width: 40px;
        margin-right: 10px;
    }

    .brand-text {
        font-size: 1.2rem;
        font-weight: bold;
        color: #e50914;
    }

    .navbar-brand:hover .brand-text {
        color: #f15b5b;
    }

    @media (max-width: 576px) {
        .navbar {
            padding: 0.5rem;
        }
        .brand-text {
            font-size: 1.25rem;
        }
    }
    </style>
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
					<nav class="navbar navbar-expand-lg navbar-light">
					    <div class="container">
					        <!-- Brand and logo -->
					        <a class="navbar-brand d-flex align-items-center" href="http://localhost:9999/DoAnWebCinema/admin/dashboard.htm">
					            <img src="http://localhost:9999/DoAnWebCinema/images/logocinema.png" alt="Tứ Trụ Cinema Logo" class="logo-icon" />
					            <span class="brand-text"><b>Tứ Trụ Cinema</b></span>
					        </a>
					    </div>
					</nav>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-none d-md-block d-lg-none">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white"
                                href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav ms-auto d-flex align-items-center">
	<li class="ms-auto">
    <p class="app-search d-none d-md-block me-3" style="color:white;"><b><i>Chi nhánh ${user.chiNhanh.tenChiNhanh}</i></b></p>
</li>

                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class=" in">
                            <form role="search" class="app-search d-none d-md-block me-3">
                                <input type="text" placeholder="Tìm kiếm..." class="form-control mt-0">
                                <a href="" class="active">
                                    <i class="fa fa-search"></i>
                                </a>
                            </form>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li>
                            <a class="profile-pic" href="#">
                                <img src="http://localhost:9999/DoAnWebCinema/images/user.gif" alt="user-img" width="36"
                                    class="img-circle"><span class="text-white font-medium">${user.tenNV}</span></a>
                        </li>
                        
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
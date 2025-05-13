<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Phòng Chiếu</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:9999/DoAnWebCinema/imgs/favicon.png">
    <!-- Custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                    <h4 class="page-title">Room</h4>
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
                                <h3 class="box-title">Room List</h3>
                            </div>
                            <div class="btn-add-e">
                                <a href="#">
                                    <button class="button-header1-e" data-bs-toggle="modal"
                                        data-bs-target="#add-employee">
                                        <i class="fa-solid fa-circle-exclamation" data-bs-toggle="modal"
                                            data-bs-target="#add-employee"></i>
                                        Add New
                                    </button>
                                </a>
                            </div>
                        </div>

<div class="table-responsive">

    <table class="table table-striped table-hover" id="sortTable">        
        <thead>
            <tr>
                <th class="border-top-0">S.No</th>
                <th class="border-top-0">Room Code</th>
                <th class="border-top-0">Total Seats</th>
                <th class="border-top-0">Status</th>
                <th class="border-top-0">Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${pc}" varStatus="status">
            <tr>
                <td>${status.index +1} </td>
                <td>${p.maPhong }</td>
                <td>${p.tongSoGhe}</td>
                <c:choose>
                    <c:when test="${p.trangThai == false}">
                        <td>Empty</td>
                    </c:when>
                    <c:when test="${p.trangThai == true}">
                        <td>In Use</td>
                    </c:when>
                </c:choose>
                <td>
                    </a> <a href="#">
                    <button class="button" data="${p.maPhong}" data-bs-toggle="modal"
                        data-bs-target="#f-${p.maPhong}">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </button>
                    </a>
                    <a href="#">
                    <button class="button" data-bs-toggle="modal"
                    data-bs-target="#e-${p.maPhong }" >
                        <i class="fa-solid fa-trash"></i>
                    </button>
                    </a>
                
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>

<!-- Add Room Modal -->
<div class="modal fade" id="add-employee" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h4 class="modal-title" id="myCenterModalLabel">Add New Room</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addRoomForm" class="container-add-e tm-edit-product-form" action="/DoAnWebCinema/admin/room/add.htm" method="post">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row tm-edit-product-row">
                            <!-- Seat rows list -->
                            <div id="seatRowsContainer-1" class="col-12 mb-3">
                                <label class="form-label"><b>Seat Rows</b></label>
                                <!-- Seat rows will be added here -->
                            </div>

                            <!-- Hidden fields to store number of seat rows and number of seats per row -->
                            <input type="hidden" id="totalRows" name="totalRows">
                            <input type="hidden" id="seatCountPerRow" name="seatCountPerRow">

                            <!-- Add seat row button -->
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" onclick="addSeatRow(1)">+ Add Seat Row</button>
                            </div>

                            <!-- Save and close buttons -->
                            <div class="col-12 mt-3">
                                <div class="tieude-btn-add-e">
                                    <button type="button" class="button-add-add-e" onclick="saveRoom(1)">Add New</button>
                                    <button type="button" class="button-dong-add-e" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





        <!-- Employee info popup -->
        <c:forEach var="p" items="${pc}">
    	<div class="modal fade" id="e-${p.maPhong}" tabindex="-1" role="dialog"
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

							<p>Confirm delete room ${p.maPhong}?</p>

						</div>
						<form method="post" modelAttribute="taiKhoan" action="/DoAnWebCinema/admin/room/delete/${p.maPhong}.htm">
							<div class="modal-footer">

								<button type="submit"
									class="btn-green btn btn-primary">OK</button>


							</div>
						</form>
					</div>
				</div>
			</div>
        </c:forEach>
        
<!-- Loop through rooms to create individual modals for each room -->
<c:forEach var="p" items="${pc}">
    <!-- Modal for Editing Room -->
    <div class="modal fade" id="f-${p.maPhong}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
						            <div class="modal-header bg-primary text-white">
						                <h4 class="modal-title" id="myCenterModalLabel">Edit Room</h4>
						                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						            </div>
                <div class="modal-body">
                    <!-- Room Name -->
                    <div class="mb-3">
                        <label for="roomName-1" class="form-label"><b>Room</b></label>
                        <input type="text" class="form-control" id="roomName-1" placeholder="Enter room name" value="${p.maPhong}">
                    </div>

                    <!-- Seat rows list -->
                    <div id="seatRowsContainer-1">
                        <label class="form-label"><b>Seat Rows</b></label>
                        <div class="row mb-2">
                            <div class="col-2">
                                <label class="form-label"><b>Row A</b></label>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control" placeholder="Seats in row A" value="10" min="1">
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="addSeatRow('1')">+ Add Seat Row</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success" onclick="saveRoom('1')">Save Changes</button>
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
</div>
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
	<script src=" <c:url value='/js/alertify.min.js'/>"></script>
	
	<script type="text/javascript">
		if ($(".alert-flag").attr("aType")) {
			console.log(1)
			alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 5, function() { console.log('dismissed'); });
			alertify.set('notifier', 'position', 'top-right');
		}
	</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    window.addSeatRow = function(maPhong) {
        const rowContainer = document.createElement('div');
        rowContainer.classList.add('row', 'mb-2');
        const seatRowsContainer = document.getElementById('seatRowsContainer-' + maPhong);
        const rowCounter = seatRowsContainer ? seatRowsContainer.querySelectorAll('.row').length : 0;

        if (rowCounter >= 26) {
            alert("The row limit (A-Z) has been reached. Cannot add more rows.");
            return;
        }
        const seatRowLabel = String.fromCharCode(65 + rowCounter); // A -> Z

        rowContainer.innerHTML = 
            '<div class="col-2">' +
                '<b><label class="form-label">Row ' + seatRowLabel + '</label></b>' +
            '</div>' +
            '<div class="col-4">' +
                '<input type="number" class="form-control seatCountInput" placeholder="Seats in row ' + seatRowLabel + '" min="1" required>' +
            '</div>';
        if (seatRowsContainer) {
            seatRowsContainer.appendChild(rowContainer);
        } else {
            console.error(`Could not find element with ID: seatRowsContainer-${maPhong}`);
        }
    };

    window.saveRoom = function(maPhong) {
        const seatRows = [];
        const seatRowsContainer = document.getElementById('seatRowsContainer-' + maPhong);
        if (!seatRowsContainer) {
            alert("Could not find seatRowsContainer element.");
            return;
        }

        seatRowsContainer.querySelectorAll('.row').forEach(row => {
            const label = row.querySelector('.form-label').textContent.trim();
            const seatCount = row.querySelector('input[type="number"]').value;

            if (seatCount && seatCount > 0) {
                seatRows.push({ label, seatCount });
            } else {
                alert("Seats in row " + label + " must be greater than 0.");
            }
        });

        if (seatRows.length === 0) {
            alert("Please add at least one seat row.");
            return;
        }

        // Update hidden fields with row data
        const totalRowsElement = document.getElementById('totalRows');
        const seatCountPerRowElement = document.getElementById('seatCountPerRow');
        
        if (totalRowsElement && seatCountPerRowElement) {
            totalRowsElement.value = seatRows.length;
            seatCountPerRowElement.value = seatRows.map(row => row.seatCount).join(',');
        } else {
            alert("Could not find hidden fields to update.");
            return;
        }

        // Submit the form
        document.getElementById('addRoomForm').submit();
    };
});
</script>

</body>

</html>

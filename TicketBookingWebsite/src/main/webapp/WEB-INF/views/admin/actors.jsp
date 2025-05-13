<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="admin, dashboard, director, movie, actors, revenue">
    <meta name="description" content="Director List Dashboard">
    <meta name="robots" content="noindex,nofollow">
    <title>Diễn viên</title>
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
    <link href="https://cdn.jsdelivr.net/npm/lightbox2@2.11.3/dist/css/lightbox.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/lightbox2@2.11.3/dist/js/lightbox.min.js"></script>
    
    <style>
        /* Adjust the page wrapper to avoid overlapping */
        .page-wrapper {
            margin-left: 250px; /* Adjust based on sidebar width */
            padding-top: 20px; /* Adjust to avoid header overlap */
        }
        .container-fluid {
            padding-left: 15px;
            padding-right: 15px;
        }
        
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
<!-- Main wrapper -->
<div id="main-wrapper">
    <!-- Topbar header -->
    <%@ include file="/WEB-INF/views/include/header_admin.jsp"%>
    <!-- Left Sidebar -->
    <%@ include file="/WEB-INF/views/include/aside.jsp"%>
    <!-- Page wrapper -->
    <div class="page-wrapper">
        <!-- Bread crumb -->
        <div class="page-breadcrumb bg-white">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Actors</h4>
                </div>
            </div>
        </div>

        <!-- Container fluid -->
        <div class="container-fluid">
            <!-- Table Content -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="box-header">
                            <div>
                                <h3 class="box-title">Actors Table</h3>
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
                                        <th class="border-top-0">No.</th>
                                        <th class="border-top-0">Actor Name</th>
                                        <th class="border-top-0">Image</th>
                                        <th class="border-top-0">Roles</th>
                                        <th class="border-top-0">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="actors" items="${dienvien}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${actors.tenDienVien}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty actors.anhDienVien}">
                                                        <a href="/DoAnWebCinema/uploads/${actors.anhDienVien}" data-lightbox="actors-gallery" data-title="${actors.tenDienVien}">
                                                            <img src="/DoAnWebCinema/uploads/${actors.anhDienVien}" alt="Actor Image" width="50" height="50" class="img-thumbnail">
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>Not Updated</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="#">
                                                    <button class="button" data-bs-toggle="modal" data-bs-target="#show${actors.idDienVien}">
                                                        <i class="fa-solid fa-circle-exclamation"></i>
                                                    </button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="#">
                                                    <button class="button" data-bs-toggle="modal" data-bs-target="#e-${actors.idDienVien}">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
<!-- Add Actor Modal -->
<div class="modal fade" id="add-employee" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h4 class="modal-title">Add New Actor</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <form action="/DoAnWebCinema/admin/actors/add.htm" method="POST" enctype="multipart/form-data" modelAttribute="dienVien">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Actor Image -->
                            <div class="col-md-4 text-center">
                                <img id="actors-image-preview" src="#" alt="Preview Image" class="img-fluid rounded-circle mb-3 actors-photo" style="width: 150px; height: 150px; object-fit: cover;"/>
                                <button type="button" class="btn btn-outline-primary mb-3" onclick="document.getElementById('file-upload-actors').click();">
                                    Add Image
                                </button>
                                <input id="file-upload-actors" type="file" accept="image/*" name="actorPhoto" style="display: none;" onchange="previewImage(event)"/>
                            </div>

                            <!-- Actor Information -->
                            <div class="col-md-8">
                                <div class="info-box">
                                    <p class="label">Actor Name</p>
                                    <input class="info-detail input-large" name="tenDienVien" required placeholder="Enter actor's name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="body-botton" style="text-align: center;">
                        <button class="button-add">Add New</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<c:forEach var="actors" items="${dienvien}" varStatus="status">
    <div class="modal fade" id="show${actors.idDienVien}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Actor's Roles List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Role Name</th>
                                <th>Movie Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iterate through the actor's roles -->
                            <c:forEach var="role" items="${actorRolesMap[actors.idDienVien]}" varStatus="roleStatus">
                                <tr>
                                    <td>${roleStatus.index + 1}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty role[0]}">
                                                ${role[0]}
                                            </c:when>
                                            <c:otherwise>
                                                <span>Not Updated</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${role[1]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<!-- Edit Actor Modal -->
<c:forEach var="actors" items="${dienvien}" varStatus="status">
    <div class="modal fade" id="e-${actors.getIdDienVien()}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title">Edit Actor</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <form action="/DoAnWebCinema/admin/actors/upload/${actors.getIdDienVien()}.htm" method="post" enctype="multipart/form-data" modelAttribute="dienvienUpdate">
                        <div class="container-fluid">
                            <div class="row">
                                <!-- Actor Image -->
                                <div class="col-md-4 text-center">
                                    <img id="actors-photo-${actors.getIdDienVien()}" src="/DoAnWebCinema/uploads/${actors.getAnhDienVien()}" alt="actors-photo" class="img-fluid rounded-circle mb-3 actors-photo"/>
                                    <button type="button" class="btn btn-outline-primary mb-3" onclick="document.getElementById('file-upload-actors-${actors.getIdDienVien()}').click();">
                                        Add Image
                                    </button>
                                    <input id="file-upload-actors-${actors.getIdDienVien()}" type="file" accept="image/*" name="actorsPhotoUpdate" style="display: none;" onchange="previewImage(event, 'actors-photo-${actors.getIdDienVien()}')"/>
                                </div>

                                <!-- Actor Information -->
                                <div class="col-md-8">
                                    <div class="info-box">
                                        <p class="label">Actor Name</p>
                                        <input class="info-detail input-large" name="tenDienVien" value="${actors.getTenDienVien()}" required />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <div class="body-botton"  style="text-align: center;">
                            <button class="button-add">Update</button>
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
        <!-- End of Table Content -->
    </div>
</div>
<!-- End Wrapper -->
<script>
function previewImage(event, previewId = 'actors-image-preview') {
    var reader = new FileReader();

    reader.onload = function() {
        var output = document.getElementById(previewId);
        output.src = reader.result; // Cập nhật đường dẫn ảnh đã chọn vào thẻ img
    };

    reader.readAsDataURL(event.target.files[0]);
}
</script>
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
<script src="http://localhost:9999/DoAnWebCinema/js/dashboard1.js"></script>
<script src="<c:url value='/js/alertify.min.js'/>"></script>
</body>
</html>

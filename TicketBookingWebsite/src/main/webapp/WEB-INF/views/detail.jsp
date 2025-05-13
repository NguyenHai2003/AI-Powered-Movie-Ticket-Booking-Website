<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost:9999/DoAnWebCinema/images/logo.svg" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/fonts/fontawesome-free-6.4.2-web/css/all.min.css" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/login.css" />
    <link rel="stylesheet" href="http://localhost:9999/DoAnWebCinema/css/search.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css" />
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .detail-movie-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 2rem;
            padding: 20px;
            border-radius: 10px;
            background: linear-gradient(135deg, #2b2b2b, #1e1e1e);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }
		.movie-poster {
		    max-width: 100%; /* Đảm bảo ảnh không vượt quá chiều rộng của phần tử cha */
		    height: auto; /* Đặt chiều cao tự động để giữ tỷ lệ */
		    border-radius: 10px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.7);
		}
        .movie-content {
            margin-top: 20px;
            text-align: center;
        }
        .product--name h3 {
            font-size: 2rem;
            margin-bottom: 10px;
            color: red;
        }
		.movie-detail {
		    font-size: 1.1rem;
		    margin-bottom: 20px;
		    line-height: 1.5;
		    text-align: justify;
		    max-width: 1000px;
		    margin-left: auto;
		    margin-right: auto;
		    padding: 0 15px;
		}
        .movie-info {
            list-style-type: none;
            padding: 0;
            margin: auto;
            font-size: 1rem;
            line-height: 1.8;
        }
        .movie-info-item {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            margin-left: 380px;
        }
        .col-left {
            font-weight: bold;
        }
        .btn-row {
            margin-top: 20px;
            margin-left: 380px;
        }
        .btn-wrap,
        .button {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            margin: 0 5px;
            transition: background-color 0.3s;
        }
        .btn-wrap {
            background-color: #28a745; /* màu xanh */
        }
        .btn-wrap:hover {
            background-color: #218838; /* màu xanh đậm khi hover */
        }
        .button {
            background-color: #007bff; /* màu xanh dương */
        }
        .button:hover {
            background-color: #0069d9; /* màu xanh dương đậm khi hover */
        }
       
               .rating-container {
            display: flex;
            cursor: pointer;
            margin-left: 300px;
        }
        .star {
            font-size: 40px;
            color: #ccc;
            display: inline-block;
            padding: 10px;
            transition: color 0.2s ease-in-out;
        }

        /* Màu vàng chỉ áp dụng cho các ngôi sao được chọn */
        .star.selected {
            color: red;
        }

        p {
            margin-top: 20px;
            font-size: 24px;
        }
        
        .btn-send{
            background-color: #28a745;
        	padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            margin: 0 5px;
            transition: background-color 0.3s;
        }
        
         .btn-send:hover {
            background-color: #218838;
        }
        
          /* Cấu hình cho modal */
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.5);
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		/* Nội dung modal */
		.modal-content {
		  background-color: #fff;
		  padding: 20px 40px;
		  border-radius: 8px; /* Bo góc */
		  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
		  max-width: 400px;
		  width: 80%;
		  text-align: center;
		}
		
		/* Nút đóng modal */
		.close-btn {
		  color: #aaa;
		  font-size: 30px;
		  font-weight: bold;
		  position: absolute;
		  top: 10px;
		  right: 15px;
		  cursor: pointer;
		}
		
		/* Chỉnh sửa khi hover vào nút đóng */
		.close-btn:hover,
		.close-btn:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		/* Khi modal được mở, làm cho nó dễ nhìn hơn */
		.modal p {
		  font-size: 18px;
		  margin: 0;
		  padding: 10px;
		  font-weight: 500;
		  color: #333;
		}
          
    </style>
</head>

<body>
    <div class="main-container">
        <%@include file="/WEB-INF/views/header.jsp"%>
    </div>
    <div class="detail-movie-container">
        <img class="movie-poster" src="/DoAnWebCinema/uploads/${phim.getLinkAnh() }" alt="${phim.getTenPhim()} Poster" style="width: 70%; height: auto; object-fit: cover;">
        <div class="movie-content">
            <div class="product--name">
                <h3>${phim.getTenPhim()}</h3>
            </div>
            <div class="movie-info">
       			<c:choose>
       			<c:when test="${phim.getDiem() == null}">
		            <span class="col_red me-3">No reviews from customers yet!</span>
		        </c:when>
				<c:when test="${phim.getDiem() < 1}">
             		<span class="col_red me-3">
                		<i class="fa fa-star-half-o"></i>                  					
                	</span>
				</c:when>
				<c:when test="${phim.getDiem() < 2}">
              		<span class="col_red me-3">
                   		<i class="fa fa-star"></i>
               		</span>
				</c:when>
				<c:when test="${phim.getDiem() < 3}">
              		<span class="col_red me-3">
                   		<i class="fa fa-star"></i>
                   		<i class="fa fa-star"></i>
               		</span>
				</c:when>
				<c:when test="${phim.getDiem() < 4}">
              		<span class="col_red me-3">
                  		<i class="fa fa-star"></i>
                  		<i class="fa fa-star"></i>
                  		<i class="fa fa-star"></i>
               		</span>
				</c:when>
				<c:when test="${phim.getDiem() < 4.5}">
              		<span class="col_red me-3">
                   		<i class="fa fa-star"></i>
                   		<i class="fa fa-star"></i>
                   		<i class="fa fa-star"></i>
                   		<i class="fa fa-star"></i>
               		</span>
				</c:when>
				<c:when test="${phim.getDiem() < 5}">
              		<span class="col_red me-3">
                 		<i class="fa fa-star"></i>
                 		<i class="fa fa-star"></i>
                 		<i class="fa fa-star"></i>
                 		<i class="fa fa-star"></i>
                 		<i class="fa fa-star-half-o"></i> 
               		</span>
				</c:when>
				<c:otherwise>
                    <span class="col_red me-3">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
				</c:otherwise>
			</c:choose>
              			    <c:if test="${phim.getDiem() != null}">
		        ${phim.getDiem()}/5 (Rate)
		    </c:if>
            </div>
            <div class="rating-container">
			    <span class="star" data-value="1">&#9733;</span>
			    <span class="star" data-value="2">&#9733;</span>
			    <span class="star" data-value="3">&#9733;</span>
			    <span class="star" data-value="4">&#9733;</span>
			    <span class="star" data-value="5">&#9733;</span>
			    <p id="rating-value" style="margin-left: 50px; margin-top: 30px;">
			        Your Rating: <span id="current-rating">${ratingScore}</span>
			    </p>
			</div>
			<form id="ratingForm" action="/DoAnWebCinema/film/detail/ma=${phim.getMaPhim()}.htm" method="POST">
			    <input type="hidden" id="ratingInput" name="rating" value="${ratingScore}">
			    <input type="hidden" id="maPhimInput" name="maPhim" value="">
			    <button class="btn-send" id="btn-send" type="button">Send</button>
			</form>

            <br><br>
            <div class="movie-detail">${phim.getMoTa()}</div>
            <ul class="movie-info">
                <li class="movie-info-item">
                    <span class="col-left">Director:</span>
                    <span class="col-right">${phim.getDaoDien().getTenDaoDien()}</span>
                </li>
                <li class="movie-info-item">
                	<span class="col-left">Cast:</span>
                	<span class="col-right">
                				           	<c:if test="${not empty phim.vaiDiens}">
				        <c:forEach var="chiTietdienvien" items="${phim.vaiDiens}" varStatus="status">
				            <c:out value="${chiTietdienvien.getDienVien().tenDienVien}" />
				            <c:if test="${!status.last}">, </c:if>
				        </c:forEach>
				    </c:if>
                	</span>
                </li>
                <li class="movie-info-item">
                    <span class="col-left">Genre:</span>
                    <span class="col-right">
                        <c:if test="${not empty phim.chiTietTheLoais}">
                            <c:forEach var="chiTiet" items="${phim.chiTietTheLoais}" varStatus="status">
                                <c:out value="${chiTiet.theLoai.tenTL}" />
                                <c:if test="${!status.last}">, </c:if>
                            </c:forEach>
                        </c:if>
                    </span>
                </li>
                <li class="movie-info-item">
                    <span class="col-left">Release:</span>
                    <span class="col-right">${phim.getNgayKhoiChieu()}</span>
                </li>
                <li class="movie-info-item">
                    <span class="col-left">Duration:</span>
                    <span class="col-right">${phim.getThoiLuong()} mins</span>
                </li>
                <li class="movie-info-item">
                    <span class="col-left">Language:</span>
                    <span class="col-right">${phim.getNuocSX()}</span>
                </li>
            </ul>
            <div class="btn-row">
                <a class="btn-wrap" href="${phim.getLinkTrailer()}" data-fancybox="video" data-caption="${phim.getTenPhim()} Trailer">Trailer</a>
                <a class="button" id="dat-ve-link" href="#">Book Now</a>
            </div>
        </div>
    </div>
<div id="successModal" class="modal">
  <div class="modal-content">
    <span class="close-btn" id="closeModal">&times;</span>
    <p style="color:black;">Your rating has been successfully saved!</p>
	<p style="color:black;">Thank you for rating the movie!</p>
  </div>
</div>
<script>
	const stars = document.querySelectorAll('.star');
	const ratingValue = document.getElementById('rating-value');
	const currentRating = parseInt(document.getElementById('current-rating').textContent, 10);
	
	stars.forEach((star, index) => {
	    if (index < currentRating) {
	        star.classList.add('selected');
	    }
	    star.addEventListener('click', handleClick);
	});
	
	function handleClick(event) {
	    const clickedStarValue = event.target.getAttribute('data-value');
	    stars.forEach((star) => {
	        star.classList.remove('selected');
	    });
	
	    for (let i = 0; i < clickedStarValue; i++) {
	        stars[i].classList.add('selected');
	    }
	
	    ratingValue.textContent = 'Điểm đánh giá của bạn: ' + clickedStarValue;
	    document.getElementById('ratingInput').value = clickedStarValue;
	}
	
	document.getElementById('btn-send').addEventListener('click', function() {
	    const rating = document.querySelectorAll('.star.selected').length;
	    const maPhim = ${phim.getMaPhim()};
	    document.getElementById('ratingInput').value = rating;
	    document.getElementById('maPhimInput').value = maPhim;

	    const formData = new FormData(document.getElementById('ratingForm'));
	    fetch('/DoAnWebCinema/saveRating.htm', {
	        method: 'POST',
	        body: formData
	    })
	    .then(response => response.text())
	    .then(data => {
	        document.getElementById('successModal').style.display = "flex";
	    })
	    .catch(error => {
	        alert('An error occurred while saving the review. Please try again.');
	        console.error('Error:', error);
	    });
	});
	
	document.getElementById('closeModal').addEventListener('click', function() {
	    document.getElementById('successModal').style.display = "none";
	});
</script>

<script>
    // Lấy ngày hiện tại
    var curDate = new Date();
    var date = curDate.getDate();
    var month = curDate.getMonth() + 1; // Tháng bắt đầu từ 0
    var year = curDate.getFullYear();

    // Định dạng ngày theo định dạng yyyy-mm-dd
    var formattedDate = year + '-' + (month < 10 ? '0' + month : month) + '-' + (date < 10 ? '0' + date : date);

    // Cập nhật liên kết href
    var link = document.getElementById('dat-ve-link');
    if (link) { // Kiểm tra xem phần tử có tồn tại không
        link.href = '/DoAnWebCinema/datve/' + formattedDate + '.htm?chinhanh=1';
    }
</script>

<!-- Chỉ giữ lại một phiên bản đầy đủ của jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
<script src="http://localhost:9999/QuanLyRapChieuPhim/resources/js/script.js"></script>
</body>

</html>

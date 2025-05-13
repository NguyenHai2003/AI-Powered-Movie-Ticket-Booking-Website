
   <header class="p-3 bg-dark text-white">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <img class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"
                    src="http://localhost:9999/QuanLyRapChieuPhim/resources/assets/brand/logo.png" width="45" height="45" alt="Lỗi tải file">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="http://localhost:9999/QuanLyRapChieuPhim/" class="nav-link px-2 text-secondary">Trang chủ</a></li>
                    <li><a href="http://localhost:9999/QuanLyRapChieuPhim/film/showing.htm" class="nav-link px-2 text-white">Phim</a></li>
                    <!--<li><a href="#" class="nav-link px-2 text-white">Thức ăn</a></li>
                    <li><a href="../phim/movie-detail.html" class="nav-link px-2 text-white">Vé của tôi</a></li>-->
                </ul>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="/QuanLyRapChieuPhim/search.htm">
                    <input type="search" class="form-control form-control-dark" placeholder="Tìm kiếm..." name="search"
                        aria-label="Search">
                </form>
                <div class="text-end">

                    <div class="header-action-2">
                        <div class="header-action-icon-2 view-user">
                            <a href="account.htm" style="color: #fff;"> <i class="fa-regular fa-circle-user"></i>
                            </a>
                            <div class="cart-dropdown-wrap cart-dropdown-hm2" style="width: 240px; padding: 10px">
                                <ul>
                                    <li class=""><a href="/QuanLyRapChieuPhim/customer/account.htm">${user.tenKH}
                                        </a></li>
                                    <!--<li><a style="color: #39317a;"><i class="fa-regular fa-ballot-check"></i>Đơn
                                            mua</a></li>-->
                                    <li><a style="color: #39317a;" href="http://localhost:9999/QuanLyRapChieuPhim/login.htm"> <i
                                                class="fa-regular fa-arrow-right-from-bracket"></i>Đăng
                                            xuất
                                        </a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
</header>
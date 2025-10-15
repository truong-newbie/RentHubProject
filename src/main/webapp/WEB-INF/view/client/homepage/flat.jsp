<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cho thuê nhà trọ, phòng trọ giá rẻ, mới nhất - TRỢ MỐI</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/resources/css/client/styles.css" rel="stylesheet" type="text/css">

</head>
<body>
<!-- Header -->
<%--<header class="navbar-custom">--%>
<%--    <div class="container">--%>
<%--        <div class="d-flex justify-content-between align-items-center">--%>
<%--            <div class="logo">--%>
<%--                <i class="fas fa-home"></i> TRỢ MỐI--%>
<%--            </div>--%>
<%--            <nav class="nav-links d-none d-lg-flex">--%>
<%--                <a href="#homes">Nhà trọ, phòng trọ</a>--%>
<%--                <a href="#needed">Nhà nguyên căn</a>--%>
<%--                <a href="#want">Căn hộ</a>--%>
<%--                <a href="#review">Video Review</a>--%>
<%--                <a href="#blog">Blog</a>--%>
<%--            </nav>--%>
<%--            <div class="d-flex gap-2 align-items-center">--%>
<%--                <a href="#login" class="nav-auth-link">--%>
<%--                    <i class="fas fa-sign-in-alt"></i> Đăng nhập--%>
<%--                </a>--%>
<%--                <a href="#register" class="nav-auth-link">--%>
<%--                    <i class="fas fa-user-plus"></i> Đăng ký--%>
<%--                </a>--%>
<%--                <a href="#" class="btn-dang-tin">Đăng tin</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>

<jsp:include page="../layout/header.jsp"/>
<!-- Search Section -->
<section class="search-section">
    <div class="container">
        <div class="search-box">
            <input type="text" class="search-input" placeholder="Bạn muốn tìm trở ở đâu?">
            <select class="search-select">
                <option value="">Nhà trọ, phòng trọ</option>
                <option value="nguyen-can">Nhà nguyên căn</option>
                <option value="can-ho">Căn hộ</option>
            </select>
            <select class="search-select">
                <option value="">Mức giá</option>
                <option value="1">Dưới 1 triệu</option>
                <option value="2">1 - 2 triệu</option>
                <option value="3">2 - 3 triệu</option>
                <option value="4">3 - 5 triệu</option>
                <option value="5">Trên 5 triệu</option>
            </select>
            <button class="btn-search">
                <i class="fas fa-search"></i> Tìm kiếm
            </button>
        </div>
    </div>
</section>

<!-- Breadcrumb -->
<div class="container">
    <div class="breadcrumb-custom">
        <a href="#" style="color: var(--primary-color); text-decoration: none;">Trang chủ</a> /
        <span>Nhà trọ, phòng trọ</span>
    </div>
</div>

<!-- Main Content -->
<div class="container content-wrapper">
    <h1 class="page-title">CHO THUÊ NHÀ TRỌ, PHÒNG TRỌ GIÁ RẺ, MỚI NHẤT</h1>

    <div class="row">
        <!-- Filter Sidebar -->
        <div class="col-lg-3">
            <div class="filter-sidebar">
                <div class="filter-title">
                    <i class="fas fa-filter"></i> Lọc tìm kiếm
                </div>

                <!-- Diện tích -->
                <div class="filter-section">
                    <div class="filter-section-title">
                        Diện tích
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="area1" name="area" value="0-20">
                        <label for="area1">Dưới 20 m2</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="area2" name="area" value="20-40">
                        <label for="area2">20-40 m2</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="area3" name="area" value="40-60">
                        <label for="area3">40-60 m2</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="area4" name="area" value="60-80">
                        <label for="area4">60-80 m2</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="area5" name="area" value="80+">
                        <label for="area5">Trên 80 m2</label>
                    </div>
                </div>

                <!-- Tiện nghi -->
                <div class="filter-section">
                    <div class="filter-section-title">
                        Tiện nghi
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity1" name="amenity" value="gac-lung">
                        <label for="amenity1">Gác lửng</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity2" name="amenity" value="wifi">
                        <label for="amenity2">Wifi</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity3" name="amenity" value="ve-sinh-trong">
                        <label for="amenity3">Vệ sinh trong</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity4" name="amenity" value="phong-tam">
                        <label for="amenity4">Phòng tắm</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity5" name="amenity" value="binh-nong-lanh">
                        <label for="amenity5">Bình nóng lạnh</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity6" name="amenity" value="ke-bep">
                        <label for="amenity6">Kệ bếp</label>
                    </div>
                    <button class="show-more-btn">Hiển thị thêm</button>
                </div>

                <!-- Môi trường xung quanh -->
                <div class="filter-section">
                    <div class="filter-section-title">
                        Môi trường xung quanh
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env1" name="environment" value="cho">
                        <label for="env1">Chợ</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env2" name="environment" value="sieu-thi">
                        <label for="env2">Siêu thị</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env3" name="environment" value="benh-vien">
                        <label for="env3">Bệnh viện</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env4" name="environment" value="truong-hoc">
                        <label for="env4">Trường học</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env5" name="environment" value="cong-vien">
                        <label for="env5">Công viên</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env6" name="environment" value="ben-xe">
                        <label for="env6">Bến xe bus</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env7" name="environment" value="gym">
                        <label for="env7">Trung tâm thể dục thể thao</label>
                    </div>
                </div>

                <!-- Đối tượng -->
                <div class="filter-section">
                    <div class="filter-section-title">
                        Đối tượng
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target1" name="target" value="di-hoc">
                        <label for="target1">Đi học</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target2" name="target" value="di-lam">
                        <label for="target2">Đi làm</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target3" name="target" value="gia-dinh">
                        <label for="target3">Gia đình</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target4" name="target" value="cap-doi">
                        <label for="target4">Cặp đôi</label>
                    </div>
                </div>

                <!-- Video Review -->
                <div class="filter-section">
                    <div class="filter-section-title">
                        Video Review
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="video1" name="video" value="co-video">
                        <label for="video1">Có video review</label>
                    </div>
                </div>

                <!-- Filter Actions -->
                <div class="filter-actions">
                    <button class="btn-apply-filter">Tìm ngay</button>
                    <button class="btn-clear-filter">Xoá bộ lọc</button>
                </div>
            </div>
        </div>

        <!-- Listings -->
        <div class="col-lg-9">
            <div class="listings-header">
                <div class="total-results">Tổng <strong>3.885</strong> kết quả</div>
                <select class="sort-select">
                    <option value="newest">Mới nhất</option>
                    <option value="price-asc">Giá thấp đến cao</option>
                    <option value="price-desc">Giá cao đến thấp</option>
                    <option value="area-asc">Diện tích nhỏ đến lớn</option>
                    <option value="area-desc">Diện tích lớn đến nhỏ</option>
                </select>
            </div>

            <c:forEach var="flat" items="${flats}">
                <div class="listing-card">
                    <div class="listing-image">
                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/${flat.images[0]}" alt="Căn hộ">
                        <span class="hot-badge">HOT</span>
                        <div class="review-badge">
                            <i class="fas fa-play-circle"></i> Review
                        </div>
                        <button class="favorite-btn">
                            <i class="far fa-heart" style="color: #FF4444;"></i>
                        </button>
                    </div>
                    <div class="listing-content">
                        <h3 class="listing-title">${flat.title}</h3>
                        <div class="listing-price">Từ ${flat.price} triệu/tháng</div>
                        <span class="listing-type">${flat.rentalType}</span>
                        <div class="listing-location">
                            <i class="fas fa-map-marker-alt"></i>
                            ${flat.address}
                        </div>
                    </div>
                </div>
            </c:forEach>


            <!-- Pagination -->
            <nav aria-label="Page navigation" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Trước</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                    <li class="page-item"><a class="page-link" href="#">194</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Sau</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>
<!-- Bootstrap JS (bundle includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


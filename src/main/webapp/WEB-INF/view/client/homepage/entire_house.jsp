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
    <link href="${pageContext.request.contextPath}/resources/css/menuclient/styles.css" rel="stylesheet" type="text/css">

</head>
<body>

<jsp:include page="../layout/header.jsp"/>
<form method="get" action="/flat">
<!-- Search Section -->
<section class="search-section">
    <div class="container">
        <div class="search-box">
            <input type="text" class="search-input" placeholder="Bạn muốn tìm trở ở đâu?">
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
    <h1 class="page-title">CHO THUÊ NHÀ NGUYÊN CĂN GIÁ RẺ, MỚI NHẤT</h1>

    <div class="row">
        <!-- Filter Sidebar -->
        <!-- Filter Sidebar -->
        <div class="col-lg-3">
            <div class="filter-sidebar">
                <div class="filter-title">
                    <i class="fas fa-filter"></i> Lọc tìm kiếm
                </div>

                <!-- Diện tích -->
                <div class="filter-section">
                    <div class="filter-section-title">Diện tích</div>
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

                <!-- TIỆN NGHI -->
                <div class="filter-section">
                    <div class="filter-section-title">Tiện nghi</div>

                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity1" name="amenity" value="MEZZANINE">
                        <label for="amenity1">Gác lửng</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity2" name="amenity" value="WIFI">
                        <label for="amenity2">Wifi</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity3" name="amenity" value="PRIVATE_WC">
                        <label for="amenity3">Vệ sinh trong</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity4" name="amenity" value="BATHROOM">
                        <label for="amenity4">Phòng tắm</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity5" name="amenity" value="WATER_HEATER">
                        <label for="amenity5">Bình nóng lạnh</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity6" name="amenity" value="KITCHEN_SHELF">
                        <label for="amenity6">Kệ bếp</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity7" name="amenity" value="WASHING_MACHINE">
                        <label for="amenity7">Máy giặt</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity8" name="amenity" value="TV">
                        <label for="amenity8">Tivi</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity9" name="amenity" value="AC">
                        <label for="amenity9">Điều hòa</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity10" name="amenity" value="FRIDGE">
                        <label for="amenity10">Tủ lạnh</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity11" name="amenity" value="BED">
                        <label for="amenity11">Giường nệm</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="amenity12" name="amenity" value="WARDROBE">
                        <label for="amenity12">Tủ quần áo</label>
                    </div>
                </div>

                <!-- MÔI TRƯỜNG XUNG QUANH -->
                <div class="filter-section">
                    <div class="filter-section-title">Môi trường xung quanh</div>

                    <div class="filter-checkbox">
                        <input type="checkbox" id="env1" name="environment" value="MARKET">
                        <label for="env1">Chợ</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env2" name="environment" value="SUPERMARKET">
                        <label for="env2">Siêu thị</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env3" name="environment" value="HOSPITAL">
                        <label for="env3">Bệnh viện</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env4" name="environment" value="SCHOOL">
                        <label for="env4">Trường học</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env5" name="environment" value="PARK">
                        <label for="env5">Công viên</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env6" name="environment" value="BUS_STOP">
                        <label for="env6">Bến xe bus</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="env7" name="environment" value="SPORT_CENTER">
                        <label for="env7">Trung tâm thể dục thể thao</label>
                    </div>
                </div>

                <!-- ĐỐI TƯỢNG -->
                <div class="filter-section">
                    <div class="filter-section-title">Đối tượng</div>

                    <div class="filter-checkbox">
                        <input type="checkbox" id="target1" name="target" value="HOC_SINH">
                        <label for="target1">Đi học</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target2" name="target" value="DI_LAM">
                        <label for="target2">Đi làm</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target3" name="target" value="GIA_DINH">
                        <label for="target3">Gia đình</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="target4" name="target" value="CAP_DOI">
                        <label for="target4">Cặp đôi</label>
                    </div>
                </div>

                <!-- ACTION -->
                <div class="filter-actions">
                    <button class="btn-apply-filter">Tìm ngay</button>
                    <button type="reset" class="btn-clear-filter">Xoá bộ lọc</button>
                </div>
            </div>
        </div>


        <!-- Listings -->
        <div class="col-lg-9">



            <c:if test="${empty entireHouses}">
                <div class="alert alert-warning text-center" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i> Hiện tại chưa có bài đăng nhà nguyên căn nào .
                </div>
            </c:if>
            <c:if test="${not empty entireHouses}">
                <div class="row g-3">
                    <c:forEach var="entireHouse" items="${entireHouses}">
                        <div class="listing-card">
                            <div class="listing-image">
                                <img src="${pageContext.request.contextPath}/resources/images/roomImages/${entireHouse.images[0]}" alt="Nhà nguyên căn">
                                <span class="hot-badge">HOT</span>
                                <div class="review-badge">
                                    <i class="fas fa-play-circle"></i> Review
                                </div>
                                <button class="favorite-btn">
                                    <i class="far fa-heart" style="color: #FF4444;"></i>
                                </button>
                            </div>
                            <div class="listing-content">
                                <a href="room/${entireHouse.id}" class="listing-title"> ${entireHouse.title}</a>
                                <div class="listing-price">Từ ${entireHouse.price} triệu/tháng</div>
                                <span class="listing-type">${entireHouse.rentalType}</span>
                                <div class="listing-location">
                                    <i class="fas fa-map-marker-alt"></i>
                                        ${entireHouse.address}
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>        <table class="table table-bordered table-hover bg-white">
            </table>
            </c:if>
            <c:if test="${totalPages > 0}">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="${1 eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/entirehouse/?page=${currentPage -1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                            <li class="page-item"><a
                                    class="${loop.index+1 eq currentPage ? 'active page-link': 'page-link'}"
                                    href="/entirehouse/?page=${loop.index+1}">${loop.index +1}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="${totalPages eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/entirehouse/?page=${currentPage +1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>

        </div>
    </div>
</div>
</form>
<!-- Footer -->
<jsp:include page="../layout/footer.jsp"/>
<!-- Bootstrap JS (bundle includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


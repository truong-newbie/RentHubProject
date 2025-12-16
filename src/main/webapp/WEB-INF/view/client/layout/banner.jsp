<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="hero-content">
                    <h1>TÌM NHANH, TÌM KIẾM TRỌ TOÀN QUỐC</h1>
                    <p>Trang thông tin và cho thuê phòng trọ nhanh chóng, hiệu quả với hơn 500 tin đăng mới và 30.000 lượt xem mỗi ngày</p>
                </div>
            </div>
        </div>

        <!-- Tabs and Search -->
        <div class="hero-tabs">
            <button class="active">Tất cả</button>
            <button>Nhà trọ, phòng trọ</button>
            <button>Nhà nguyên căn</button>
            <button>Căn hộ</button>
        </div>

        <div class="search-box">
            <form action="${pageContext.request.contextPath}/" method="get"
                  class="d-flex gap-2 w-100">

                <!-- Từ khóa / địa điểm -->
                <input type="text"
                       name="keyword"
                       value="${param.keyword}"
                       placeholder="Bạn muốn tìm ở đâu?"
                       class="form-control flex-grow-1">

                <!-- Mức giá -->
                <select name="priceRange" class="form-select" style="flex: 0 0 150px;">
                    <option value="">Mức giá</option>
                    <option value="1" ${param.priceRange=='1'?'selected':''}>Dưới 2 triệu</option>
                    <option value="2" ${param.priceRange=='2'?'selected':''}>2 - 5 triệu</option>
                    <option value="3" ${param.priceRange=='3'?'selected':''}>Trên 5 triệu</option>
                </select>

                <!-- Diện tích -->
                <select name="areaRange" class="form-select" style="flex: 0 0 150px;">
                    <option value="">Diện tích</option>
                    <option value="1" ${param.areaRange=='1'?'selected':''}>Dưới 20m²</option>
                    <option value="2" ${param.areaRange=='2'?'selected':''}>20 - 30m²</option>
                    <option value="3" ${param.areaRange=='3'?'selected':''}>Trên 30m²</option>
                </select>

                <!-- Submit -->
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-search"></i> Tìm kiếm
                </button>
            </form>
        </div>

    </div>
</section>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${room.title}</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background: #f6f7f9; }
        .room-title { font-size: 26px; font-weight: 600; }
        .price-text { color: #ff4d4f; font-size: 22px; font-weight: 700; }
        .info-box { padding: 15px; border-radius: 10px; background: #fff; }
        .section-title { font-size: 20px; font-weight: 600; margin-top: 25px; }
        .feature-item { margin-bottom: 8px; }
        .thumb-img { width: 100%; border-radius: 10px; }
    </style>
</head>

<body>
<div class="container mt-4">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
            <li class="breadcrumb-item active">${room.title}</li>
        </ol>
    </nav>

    <!-- Title -->
    <div class="d-flex justify-content-between align-items-center">
        <div class="room-title">${room.title}</div>

        <div>
            <button class="btn btn-outline-secondary"><i class="bi bi-share"></i></button>
            <button class="btn btn-outline-danger"><i class="bi bi-heart"></i></button>
        </div>
    </div>

    <!-- Address -->
    <p class="text-muted">
        <i class="bi bi-geo-alt"></i> ${room.address}

    </p>

    <!-- Image Section -->
    <div class="row g-3 mt-2">

        <c:forEach var="room" items="${room.images}">
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/resources/images/roomImages/${room}" class="thumb-img" alt="">
            </div>
        </c:forEach>

    </div>

    <!-- Price + Summary -->
    <div class="row mt-4">
        <div class="col-md-8">
            <div class="info-box">

                <p class="price-text">${room.price} triệu /tháng </p>

                <div class="row text-muted">
                    <div class="col-md-4 mb-2">
                        <i class="bi bi-building"></i> Chủ trọ: ${room.ownerName}
                    </div>
                    <div class="col-md-4 mb-2">
                        <i class="bi bi-door-open"></i> ${room.roomNumber} phòng
                    </div>
                    <div class="col-md-4 mb-2">
                        <i class="bi bi-aspect-ratio"></i> Khoảng ${room.area} m²
                    </div>
                </div>

                <div class="mt-3">
                    <button class="btn btn-warning">
<%--                        <i class="bi bi-telephone"></i> Liên hệ zalo --%>
                        <a href="/zalo.me/${room.roomNumber}" class="bi bi-telephone">Liên hệ Zalo</a>
                    </button>
                </div>

            </div>
        </div>
    </div>

    <!-- Description -->
    <div class="section-title">Giới thiệu</div>
    <div class="info-box">
        <pre>
            ${room.description}
        </pre>
    </div>


    <!-- Đối tượng phù hợp -->
    <div class="section-title">Đối tượng</div>
    <div class="info-box">
        <ul>
                        <c:forEach items="${room.tenantType}" var="item">
                            <li>${item}</li>
                        </c:forEach>

        </ul>
    </div>

    <!-- Tiện nghi -->
    <div class="section-title">Tiện nghi</div>
    <div class="info-box">
            <c:forEach items="${room.amenities}" var="item">
                <div class="col-md-3 feature-item">
                    <i class="bi bi-check-circle"></i> ${item}
                </div>
            </c:forEach>
    </div>

    <!-- Môi trường xung quanh -->
    <div class="section-title">Môi trường xung quanh</div>
    <div class="info-box">
            <c:forEach items="${room.neighborhood}" var="item">
                <div class="col-md-3 feature-item">
                    <i class="bi bi-geo"></i> ${item}
                </div>
            </c:forEach>

    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</body>
</html>

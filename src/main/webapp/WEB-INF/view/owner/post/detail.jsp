<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${room.title}</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            background: #f5f6f8;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }

        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            padding: 2rem;
        }

        .room-title {
            font-size: 28px;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 0.5rem;
        }

        .room-address {
            color: #666;
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .gallery-section {
            margin: 2rem 0;
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1rem;
        }

        .gallery-item {
            position: relative;
            padding-bottom: 75%;
            border-radius: 10px;
            overflow: hidden;
            background: #f0f0f0;
        }

        .gallery-item img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .price-card {
            background: #fff;
            border: 1px solid #e5e5e5;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .price-text {
            color: #e63946;
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 1.5rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .info-item i {
            font-size: 20px;
            color: #666;
        }

        .info-item-text {
            font-size: 14px;
            color: #666;
        }

        .info-item-value {
            font-weight: 600;
            color: #1a1a1a;
            font-size: 15px;
        }

        .contact-btn {
            background: #0084ff;
            border: none;
            color: white;
            padding: 0.875rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: background 0.2s;
        }

        .contact-btn:hover {
            background: #0073e6;
            color: white;
        }

        .section-card {
            background: #fff;
            border: 1px solid #e5e5e5;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 20px;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-title i {
            font-size: 22px;
            color: #666;
        }

        .description-text {
            line-height: 1.7;
            color: #444;
            white-space: pre-wrap;
            font-size: 15px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 0.75rem;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 0;
            font-size: 15px;
            color: #444;
        }

        .feature-item i {
            color: #28a745;
            font-size: 16px;
        }

        .feature-item.location i {
            color: #dc3545;
        }

        .tenant-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .tenant-list li {
            padding: 0.5rem 0;
            font-size: 15px;
            color: #444;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .tenant-list li i {
            color: #28a745;
            font-size: 16px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="main-container">

        <!-- Header -->
        <h1 class="room-title">${room.title}</h1>
        <div class="room-address">
            <i class="bi bi-geo-alt-fill"></i>
            <span>${room.address}</span>
        </div>

        <!-- Gallery -->
        <div class="gallery-section">
            <div class="gallery-grid">
                <c:forEach var="img" items="${room.images}">
                    <div class="gallery-item">
                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/${img}" alt="Room image">
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Price & Info -->
        <div class="price-card">
            <div class="price-text">${room.price} triệu/tháng</div>

            <div class="info-grid">
                <div class="info-item">
                    <i class="bi bi-person-circle"></i>
                    <div>
                        <div class="info-item-text">Chủ trọ</div>
                        <div class="info-item-value">${room.ownerName}</div>
                    </div>
                </div>

                <div class="info-item">
                    <i class="bi bi-door-open"></i>
                    <div>
                        <div class="info-item-text">Số phòng</div>
                        <div class="info-item-value">${room.roomNumber} phòng</div>
                    </div>
                </div>

                <div class="info-item">
                    <i class="bi bi-bounding-box"></i>
                    <div>
                        <div class="info-item-text">Diện tích</div>
                        <div class="info-item-value">${room.area} m²</div>
                    </div>
                </div>
            </div>

            <a href="https://zalo.me/${room.roomNumber}" class="contact-btn">
                <i class="bi bi-telephone-fill"></i>
                Liên hệ Zalo
            </a>
        </div>

        <!-- Description -->
        <div class="section-card">
            <h2 class="section-title">
                <i class="bi bi-card-text"></i>
                Giới thiệu
            </h2>
            <div class="description-text">${room.description}</div>
        </div>

        <!-- Tenant Types -->
        <div class="section-card">
            <h2 class="section-title">
                <i class="bi bi-people"></i>
                Đối tượng phù hợp
            </h2>
            <ul class="tenant-list">
                <c:forEach items="${room.tenantType}" var="item">
                    <li>
                        <i class="bi bi-check-circle-fill"></i>
                            ${item}
                    </li>
                </c:forEach>
            </ul>
        </div>

        <!-- Amenities -->
        <div class="section-card">
            <h2 class="section-title">
                <i class="bi bi-stars"></i>
                Tiện nghi
            </h2>
            <div class="feature-grid">
                <c:forEach items="${room.amenities}" var="item">
                    <div class="feature-item">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>${item}</span>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Neighborhood -->
        <div class="section-card">
            <h2 class="section-title">
                <i class="bi bi-geo"></i>
                Môi trường xung quanh
            </h2>
            <div class="feature-grid">
                <c:forEach items="${room.neighborhood}" var="item">
                    <div class="feature-item location">
                        <i class="bi bi-geo-alt-fill"></i>
                        <span>${item}</span>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding-bottom: 3rem;
        }

        .main-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
            margin-top: 2rem;
            overflow: hidden;
        }

        .content-wrapper {
            padding: 2rem;
        }

        .breadcrumb {
            background: transparent;
            padding: 0;
            margin-bottom: 1.5rem;
        }

        .breadcrumb-item a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb-item a:hover {
            color: #764ba2;
        }

        .room-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 2rem;
            margin: -2rem -2rem 2rem -2rem;
            color: white;
        }

        .room-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
            line-height: 1.3;
        }

        .room-address {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.1rem;
            opacity: 0.95;
            margin-bottom: 1rem;
        }

        .action-buttons {
            display: flex;
            gap: 0.75rem;
        }

        .btn-action {
            background: rgba(255,255,255,0.2);
            border: 2px solid rgba(255,255,255,0.3);
            color: white;
            padding: 0.5rem 1.25rem;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .btn-action:hover {
            background: rgba(255,255,255,0.3);
            border-color: rgba(255,255,255,0.5);
            color: white;
            transform: translateY(-2px);
        }

        .gallery-section {
            margin: 2rem 0;
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1rem;
        }

        .gallery-item {
            position: relative;
            padding-bottom: 66.67%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .gallery-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 24px rgba(102, 126, 234, 0.3);
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
            background: linear-gradient(135deg, #fff5f5 0%, #ffe5e5 100%);
            border-radius: 16px;
            padding: 2rem;
            border: 3px solid #ff4d4f;
            box-shadow: 0 8px 24px rgba(255, 77, 79, 0.2);
        }

        .price-text {
            color: #ff4d4f;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: baseline;
            gap: 0.5rem;
        }

        .price-text small {
            font-size: 1rem;
            font-weight: 600;
            color: #666;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin: 1.5rem 0;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem;
            background: white;
            border-radius: 10px;
            border: 2px solid #f0f0f0;
        }

        .info-item i {
            font-size: 1.5rem;
            color: #667eea;
        }

        .info-item-text {
            flex: 1;
        }

        .info-item-label {
            font-size: 0.85rem;
            color: #999;
            margin-bottom: 0.25rem;
        }

        .info-item-value {
            font-weight: 600;
            color: #333;
        }

        .contact-btn {
            background: linear-gradient(135deg, #ffd700 0%, #ffed4e 100%);
            border: none;
            color: #333;
            padding: 1rem 2.5rem;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 6px 16px rgba(255, 215, 0, 0.4);
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            text-decoration: none;
        }

        .contact-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 24px rgba(255, 215, 0, 0.5);
            color: #333;
        }

        .contact-btn i {
            font-size: 1.3rem;
        }

        .section-card {
            background: #f8f9fa;
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
            border: 2px solid #e9ecef;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding-bottom: 0.75rem;
            border-bottom: 3px solid #667eea;
        }

        .section-title i {
            color: #667eea;
            font-size: 1.75rem;
        }

        .description-text {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            line-height: 1.8;
            color: #555;
            white-space: pre-wrap;
            border-left: 4px solid #667eea;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1rem;
        }

        .feature-item {
            background: white;
            padding: 1rem 1.25rem;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            border-color: #667eea;
            transform: translateX(4px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
        }

        .feature-item i {
            color: #28a745;
            font-size: 1.25rem;
        }

        .feature-item.location i {
            color: #dc3545;
        }

        .tenant-list {
            list-style: none;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
        }

        .tenant-list li {
            background: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            border-left: 4px solid #667eea;
            font-weight: 600;
            color: #333;
        }

        .sticky-contact {
            position: sticky;
            top: 2rem;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="main-container">
        <div class="content-wrapper">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="/"><i class="bi bi-house-door"></i> Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item active">${room.title}</li>
                </ol>
            </nav>

            <!-- Header -->
            <div class="room-header">
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                    <div class="flex-grow-1">
                        <h1 class="room-title">${room.title}</h1>
                        <div class="room-address">
                            <i class="bi bi-geo-alt-fill"></i>
                            <span>${room.address}</span>
                        </div>
                    </div>
                    <div class="action-buttons">
                        <button class="btn-action">
                            <i class="bi bi-share"></i> Chia sẻ
                        </button>
                        <button class="btn-action">
                            <i class="bi bi-heart"></i> Yêu thích
                        </button>
                    </div>
                </div>
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

            <!-- Main Content -->
            <div class="row g-4">
                <!-- Left Column -->
                <div class="col-lg-8">
                    <!-- Price & Info Card -->
                    <div class="price-card">
                        <div class="price-text">
                            ${room.price}
                            <small>triệu /tháng</small>
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <i class="bi bi-person-circle"></i>
                                <div class="info-item-text">
                                    <div class="info-item-label">Chủ trọ</div>
                                    <div class="info-item-value">${room.ownerName}</div>
                                </div>
                            </div>

                            <div class="info-item">
                                <i class="bi bi-door-open"></i>
                                <div class="info-item-text">
                                    <div class="info-item-label">Số phòng</div>
                                    <div class="info-item-value">${room.roomNumber} phòng</div>
                                </div>
                            </div>

                            <div class="info-item">
                                <i class="bi bi-bounding-box"></i>
                                <div class="info-item-text">
                                    <div class="info-item-label">Diện tích</div>
                                    <div class="info-item-value">${room.area} m²</div>
                                </div>
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <a href="https://zalo.me/${room.roomNumber}" class="contact-btn">
                                <i class="bi bi-telephone-fill"></i>
                                Liên hệ Zalo ngay
                            </a>
                        </div>
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
                                <li><i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>${item}</li>
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

                <!-- Right Column - Sticky Contact -->
                <div class="col-lg-4">
                    <div class="sticky-contact">
                        <div class="section-card text-center">
                            <h3 class="mb-3" style="font-weight: 700; color: #333;">
                                <i class="bi bi-headset" style="color: #667eea;"></i>
                                Liên hệ ngay
                            </h3>
                            <p class="text-muted mb-3">Để xem phòng và được tư vấn chi tiết</p>
                            <a href="https://zalo.me/${room.roomNumber}" class="contact-btn w-100 justify-content-center">
                                <i class="bi bi-telephone-fill"></i>
                                Chat Zalo
                            </a>
                            <div class="mt-3 pt-3" style="border-top: 2px dashed #e9ecef;">
                                <div class="price-text justify-content-center" style="font-size: 2rem;">
                                    ${room.price}
                                    <small>triệu</small>
                                </div>
                                <p class="text-muted mb-0">Giá thuê mỗi tháng</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
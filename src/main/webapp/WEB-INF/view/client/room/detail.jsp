<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${room.title}</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        :root {
            --primary: #2563eb;
            --bg-light: #f8fafc;
            --border: #e5e7eb;
            --text-main: #1f2937;
            --text-muted: #6b7280;
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-main);
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto;
        }

        .main-container {
            background: #fff;
            margin-top: 24px;
            border: 1px solid var(--border);
            border-radius: 6px;
        }

        .content-wrapper {
            padding: 24px;
        }

        /* Header */
        .room-header {
            border-bottom: 1px solid var(--border);
            margin-bottom: 24px;
            padding-bottom: 16px;
        }

        .room-title {
            font-size: 26px;
            font-weight: 600;
        }

        .room-address {
            font-size: 14px;
            color: var(--text-muted);
        }

        /* Gallery */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 12px;
            margin-bottom: 24px;
        }

        .gallery-item {
            border: 1px solid var(--border);
            border-radius: 6px;
            overflow: hidden;
        }

        .gallery-item img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        /* Price */
        .price-card {
            border: 1px solid var(--border);
            border-left: 4px solid var(--primary);
            padding: 16px;
            margin-bottom: 24px;
            border-radius: 6px;
            background: #fafafa;
        }

        .price-text {
            font-size: 22px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 12px;
        }

        /* Info */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 12px;
        }

        .info-item {
            border: 1px solid var(--border);
            padding: 10px 12px;
            font-size: 14px;
            border-radius: 4px;
            background: #fff;
        }

        /* Section */
        .section-card {
            border: 1px solid var(--border);
            padding: 16px;
            margin-bottom: 24px;
            border-radius: 6px;
            background: #fff;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--primary);
        }

        .description-text {
            white-space: pre-wrap;
            font-size: 14px;
            color: #374151;
        }

        /* List */
        .tenant-list,
        .feature-grid {
            list-style: none;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 8px;
        }

        .tenant-list li,
        .feature-item {
            border: 1px solid var(--border);
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 4px;
            background: #f9fafb;
        }

        /* Contact */
        .contact-btn {
            display: block;
            width: 100%;
            text-align: center;
            padding: 10px;
            border-radius: 6px;
            background: var(--primary);
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            margin-top: 12px;
        }

        .contact-btn:hover {
            background: #1d4ed8;
            color: #fff;
        }

        .sticky-contact {
            position: sticky;
            top: 16px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="main-container">
        <div class="content-wrapper">

            <!-- Breadcrumb -->
            <nav class="mb-3 text-muted">
                <a href="/" class="text-decoration-none text-muted">
                    <i class="bi bi-house"></i> Trang chủ
                </a>
                / <strong>${room.title}</strong>
            </nav>

            <!-- Header -->
            <div class="room-header">
                <h1 class="room-title">${room.title}</h1>
                <div class="room-address">
                    <i class="bi bi-geo-alt"></i> ${room.address}
                </div>
            </div>

            <!-- Gallery -->
            <div class="gallery-grid">
                <c:forEach var="img" items="${room.images}">
                    <div class="gallery-item">
                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/${img}">
                    </div>
                </c:forEach>
            </div>

            <div class="row">
                <!-- Left -->
                <div class="col-lg-8">

                    <div class="price-card">
                        <div class="price-text">
                            ${room.price} triệu / tháng
                        </div>

                        <div class="info-grid">
                            <div class="info-item">Chủ trọ: ${room.ownerName}</div>
                            <div class="info-item">Số phòng: ${room.roomNumber}</div>
                            <div class="info-item">Diện tích: ${room.area} m²</div>
                        </div>

                        <a href="https://zalo.me/${room.roomNumber}" class="contact-btn">
                            Liên hệ Zalo
                        </a>
                    </div>

                    <div class="section-card">
                        <div class="section-title">Giới thiệu</div>
                        <div class="description-text">${room.description}</div>
                    </div>

                    <div class="section-card">
                        <div class="section-title">Đối tượng phù hợp</div>
                        <ul class="tenant-list">
                            <c:forEach items="${room.tenantTypes}" var="item">
                                <li>${item.label}</li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="section-card">
                        <div class="section-title">Tiện nghi</div>
                        <div class="feature-grid">
                            <c:forEach items="${room.amenities}" var="item">
                                <div class="feature-item">${item.label}</div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="section-card">
                        <div class="section-title">Môi trường xung quanh</div>
                        <div class="feature-grid">
                            <c:forEach items="${room.neighborhood}" var="item">
                                <div class="feature-item">${item.label}</div>
                            </c:forEach>
                        </div>
                    </div>

                </div>

                <!-- Right -->
                <div class="col-lg-4">
                    <div class="sticky-contact">
                        <div class="section-card text-center">
                            <p class="fw-semibold mb-2">Liên hệ xem phòng</p>
                            <a href="https://zalo.me/${room.roomNumber}" class="contact-btn">
                                Chat Zalo
                            </a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

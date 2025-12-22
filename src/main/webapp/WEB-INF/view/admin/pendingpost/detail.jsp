<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết bài đăng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: #f4f6f9;
            font-size: 14px;
        }

        .pending-detail-card {
            border-radius: 6px;
            border: 1px solid #dee2e6;
            background: #fff;
        }

        /* Header */
        .detail-header {
            background: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
        }

        .detail-header h4 {
            margin: 0;
            font-size: 16px;
            font-weight: 600;
            color: #212529;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .pending-badge {
            margin-left: auto;
            background: #ffc107;
            color: #212529;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
        }

        /* Info section */
        .info-section {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            background: #fff;
        }

        .info-row {
            display: grid;
            grid-template-columns: 160px 1fr;
            gap: 1rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid #e9ecef;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            font-weight: 600;
            color: #495057;
        }

        .info-value {
            color: #212529;
        }

        .price-highlight {
            font-size: 16px;
            font-weight: 600;
            color: #dc3545;
        }

        /* User info */
        .user-info-card {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 0.5rem 0.75rem;
            background: #f8f9fa;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #6c757d;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 14px;
        }

        /* Status */
        .status-badge {
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }

        /* Image gallery */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 0.75rem;
        }

        .gallery-item {
            border: 1px solid #dee2e6;
            border-radius: 4px;
            overflow: hidden;
            background: #fff;
        }

        .gallery-item img {
            width: 100%;
            height: 120px;
            object-fit: cover;
        }

        /* Description */
        .description-box {
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 1rem;
            background: #fff;
            line-height: 1.6;
            color: #212529;
        }

        /* Section title */
        .section-title {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: #343a40;
        }

        .section-divider {
            display: none;
        }

        /* Back button */
        .back-button {
            background: #6c757d;
            border: none;
            padding: 6px 16px;
            font-size: 14px;
            border-radius: 4px;
            color: #fff;
            text-decoration: none;
        }

        .back-button:hover {
            opacity: 0.9;
            color: #fff;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="container p-4">
        <div class="card pending-detail-card p-4 shadow-lg">
            <div class="detail-header">
                <h4>
                    <i class="fas fa-clock"></i> Chi tiết bài đăng chờ duyệt
                    <span class="pending-badge">
                        <i class="fas fa-hourglass-half"></i> Đang chờ
                    </span>
                </h4>
            </div>

            <!-- Thông tin cơ bản -->
            <div class="info-section">
                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-heading"></i> Tiêu đề
                    </div>
                    <div class="info-value">${post.title}</div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-user"></i> Người đăng
                    </div>
                    <div class="info-value">
                        <div class="user-info-card">
                            <div class="user-avatar">
                                ${post.user.fullName.substring(0,1).toUpperCase()}
                            </div>
                            <div>
                                <strong>${post.user.fullName}</strong>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-tag"></i> Giá cả
                    </div>
                    <div class="info-value">
                        <span class="price-highlight">${post.price}</span>
                    </div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-map-marker-alt"></i> Địa chỉ
                    </div>
                    <div class="info-value">${post.address}</div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-calendar"></i> Ngày đăng
                    </div>
                    <div class="info-value">${post.createdAtFormatted}</div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-home"></i> Loại hình
                    </div>
                    <div class="info-value">${post.rentalType}</div>
                </div>

                <div class="info-row">
                    <div class="info-label">
                        <i class="fas fa-info-circle"></i> Trạng thái
                    </div>
                    <div class="info-value">
                        <span class="status-badge status-pending">
                            <i class="fas fa-clock"></i>
                            ${post.status}
                        </span>
                    </div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Ảnh minh họa -->
            <div class="mb-4">
                <h5 class="section-title">
                    <i class="fas fa-images"></i> Ảnh minh họa
                </h5>
                <c:choose>
                    <c:when test="${not empty post.images}">
                        <div class="image-gallery">
                            <c:forEach var="img" items="${post.images}">
                                <div class="gallery-item">
                                    <img src="${pageContext.request.contextPath}/images/roomImages/${img}"
                                         alt="Ảnh phòng">
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="gallery-item" style="max-width: 200px;">
                            <img src="${pageContext.request.contextPath}/images/roomImages/default_roomImage.png"
                                 alt="Default roomImage">
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="section-divider"></div>

            <!-- Mô tả -->
            <div class="mb-4">
                <h5 class="section-title">
                    <i class="fas fa-align-left"></i> Mô tả chi tiết
                </h5>
                <div class="description-box">
                    ${post.description}
                </div>
            </div>

            <!-- Nút quay lại -->
            <div class="text-center mt-4">
                <a href="/admin/pendingpost" class="back-button">
                    <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách chờ duyệt
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
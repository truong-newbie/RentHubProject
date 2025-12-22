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
            background-color: #f5f6f8;
        }

        .detail-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
        }

        .detail-header {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
            padding: 1.25rem;
            margin: -1.5rem -1.5rem 1.5rem -1.5rem;
        }

        .detail-header h4 {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: #212529;
        }

        .info-section {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1rem;
            background-color: #ffffff;
            margin-bottom: 1.5rem;
        }

        .info-row {
            display: grid;
            grid-template-columns: 160px 1fr;
            gap: 1rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid #f1f3f5;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #6c757d;
            font-weight: 500;
        }

        .info-value {
            color: #212529;
            font-weight: 500;
        }

        .price-highlight {
            font-size: 1.1rem;
            font-weight: 600;
            color: #dc3545;
        }

        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
            gap: 0.75rem;
        }

        .gallery-item {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            overflow: hidden;
            background-color: #f8f9fa;
            aspect-ratio: 1 / 1;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .status-badge {
            padding: 0.35rem 0.75rem;
            font-size: 0.875rem;
            border-radius: 4px;
            font-weight: 500;
        }

        .description-box {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1rem;
            background-color: #ffffff;
            color: #212529;
            line-height: 1.6;
        }

        .section-title {
            font-size: 1rem;
            font-weight: 600;
            color: #212529;
            margin-bottom: 0.75rem;
        }

        .back-button {
            background-color: #0d6efd;
            border-radius: 6px;
            padding: 0.5rem 1.5rem;
            font-weight: 500;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="container p-4">
        <div class="card detail-card p-4 shadow-lg">
            <div class="detail-header">
                <h4><i class="fas fa-file-alt"></i> Chi tiết bài đăng</h4>
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
                    <div class="info-value">${post.user.fullName}</div>
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
                        <span class="status-badge bg-success">${post.status}</span>
                    </div>
                </div>
            </div>

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
                <a href="/admin/post" class="btn btn-primary back-button">
                    <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
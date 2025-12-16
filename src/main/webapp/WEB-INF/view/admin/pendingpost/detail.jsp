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
        .pending-detail-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .detail-header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 2rem;
            margin: -1.5rem -1.5rem 2rem -1.5rem;
            position: relative;
            overflow: hidden;
        }

        .detail-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: pulse 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        .detail-header h4 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            position: relative;
            z-index: 1;
        }

        .pending-badge {
            display: inline-block;
            padding: 0.5rem 1rem;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            border: 2px solid rgba(255,255,255,0.3);
            margin-left: auto;
        }

        .info-section {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .info-row {
            display: grid;
            grid-template-columns: 180px 1fr;
            gap: 1rem;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e9ecef;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #6c757d;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-label i {
            color: #f5576c;
        }

        .info-value {
            color: #212529;
            font-weight: 500;
        }

        .price-highlight {
            font-size: 1.5rem;
            color: #f5576c;
            font-weight: 700;
        }

        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .gallery-item {
            position: relative;
            padding-bottom: 100%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(245, 87, 108, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 2px solid #f8f9fa;
        }

        .gallery-item:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 8px 16px rgba(245, 87, 108, 0.25);
            border-color: #f5576c;
        }

        .gallery-item img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .status-pending {
            background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%);
            color: #2d3436;
        }

        .description-box {
            background: white;
            border: 2px solid #f8f9fa;
            border-left: 4px solid #f5576c;
            border-radius: 12px;
            padding: 1.5rem;
            line-height: 1.8;
            color: #495057;
        }

        .back-button {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
            background: linear-gradient(135deg, #495057 0%, #6c757d 100%);
            color: white;
        }

        .section-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-title i {
            color: #f5576c;
        }

        .section-divider {
            height: 1px;
            background: linear-gradient(90deg, transparent 0%, #f5576c 50%, transparent 100%);
            margin: 2rem 0;
        }

        .user-info-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 12px;
            padding: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            border: 2px solid #dee2e6;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: 700;
        }

        .pending-indicator {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: #ffeaa7;
            color: #2d3436;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 8px rgba(253, 203, 110, 0.3);
            z-index: 2;
        }

        .pending-indicator i {
            animation: blink 1.5s ease-in-out infinite;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.3; }
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
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
        .detail-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .detail-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            margin: -1.5rem -1.5rem 2rem -1.5rem;
        }

        .detail-header h4 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
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

        .info-value {
            color: #212529;
            font-weight: 500;
        }

        .price-highlight {
            font-size: 1.5rem;
            color: #dc3545;
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
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .gallery-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 12px rgba(0,0,0,0.15);
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
            display: inline-block;
        }

        .description-box {
            background: white;
            border: 2px solid #e9ecef;
            border-radius: 12px;
            padding: 1.5rem;
            line-height: 1.8;
            color: #495057;
        }

        .back-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(102, 126, 234, 0.3);
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
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
            color: #667eea;
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
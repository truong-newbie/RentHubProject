<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f6f8;
        }

        .user-detail-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
        }

        /* Header */
        .profile-header {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
            padding: 2rem 1.5rem;
            text-align: center;
        }

        .avatar-wrapper {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            border: 1px solid #dee2e6;
            margin: 0 auto 1rem;
        }

        .avatar-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-name {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #212529;
        }

        .role-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            font-size: 0.85rem;
            font-weight: 500;
            border-radius: 4px;
            background-color: #e9ecef;
            color: #495057;
        }

        /* Info section */
        .info-section {
            padding: 1.5rem;
        }

        .info-table {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            overflow: hidden;
            margin-bottom: 0;
        }

        .info-table th {
            width: 180px;
            background-color: #f8f9fa;
            font-weight: 500;
            color: #495057;
            border-right: 1px solid #dee2e6;
            padding: 0.75rem 1rem;
        }

        .info-table td {
            padding: 0.75rem 1rem;
            color: #212529;
        }

        .info-table tr:last-child th,
        .info-table tr:last-child td {
            border-bottom: none;
        }

        /* Stats */
        .section-divider {
            border-top: 1px solid #dee2e6;
            margin: 1.5rem 0;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            padding: 0 1.5rem 1.5rem;
        }

        .stat-card {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1rem;
            text-align: center;
            background-color: #ffffff;
        }

        .stat-icon {
            font-size: 1.25rem;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #6c757d;
            margin-bottom: 0.25rem;
        }

        .stat-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: #212529;
        }

        /* Button */
        .back-button {
            background-color: #6c757d;
            border-radius: 6px;
            padding: 0.45rem 1.5rem;
            font-weight: 500;
            color: #fff;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="container p-4">
        <div class="card user-detail-card shadow-lg">
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="avatar-container">
                    <div class="avatar-wrapper">
                        <c:choose>
                            <c:when test="${not empty user.avatar}">
                                <img src="${pageContext.request.contextPath}/images/avatar/${user.avatar}" alt="Avatar">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/images/avatar/default-avatar.jpg" alt="Default Avatar">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <h2 class="user-name">${user.fullName}</h2>
                <span class="role-badge">
                    <i class="fas fa-shield-alt me-2"></i>${user.role.name}
                </span>
            </div>

            <!-- Info Section -->
            <div class="info-section">
                <h5 class="mb-3" style="color: #495057; font-weight: 600;">
                    <i class="fas fa-info-circle me-2" style="color: #667eea;"></i>
                    Thông tin chi tiết
                </h5>

                <table class="info-table table">
                    <tbody>
                    <tr>
                        <th>
                            <i class="fas fa-envelope"></i>
                            Email
                        </th>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <th>
                            <i class="fas fa-phone"></i>
                            Số điện thoại
                        </th>
                        <td>${user.phoneNumber}</td>
                    </tr>
                    <tr>
                        <th>
                            <i class="fas fa-map-marker-alt"></i>
                            Địa chỉ
                        </th>
                        <td>${user.address}</td>
                    </tr>
                    <tr>
                        <th>
                            <i class="fas fa-calendar-plus"></i>
                            Ngày tạo
                        </th>
                        <td>${user.createdAt}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- Stats Section (Optional - có thể thêm nếu có dữ liệu) -->
            <div class="section-divider"></div>

            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-file-alt"></i>
                    </div>
                    <div class="stat-label">Tổng bài đăng</div>
                    <div class="stat-value">--</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-label">Hoạt động gần đây</div>
                    <div class="stat-value">--</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="stat-label">Đánh giá</div>
                    <div class="stat-value">--</div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-center gap-3 p-4">
                <a href="/admin/user" class="back-button">
                    <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
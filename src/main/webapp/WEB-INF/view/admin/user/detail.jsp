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
        .user-detail-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .profile-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 3rem 2rem;
            text-align: center;
            position: relative;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.1)" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
            opacity: 0.3;
        }

        .avatar-container {
            position: relative;
            display: inline-block;
            margin-bottom: 1.5rem;
        }

        .avatar-wrapper {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            position: relative;
            z-index: 1;
        }

        .avatar-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-name {
            font-size: 1.75rem;
            font-weight: 700;
            margin: 1rem 0 0.5rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .role-badge {
            display: inline-block;
            padding: 0.5rem 1.5rem;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.9rem;
            border: 2px solid rgba(255,255,255,0.3);
        }

        .info-section {
            padding: 2rem;
        }

        .info-table {
            background: #f8f9fa;
            border-radius: 12px;
            overflow: hidden;
            border: none;
        }

        .info-table tr {
            border-bottom: 1px solid #e9ecef;
        }

        .info-table tr:last-child {
            border-bottom: none;
        }

        .info-table th {
            background: white;
            color: #495057;
            font-weight: 600;
            padding: 1rem 1.5rem;
            width: 200px;
            border: none;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .info-table th i {
            color: #667eea;
            font-size: 1.1rem;
        }

        .info-table td {
            padding: 1rem 1.5rem;
            color: #212529;
            font-weight: 500;
            border: none;
            background: #f8f9fa;
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

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 2rem;
            padding: 0 2rem 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            border: 2px solid #e9ecef;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.75rem;
            font-size: 1.25rem;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #6c757d;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .stat-value {
            font-size: 1.25rem;
            font-weight: 700;
            color: #212529;
        }

        .section-divider {
            height: 1px;
            background: linear-gradient(90deg, transparent 0%, #667eea 50%, transparent 100%);
            margin: 2rem 0;
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
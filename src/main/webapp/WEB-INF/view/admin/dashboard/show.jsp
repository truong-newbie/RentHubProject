
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Website Đăng Tin Phòng Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<!-- Sidebar -->
<jsp:include page="../layout/sidebar.jsp"/>

<!-- Main Content -->
<div class="main-content">
    <!-- Top Navbar -->
    <jsp:include page="../layout/header.jsp"/>

    <div class="content-wrapper">
        <!-- Dashboard Section -->
        <div id="dashboard" class="content-section">
            <h2 class="page-title">Tổng Quan Hệ Thống</h2>

            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-lg-3 col-md-6">
                    <div class="stats-card primary">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Tổng Tin Đăng</h6>
                                <h2 class="mb-0">${fn:length(allPosts)}</h2>
                                <c:choose>
                                    <c:when test="${growthRateAllPost > 0}">
                                        <small class="text-success">
                                            <i class="fas fa-arrow-up"></i> +${growthRateAllPost}% so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:when test="${growthRateAllPost < 0}">
                                        <small class="text-danger">
                                            <i class="fas fa-arrow-down"></i> ${growthRateAllPost}% so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:otherwise>
                                        <small class="text-secondary">
                                            <i class="fas fa-minus"></i> Không thay đổi so với ngày hôm qua
                                        </small>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="icon">
                                <i class="fas fa-newspaper"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stats-card success">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Tin Đang Hiển Thị</h6>
                                <h2 class="mb-0">${fn:length(viewPosts)}</h2>
                                <c:choose>
                                    <c:when test="${growthRateDisplayPost > 0}">
                                        <small class="text-success">
                                            <i class="fas fa-arrow-up"></i> +${growthRateDisplayPost}% so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:when test="${growthRateDisplayPost < 0}">
                                        <small class="text-danger">
                                            <i class="fas fa-arrow-down"></i> ${growthRateDisplayPost}% so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:otherwise>
                                        <small class="text-secondary">
                                            <i class="fas fa-minus"></i> Không thay đổi so với ngày hôm qua
                                        </small>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stats-card warning">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Chờ Duyệt</h6>
                                <h2 class="mb-0">${fn:length(pendingPosts)}</h2>
                                <small class="text-warning"><i class="fas fa-clock"></i> Cần xử lý</small>
                            </div>
                            <div class="icon">
                                <i class="fas fa-hourglass-half"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stats-card danger">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Người Dùng</h6>
                                <h2 class="mb-0">${fn:length(users)}</h2>
                                <c:choose>
                                    <c:when test="${growthRateUser > 0}">
                                        <small class="text-success">
                                            <i class="fas fa-arrow-up"></i> +${growthRateUser} so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:when test="${growthRateUser < 0}">
                                        <small class="text-danger">
                                            <i class="fas fa-arrow-down"></i> ${growthRateUser} so với ngày hôm qua
                                        </small>
                                    </c:when>

                                    <c:otherwise>
                                        <small class="text-secondary">
                                            <i class="fas fa-minus"></i> Không thay đổi so với ngày hôm qua
                                        </small>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="icon">
                                <i class="fas fa-users"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Posts & Activities -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="content-card">
                        <h5><i class="fas fa-newspaper me-2"></i>Tin Đăng Mới Nhất</h5>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead>
                                <tr>
                                    <th>Hình Ảnh</th>
                                    <th>Tiêu Đề</th>
                                    <th>Người Đăng</th>
                                    <th>Giá</th>
                                    <th>Trạng Thái</th>
                                    <th>Ngày Đăng</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="post" items="${lastFivePosts}" >
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${empty post.images}">
                                                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/default_roomImage.png" alt="Ảnh mặc định" class="post-image">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/${post.images[0]}" alt="${post.title}" class="post-image">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        <td>
                                            <strong>${post.title}</strong><br>
                                            <small class="text-muted">${post.address}</small>
                                        </td>
                                            <td>${post.user.fullName}</td>
                                            <td><strong class="text-danger">${post.price} triệu/tháng</strong></td>
                                        <td><span class="badge bg-warning badge-status">${post.status}</span></td>
                                        <td>${post.createdAtFormatted}</td>
                                </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="content-card">
                        <h5><i class="fas fa-bell me-2"></i>Thông Báo</h5>
                        <div class="list-group list-group-flush">
                            <a href="#" class="list-group-item list-group-item-action border-0 px-0">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">${fn:length(pendingPosts)} tin đăng chờ duyệt</h6>
                                    <small class="text-warning">Urgent</small>
                                </div>
                                <p class="mb-1 small text-muted">Cần phê duyệt các tin đăng mới</p>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action border-0 px-0">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">8 báo cáo vi phạm</h6>
                                    <small class="text-danger">High</small>
                                </div>
                                <p class="mb-1 small text-muted">Người dùng báo cáo tin đăng spam</p>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action border-0 px-0">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">${growthRateUser} người dùng mới</h6>
                                    <small class="text-success">Info</small>
                                </div>
                                <p class="mb-1 small text-muted">Đăng ký tài khoản tuần này</p>
                            </a>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div> <!-- end content-wrapper -->
</div> <!-- end main-content -->
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

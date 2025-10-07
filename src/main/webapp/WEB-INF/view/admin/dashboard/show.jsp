
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                                <h2 class="mb-0">1,248</h2>
                                <small class="text-success"><i class="fas fa-arrow-up"></i> +18% tháng này</small>
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
                                <h2 class="mb-0">956</h2>
                                <small class="text-success"><i class="fas fa-arrow-up"></i> +12% tháng này</small>
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
                                <h2 class="mb-0">34</h2>
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
                                <h2 class="mb-0">5,832</h2>
                                <small class="text-success"><i class="fas fa-arrow-up"></i> +245 tuần này</small>
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
                                <tr>
                                    <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                                    <td>
                                        <strong>Phòng trọ cao cấp gần ĐH Bách Khoa</strong><br>
                                        <small class="text-muted">Quận 10, TP.HCM</small>
                                    </td>
                                    <td>Nguyễn Văn A</td>
                                    <td><strong class="text-danger">3.5 triệu/tháng</strong></td>
                                    <td><span class="badge bg-warning badge-status">Chờ duyệt</span></td>
                                    <td>10:30 AM</td>
                                </tr>
                                <tr>
                                    <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                                    <td>
                                        <strong>Nhà trọ giá rẻ Quận 7</strong><br>
                                        <small class="text-muted">Quận 7, TP.HCM</small>
                                    </td>
                                    <td>Trần Thị B</td>
                                    <td><strong class="text-danger">2.8 triệu/tháng</strong></td>
                                    <td><span class="badge bg-success badge-status">Đã duyệt</span></td>
                                    <td>09:15 AM</td>
                                </tr>
                                <tr>
                                    <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                                    <td>
                                        <strong>Căn hộ mini đầy đủ nội thất</strong><br>
                                        <small class="text-muted">Quận Bình Thạnh, TP.HCM</small>
                                    </td>
                                    <td>Lê Văn C</td>
                                    <td><strong class="text-danger">5.0 triệu/tháng</strong></td>
                                    <td><span class="badge bg-success badge-status">Đã duyệt</span></td>
                                    <td>08:45 AM</td>
                                </tr>
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
                                    <h6 class="mb-1">34 tin đăng chờ duyệt</h6>
                                    <small class="text-warning">Urgent</small>
                                </div>
                                <p class="mb-1 small text-muted">Cần phê duyệt các tin đăng mới</p>
                                <small class="text-muted">2 giờ trước</small>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action border-0 px-0">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">8 báo cáo vi phạm</h6>
                                    <small class="text-danger">High</small>
                                </div>
                                <p class="mb-1 small text-muted">Người dùng báo cáo tin đăng spam</p>
                                <small class="text-muted">5 giờ trước</small>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action border-0 px-0">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">245 người dùng mới</h6>
                                    <small class="text-success">Info</small>
                                </div>
                                <p class="mb-1 small text-muted">Đăng ký tài khoản tuần này</p>
                                <small class="text-muted">1 ngày trước</small>
                            </a>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <!-- Posts Management Section -->
        <div id="posts" class="content-section" style="display: none;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="page-title mb-0">Quản Lý Tin Đăng</h2>
                <div class="d-flex gap-2">
                    <select class="form-select" style="width: 200px;">
                        <option>Tất cả trạng thái</option>
                        <option>Đã duyệt</option>
                        <option>Chờ duyệt</option>
                        <option>Bị từ chối</option>
                    </select>
                </div>
            </div>
            <div class="content-card">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hình Ảnh</th>
                            <th>Tiêu Đề & Địa Chỉ</th>
                            <th>Người Đăng</th>
                            <th>Giá</th>
                            <th>Lượt Xem</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>#1248</td>
                            <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                            <td>
                                <strong>Phòng trọ cao cấp gần ĐH Bách Khoa</strong><br>
                                <small class="text-muted"><i class="fas fa-map-marker-alt"></i> 123 Lý Thường Kiệt, Q.10, TP.HCM</small>
                            </td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <img src="https://ui-avatars.com/api/?name=Nguyen+Van+A" class="user-avatar" alt="User">
                                    <span>Nguyễn Văn A</span>
                                </div>
                            </td>
                            <td><strong class="text-danger">3.5tr/tháng</strong></td>
                            <td>1,234</td>
                            <td><span class="badge bg-success badge-status">Đã duyệt</span></td>
                            <td class="table-actions">
                                <button class="btn btn-sm btn-info" title="Xem chi tiết"><i class="fas fa-eye"></i></button>
                                <button class="btn btn-sm btn-warning" title="Chỉnh sửa"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger" title="Xóa"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>#1247</td>
                            <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                            <td>
                                <strong>Nhà trọ giá rẻ Quận 7</strong><br>
                                <small class="text-muted"><i class="fas fa-map-marker-alt"></i> 45 Nguyễn Thị Thập, Q.7, TP.HCM</small>
                            </td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <img src="https://ui-avatars.com/api/?name=Tran+Thi+B" class="user-avatar" alt="User">
                                    <span>Trần Thị B</span>
                                </div>
                            </td>
                            <td><strong class="text-danger">2.8tr/tháng</strong></td>
                            <td>856</td>
                            <td><span class="badge bg-warning badge-status">Chờ duyệt</span></td>
                            <td class="table-actions">
                                <button class="btn btn-sm btn-success" title="Duyệt"><i class="fas fa-check"></i></button>
                                <button class="btn btn-sm btn-danger" title="Từ chối"><i class="fas fa-times"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>#1246</td>
                            <td><img src="https://via.placeholder.com/80x60" class="post-image" alt="Phòng"></td>
                            <td>
                                <strong>Căn hộ mini đầy đủ nội thất</strong><br>
                                <small class="text-muted"><i class="fas fa-map-marker-alt"></i> 789 Xô Viết Nghệ Tĩnh, Bình Thạnh</small>
                            </td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <img src="https://ui-avatars.com/api/?name=Le+Van+C" class="user-avatar" alt="User">
                                    <span>Lê Văn C</span>
                                </div>
                            </td>
                            <td><strong class="text-danger">5.0tr/tháng</strong></td>
                            <td>2,145</td>
                            <td><span class="badge bg-success badge-status">Đã duyệt</span></td>
                            <td class="table-actions">
                                <button class="btn btn-sm btn-info" title="Xem chi tiết"><i class="fas fa-eye"></i></button>
                                <button class="btn btn-sm btn-warning" title="Chỉnh sửa"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger" title="Xóa"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Users Section -->
        <div id="users" class="content-section" style="display: none;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="page-title mb-0">Quản Lý Người Dùng</h2>
            </div>
            <div class="content-card">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Người Dùng</th>
                            <th>Email</th>
                            <th>Số Điện Thoại</th>
                            <th>Số Tin Đăng</th>
                            <th>Ngày Đăng Ký</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>#5832</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <img src="https://ui-avatars.com/api/?name=Nguyen+Van

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tổng quan - Trợ Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/resources/css/owner/styles.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<!-- Main Content -->
<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <!-- User Dropdown -->
    <div class="user-dropdown" id="userDropdown">
        <div class="dropdown-header">
            <div class="user-info">
                <div class="avatar">G</div>
                <div>
                    <div><strong>Garnacho Jr</strong></div>
                    <div style="font-size: 12px; color: #999;">ID: #30094</div>
                </div>
            </div>

            <div class="balance-info">
                <span class="balance-label">TK chính:</span>
                <span class="balance-amount">0đ</span>
            </div>

            <div class="balance-info">
                <span class="balance-label">TK khuyến mãi:</span>
                <span class="balance-amount">0đ</span>
            </div>

            <div class="balance-info">
                <span class="balance-label">Số lượng quảng cáo:</span>
                <span class="balance-amount">1/1</span>
            </div>

        </div>

        <div class="dropdown-menu-items">
            <a href="#" class="dropdown-item">
                <i class="bi bi-person-badge"></i>
                <span>Thông tin cá nhân</span>
            </a>

            <a href="#" class="dropdown-item">
                <i class="bi bi-person-circle"></i>
                <span>Thông tin tài khoản</span>
            </a>

            <a href="#" class="dropdown-item">
                <i class="bi bi-arrow-left-right"></i>
                <span>Chuyển sang tìm trọ</span>
            </a>

            <form method="post" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button class="dropdown-item">
                    <i class="bi bi-box-arrow-right"></i> Đăng xuất
                </button>

            </form>
        </div>
    </div>

    <!-- Empty State -->
    <c:if test="${countPosts == 0}">
        <div class="empty-state">
            <i class="bi bi-house-fill"></i>
            <h4>BẠN CHƯA CÓ NHÀ TRỌ NÀO</h4>
            <p>Hãy tạo mới nhà trọ để bắt đầu quản lý phòng thuê, khách<br>hợp đồng, thu chi và quảng cáo miễn phí trên Trợ Mới!</p>
            <a href="#" style="color: var(--primary-blue); text-decoration: none; margin-bottom: 20px; display: inline-block;">
                Tiếp cận hàng ngàn khách thuê mới ngay.
            </a>
            <br>
            <a href="/owner/create" class="btn btn-add-property">
                <i class="bi bi-house-add-fill"></i>
                Thêm trọ mới
            </a>
        </div>
    </c:if>
    <c:if test="${countPosts > 0}" >
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4><i class="fas fa-newspaper me-2"></i> Quản Lý Tin Đăng</h4>
                <button class="btn btn-primary" onclick="window.location.href='/owner/create'">
                    <i class="fas fa-plus me-1"></i> Thêm mới
                </button>

            </div>

            <table class="table table-bordered table-hover bg-white">
                <thead class="table-primary text-center">
                <tr>
                    <th>Id</th>
                    <th>Tiêu đề</th>
                    <th>Ngày đăng</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody class="align-middle text-center">
                <c:forEach var="post" items="${posts}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${post.title}</td>
                        <td>${post.createdAtFormatted}</td>
                        <td><span class="badge bg-success">${post.status}</span></td>
                        <td>
                            <a href="/admin/post/detail/${post.id}" class="btn btn-sm btn-info"><i class="fas fa-eye"></i></a>
                            <a href="/admin/post/hide/${post.id}" class="btn btn-sm btn-warning"><i class="fas fa-eye-slash"></i></a>
                            <a href="/admin/post/delete/${post.id}" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('userDropdown');
        dropdown.classList.toggle('show');
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('userDropdown');
        const avatar = document.querySelector('.user-avatar');

        if (!dropdown.contains(event.target) && !avatar.contains(event.target)) {
            dropdown.classList.remove('show');
        }
    });
</script>
</body>
</html>
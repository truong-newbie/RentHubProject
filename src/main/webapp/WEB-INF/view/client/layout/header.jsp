<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/owner/styles.css" rel="stylesheet" >
<header class="navbar-custom">
    <div class="container position-relative">
        <div class="d-flex justify-content-between align-items-center">
            <!-- Logo -->
            <div class="logo">
                <a href="/"> <i class="fas fa-home"></i> NhaTro247</a>
            </div>

            <!-- Menu -->
            <nav class="nav-links d-none d-lg-flex">
                <a href="/rentalroom">Nhà trọ, phòng trọ</a>
                <a href="/entirehouse">Nhà nguyên căn</a>
                <a href="/flat">Căn hộ</a>
            </nav>

            <c:if test="${not empty pageContext.request.userPrincipal}">
                <!-- Avatar -->
                <div class="user-avatar" onclick="toggleDropdown(event)">
                    G
                </div>

                <!-- Dropdown -->
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

                        <button class="dropdown-btn">
                            <i class="bi bi-coin"></i>
                            Nạp tiền
                        </button>
                    </div>

                    <div class="dropdown-menu-items">
                        <a href="#" class="dropdown-item"><i class="bi bi-person-badge"></i> Thông tin cá nhân</a>
                        <a href="#" class="dropdown-item"><i class="bi bi-person-circle"></i> Thông tin tài khoản</a>
                        <a href="#" class="dropdown-item"><i class="bi bi-arrow-left-right"></i> Chuyển sang tìm trọ</a>
                        <form method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="dropdown-item">
                                <i class="bi bi-box-arrow-right"></i> Đăng xuất
                            </button>
                        </form>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty pageContext.request.userPrincipal}">
                <div class="d-flex gap-2 align-items-center">
                    <a href="/login" class="nav-auth-link"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
                    <a href="/register" class="nav-auth-link"><i class="fas fa-user-plus"></i> Đăng ký</a>
                </div>
            </c:if>

            <a href="#" class="btn-dang-tin">Đăng tin</a>
        </div>
    </div>
</header>

<!-- JS -->
<script>
    function toggleDropdown(event) {
        event.stopPropagation(); // Ngăn click lan ra ngoài container
        const dropdown = document.getElementById('userDropdown');
        dropdown.classList.toggle('show');
    }

    // Đóng dropdown khi click ra ngoài
    document.addEventListener('click', function (event) {
        const dropdown = document.getElementById('userDropdown');
        const avatar = document.querySelector('.user-avatar');
        if (dropdown && !dropdown.contains(event.target) && !avatar.contains(event.target)) {
            dropdown.classList.remove('show');
        }
    });
</script>

<!-- Style riêng cho dropdown -->
<style>
    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: #007bff;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        cursor: pointer;
        user-select: none;
    }

    /* Dropdown ẩn mặc định */
    .user-dropdown {
        display: none;
        position: absolute;
        top: 60px;
        right: 0;
        width: 250px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        padding: 10px;
    }

    /* Khi có class .show thì hiện */
    .user-dropdown.show {
        display: block;
    }

    /* Một ít style phụ */
    .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .avatar {
        background-color: #007bff;
        color: white;
        width: 35px;
        height: 35px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }

    .dropdown-item {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 8px;
        border-radius: 6px;
        text-decoration: none;
        color: #333;
    }

    .dropdown-item:hover {
        background-color: #f0f0f0;
    }
</style>

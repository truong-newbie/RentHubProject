<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top-navbar d-flex justify-content-end align-items-center gap-3">
    <button class="btn btn-light position-relative">
        <i class="fas fa-bell"></i>
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
            12
        </span>
    </button>
    <div class="dropdown">
        <button class="btn btn-light dropdown-toggle d-flex align-items-center gap-2" type="button" data-bs-toggle="dropdown">
            <img src="https://ui-avatars.com/api/?name=Admin&background=3b82f6&color=fff" class="user-avatar" alt="Admin">
            <span>Admin</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i> Hồ Sơ</a></li>
            <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i> Cài Đặt</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất</a></li>
        </ul>
    </div>
</div>

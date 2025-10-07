<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-home"></i>
        NhaTro247
    </div>
    <nav class="nav flex-column mt-3">
        <a class="nav-link active" href="/admin" onclick="showSection('dashboard'); return false;">
            <i class="fas fa-chart-line"></i> Tổng Quan
        </a>
        <a class="nav-link" href="/admin/post" onclick="showSection('posts'); return false;">
            <i class="fas fa-newspaper"></i> Quản Lý Tin Đăng
        </a>
        <a class="nav-link" href="/admin/user" onclick="showSection('users'); return false;">
            <i class="fas fa-users"></i> Quản Lý Người Dùng
        </a>
        <a class="nav-link" href="/admin/pendingpost" onclick="showSection('pending'); return false;">
            <i class="fas fa-clock"></i> Tin Chờ Duyệt
        </a>
    </nav>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="width: 400px;">
        <h3 class="text-center mb-3 text-primary">Đăng nhập</h3>

        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
        </c:if>

        <!-- Hiển thị thông báo đăng xuất -->
        <c:if test="${not empty logout}">
            <div class="alert alert-success text-center">${logout}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <c:if test="${param.error != null}">
                <div class="my-2" style="color: red;">Invalid email or password.</div>
            </c:if>
            <div class="mb-3">
                <label for="email" class="form-label">Tên đăng nhập</label>
                <input type="email" class="form-control" id="email" name="email"
                       placeholder="Nhập email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Nhập mật khẩu" required>
            </div>
            <div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe" name="remember-me">
                    <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
                </div>
                <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none">Quên mật khẩu?</a>
            </div>

            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </div>

            <p class="text-center mb-0">
                Chưa có tài khoản?
                <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Đăng ký ngay</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>

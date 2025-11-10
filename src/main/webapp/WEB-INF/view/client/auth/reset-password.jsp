<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 400px;">
        <h3 class="text-center mb-4 text-primary">Đặt lại mật khẩu</h3>

        <form action="${pageContext.request.contextPath}/forgot-password/reset" method="post">
            <div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu mới</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Nhập mật khẩu mới" required minlength="6">
                <input type="password" name="confirmPassword" class="form-control mt-2" placeholder="Nhập lại mật khẩu mới" required minlength="6">

                <small class="text-danger"><c:out value="${error}" /></small>
            </div>

            <button type="submit" class="btn btn-primary w-100">Đặt lại mật khẩu</button>
        </form>

        <div class="text-center mt-3">
            <a href="/login" class="text-decoration-none">Quay lại đăng nhập</a>
        </div>
    </div>
</div>

</body>
</html>

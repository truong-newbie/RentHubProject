<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 400px;">
        <h3 class="text-center mb-4 text-primary">Quên mật khẩu</h3>


        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Nhập email của bạn</label>
                <input type="email" name="email" class="form-control" placeholder="example@gmail.com" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi mã OTP</button>
        </form>

        <div class="text-center mt-3">
            <a href="/login" class="text-decoration-none">Quay lại đăng nhập</a>
        </div>
    </div>
</div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác minh OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 400px;">
        <h3 class="text-center mb-4 text-success">Xác minh OTP</h3>

        <form action="${pageContext.request.contextPath}/forgot-password/verify-otp" method="post">
            <div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Nhập mã OTP bạn nhận được</label>
                <input type="text" name="otp" class="form-control" placeholder="Nhập mã OTP" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Xác nhận</button>
        </form>

        <div class="text-center mt-3">
            <a href="/forgot-password" class="text-decoration-none">Quay lại</a>
        </div>
    </div>
</div>

</body>
</html>

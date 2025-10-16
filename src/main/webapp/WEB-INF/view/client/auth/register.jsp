<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="width: 450px;">
        <h3 class="text-center mb-3 text-primary">Đăng ký tài khoản</h3>

        <!-- Hiển thị thông báo lỗi hoặc thành công -->
        <c:if test="${not empty message}">
            <div class="alert alert-info text-center">${message}</div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="registerUser">

            <%--trang tri cho thong bao loi--%>
            <c:set var="errorFullName">
                <form:errors path="fullName" cssClass="invalid-feedback"/>
            </c:set>
            <c:set var="errorPassword">
                <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
            </c:set>
            <c:set var="errorEmail">
                <form:errors path="email" cssClass="invalid-feedback"/>
            </c:set>

            <div class="mb-3">
                <label for="fullName" class="form-label">Họ và Tên</label>
                <form:input type="text" class="form-control ${not empty errorFullName ? 'is-invalid' : ''}" id="fullName"  placeholder="Nhập vào Họ và Tên" path="fullName"/>
                ${errorFullName}
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <form:input
                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                        id="email" type="email" placeholder="Nhập email" path="email" />
                    ${errorEmail}
            </div>

            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Email</label>
                <form:input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại"  path="phoneNumber"/>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Chọn vai trò</label>
                <form:select path="role_id" id="role" class="form-select">
                    <form:option value="" label="-- Chọn vai trò --"/>
                    <form:option value="1" label="Người cho thuê"/>
                    <form:option value="2" label="Người thuê"/>
                </form:select>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <form:input
                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                        id="password" type="password" placeholder="Nhập mật khẩu" path="password"/>
                    ${errorPassword}
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                <form:input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" path="confirmPassword"/>
            </div>

            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Đăng ký</button>
            </div>

            <p class="text-center mb-0">
                Đã có tài khoản?
                <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">Đăng nhập ngay</a>
            </p>
        </form:form>
    </div>
</div>
</body>
</html>

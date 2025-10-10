<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="container p-4">
        <h4 class="mb-4"><i class="fas fa-user me-2"></i> Chi tiết người dùng</h4>
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="text-center mb-4">
                    <c:choose>
                        <c:when test="${not empty user.avatar}">
                            <img src="${pageContext.request.contextPath}/images/avatar/${user.avatar}" alt="Avatar" width="100" height="100">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/avatar/default-avatar.jpg" alt="Default Avatar" width="100" height="100">
                        </c:otherwise>
                    </c:choose>
    <h5 class="mt-3">${user.fullName}</h5>
                    <span class="badge bg-info text-dark">${user.role.name}</span>
                </div>

                <table class="table table-bordered">
                    <tr><th>Email</th><td>${user.email}</td></tr>
                    <tr><th>Số điện thoại</th><td>${user.phoneNumber}</td></tr>
                    <tr><th>Địa chỉ</th><td>${user.address}</td></tr>
                    <tr><th>Ngày tạo</th><td>${user.createdAt}</td></tr>
                </table>

                <div class="d-flex justify-content-end mt-3">
                    <a href="/admin/user" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

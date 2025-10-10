<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>

<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>
    <div class="content-wrapper">
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4><i class="fas fa-users me-2"></i> Quản Lý Người Dùng</h4>
                <a href="/admin/user/create" class="btn btn-primary"><i class="fas fa-plus me-1"></i> Thêm mới</a>
            </div>

            <table class="table table-bordered table-hover bg-white">
                <thead class="table-primary">
                <tr>
                    <th>Id</th>
                    <th>Tên người dùng</th>
                    <th>Email</th>
                    <th>Vai trò</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.role.name}</td>
                    <td>${user.createdAt}</td>
                    <td>
                        <!-- Nút xem chi tiết -->
                        <a href="/admin/user/detail/${user.id}" class="btn btn-success btn-sm">
                            <i class="fas fa-eye"></i>
                        </a>

                        <!-- Nút sửa -->
                        <a href="/admin/user/update/${user.id}" class="btn btn-warning btn-sm">
                            <i class="fas fa-pen"></i>
                        </a>

                        <!-- Nút xóa -->
                        <a href="/admin/user/delete/${user.id}" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i>
                        </a>
<%--                        <form action="/admin/user/delete/${user.id}" method="post" style="display:inline;">--%>
<%--                            <button type="submit" class="btn btn-danger btn-sm"--%>
<%--                                    onclick="return confirm('Bạn có chắc muốn xóa người dùng này không?')">--%>
<%--                                <i class="fas fa-trash"></i>--%>
<%--                            </button>--%>
<%--                        </form>--%>

                    </td>
                </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

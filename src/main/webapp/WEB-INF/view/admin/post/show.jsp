<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Tin Đăng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="content-wrapper">
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4><i class="fas fa-newspaper me-2"></i> Quản Lý Tin Đăng</h4>
                <button class="btn btn-primary" onclick="window.location.href='/admin/post/create'">
                    <i class="fas fa-plus me-1"></i> Thêm mới
                </button>

            </div>

            <c:if test="${empty posts}">
                <div class="alert alert-warning text-center" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i> Hiện tại không có người dùng nào.
                </div>
            </c:if>
            <c:if test="${not empty posts}">
                <table class="table table-bordered table-hover bg-white">
                    <thead class="table-primary text-center">
                    <tr>
                        <th>Id</th>
                        <th>Tiêu đề</th>
                        <th>Người đăng</th>
                        <th>Ngày đăng</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle text-center">
                    <c:forEach var="post" items="${posts}" >
                        <tr>
                            <td>${post.id}</td>
                            <td>${post.title}</td>
                            <td>${post.user.fullName}</td>
                            <td>${post.createdAtFormatted}</td>
                            <td><span class="badge bg-success">${post.status}</span></td>
                            <td>
                                <a href="/admin/post/detail/${post.id}" class="btn btn-sm btn-info"><i class="fas fa-eye"></i></a>
                                <a href="/admin/post/hide/${post.id}" class="btn btn-sm btn-warning"><i class="fas fa-eye-slash"></i></a>
                                <a href="/admin/post/delete/${post.id}" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <table class="table table-bordered table-hover bg-white">
                </table>
            </c:if>
            <c:if test="${totalPages > 0}">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="${1 eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/admin/post?page=${currentPage -1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                            <li class="page-item"><a
                                    class="${loop.index+1 eq currentPage ? 'active page-link': 'page-link'}"
                                    href="/admin/post?page=${loop.index+1}">${loop.index +1}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="${totalPages eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/admin/post?page=${currentPage +1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

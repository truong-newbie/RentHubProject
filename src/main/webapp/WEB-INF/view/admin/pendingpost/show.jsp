<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tin Chờ Duyệt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body >
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="content-wrapper">
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4><i class="fas fa-clock me-2"></i> Tin Chờ Duyệt</h4>
            </div>
            <%-- Phần kiểm tra tổng quát --%>
            <c:if test="${empty pendingPosts}">
                <div class="alert alert-warning text-center" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i> Hiện tại không có tin đăng nào đang chờ duyệt.
                </div>
            </c:if>

            <c:if test="${not empty pendingPosts}">
                <table class="table table-bordered table-hover bg-white">
                    <thead class="table-primary">
                    <tr>
                        <th>STT</th>
                        <th>Tiêu đề</th>
                        <th>Người đăng</th>
                        <th>Ngày gửi</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pendingPost" items="${pendingPosts}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${pendingPost.title}</td>
                            <td>${pendingPost.user.fullName}</td>
                            <td>${pendingPost.createdAtFormatted}</td>
                            <td>
                                <a href="/admin/pendingpost/detail/${pendingPost.id}" class="btn btn-sm btn-info me-1">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="/admin/pendingpost/approve/${pendingPost.id}" class="btn btn-sm btn-success me-1">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="/admin/pendingpost/reject/${pendingPost.id}" class="btn btn-sm btn-danger">
                                    <i class="fas fa-times"></i>
                                </a>
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

                            <%-- Nút Previous --%>
                        <li class="page-item">
                            <a class="${1 eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/admin/pendingpost?page=${currentPage -1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>

                            <%-- Vòng lặp các nút số trang --%>
                        <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                            <li class="page-item"><a
                                    class="${loop.index+1 eq currentPage ? 'active page-link': 'page-link'}"
                                    href="/admin/pendingpost?page=${loop.index+1}">${loop.index +1}</a>
                            </li>
                        </c:forEach>

                            <%-- Nút Next --%>
                        <li class="page-item">
                            <a class="${totalPages eq currentPage ? 'disabled page-link': 'page-link'}"
                               href="/admin/pendingpost?page=${currentPage +1}" aria-label="Next">
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

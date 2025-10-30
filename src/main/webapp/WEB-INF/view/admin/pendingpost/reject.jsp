<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Từ chối bài viết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="container p-4 text-center">
        <div class="card p-4 shadow-sm">
            <h4 class="text-danger mb-4"><i class="fas fa-times-circle"></i> Xác nhận từ chối bài viết</h4>
            <p>Bạn có chắc muốn <strong class="text-danger">từ chối</strong> bài viết này không?</p>

            <form action="/admin/pendingpost/reject/${post.id}" method="post" class="d-inline">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-danger me-2">
                    <i class="fas fa-times"></i> Từ chối
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

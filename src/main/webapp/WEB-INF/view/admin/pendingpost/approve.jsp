<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Duyệt bài viết</title>
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
            <h4 class="text-success mb-4"><i class="fas fa-check-circle"></i> Xác nhận duyệt bài viết</h4>
            <p>Bạn có chắc muốn <strong class="text-success">duyệt</strong> bài viết này không?</p>

            <form action="/admin/pendingpost/approve/${post.id}" method="post" class="d-inline">
                <button type="submit" class="btn btn-success me-2">
                    <i class="fas fa-check"></i> Duyệt
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

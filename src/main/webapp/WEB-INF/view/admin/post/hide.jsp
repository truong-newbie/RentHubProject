<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Ẩn bài viết</title>
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
            <h4 class="text-warning mb-4"><i class="fas fa-eye-slash"></i> Ẩn bài viết</h4>
            <p>Bạn có chắc muốn ẩn bài viết này không?</p>

            <form action="/admin/post/hide/1" method="post" class="d-inline">
                <button type="submit" class="btn btn-warning me-2"><i class="fas fa-eye-slash"></i> Ẩn</button>
            </form>

        </div>
    </div>
</div>
</body>
</html>

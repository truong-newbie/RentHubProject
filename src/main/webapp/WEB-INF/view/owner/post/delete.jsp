<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xóa bài viết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
</head>

<body class="d-flex align-items-center justify-content-center vh-100 bg-light">

<div class="card p-4 shadow-sm text-center" style="min-width: 380px;">
    <h4 class="text-danger mb-4">
        <i class="fas fa-trash"></i> Xóa bài viết
    </h4>

    <p>Bạn có chắc muốn xóa bài viết này không?</p>

    <form action="/owner/post/delete/${post.id}" method="post" class="d-inline">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit" class="btn btn-danger me-2">
            <i class="fas fa-trash"></i> Xóa
        </button>
    </form>
</div>

</body>
</html>

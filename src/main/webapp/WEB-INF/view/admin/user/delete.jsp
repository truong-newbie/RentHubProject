<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xóa người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="container p-4 text-center">
        <div class="card p-4 shadow-sm">
            <h4 class="text-danger mb-4"><i class="fas fa-exclamation-triangle"></i> Xóa người dùng</h4>
            <p>Bạn có chắc muốn xóa người dùng <strong>${user.fullName}</strong> không?</p>

            <form action="/admin/user/delete/${user.id}" method="post" class="d-inline">
                <button type="submit" class="btn btn-danger btn-sm me-2">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </form>

        </div>
    </div>
</div>
</body>
</html>

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

            <table class="table table-bordered table-hover bg-white">
                <thead class="table-primary text-center">
                <tr>
                    <th>#</th>
                    <th>Tiêu đề</th>
                    <th>Người đăng</th>
                    <th>Ngày đăng</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody class="align-middle text-center">
                <tr>
                    <td>1</td>
                    <td>Phòng trọ quận 1, giá rẻ</td>
                    <td>Nguyễn Văn A</td>
                    <td>08/10/2025</td>
                    <td><span class="badge bg-success">Đã duyệt</span></td>
                    <td>
                        <a href="/admin/post/detail/1" class="btn btn-sm btn-info"><i class="fas fa-eye"></i></a>
                        <a href="/admin/post/hide/1" class="btn btn-sm btn-warning"><i class="fas fa-eye-slash"></i></a>
                        <a href="/admin/post/delete/1" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

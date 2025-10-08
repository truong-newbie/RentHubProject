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
                <button class="btn btn-primary"><i class="fas fa-plus me-1"></i> Thêm mới</button>
            </div>

            <table class="table table-bordered table-hover bg-white">
                <thead class="table-primary">
                <tr>
                    <th>#</th>
                    <th>Tiêu đề</th>
                    <th>Người đăng</th>
                    <th>Ngày gửi</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Phòng trọ quận 9, gần ĐH SPKT</td>
                    <td>Trần Thị B</td>
                    <td>07/10/2025</td>
                    <td>
                        <button class="btn btn-sm btn-success"><i class="fas fa-check"></i></button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-times"></i></button>
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

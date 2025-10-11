<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết bài đăng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="container p-4">
        <div class="card p-4 shadow-sm">
            <h4><i class="fas fa-eye text-primary"></i> Chi tiết bài đăng</h4>
            <hr>
            <p><strong>Tiêu đề:</strong> ${post.title}</p>
            <p><strong>Người đăng:</strong> ${post.user.fullName}</p>
            <p><strong>Ảnh minh họa:</strong> </p>

            <c:choose>
                <c:when test="${not empty post.images}">
                    <div class="d-flex flex-wrap gap-2 mt-3">
                        <c:forEach var="img" items="${post.images}">
                            <img src="${pageContext.request.contextPath}/images/roomImages/${img}"
                                 alt="Ảnh phòng"
                                 class="img-thumbnail"
                                 style="width: 120px; height: 120px; object-fit: cover;">
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/roomImages/default_roomImage.png" alt="Default roomImage" width="100" height="100">
                </c:otherwise>
            </c:choose>


            <p><strong>Giá cả :</strong> ${post.price}</p>
            <p><strong>Địa chỉ :</strong> ${post.address}</p>
            <p><strong>Ngày đăng:</strong> ${post.createdAtFormatted}</p>
            <p><strong>Mô tả:</strong> ${post.description}</p>
            <p><strong>Trạng thái:</strong> <span class="badge bg-success">${post.status}</span></p>
            <p><strong>Loại hình :</strong> ${post.rentalType}</p>

            <a href="/admin/post" class="btn btn-secondary mt-3">
                <i class="fas fa-arrow-left"></i> Quay lại
            </a>
        </div>
    </div>
</div>
</body>
</html>

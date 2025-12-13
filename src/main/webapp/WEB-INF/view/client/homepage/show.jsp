<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhatro247 - Tìm Nhà Trọ Toàn Quốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/client/styles.css" rel="stylesheet" >
</head>
<body>

<jsp:include page="../layout/header.jsp"/>

<jsp:include page="../layout/banner.jsp"/>

<!-- Hot Listings -->
<section class="container">
    <h2 class="section-title">LỰA CHỌN CHO Ở HOT</h2>
    <div class="row g-3">
        <c:forEach var="post" items="${posts}">
            <div class="col-lg-3 col-md-6">
                <div class="property-card">
                    <div class="property-img">
                        <c:choose>
                            <c:when test="${empty post.images}">
                                <img src="${pageContext.request.contextPath}/resources/images/roomImages/default_roomImage.png" alt="Ảnh mặc định">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/roomImages/${post.images[0]}" alt="${post.title}">
                            </c:otherwise>
                        </c:choose>
                        <span class="hot-badge">HOT</span>
                        <button class="heart-btn"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="property-info">
                        <div class="property-price">Từ ${post.price} triệu/tháng</div>
                        <a href="/room/${post.id}" class="property-title">${post.title}</a>
                        <div class="property-type">${post.rentalType}</div>
                        <div class="property-location">
                            <i class="fas fa-map-marker-alt"></i>
                                ${post.address}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
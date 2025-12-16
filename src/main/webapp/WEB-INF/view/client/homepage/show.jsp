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

    <c:if test="${empty posts}">
        <div class="alert alert-warning text-center" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i> Hiện tại chưa có bài đăng phòng trọ nào .
        </div>
    </c:if>
    <c:if test="${not empty posts}">
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

        </div>        <table class="table table-bordered table-hover bg-white">
        </table>
    </c:if>
    <c:if test="${totalPages > 0}">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="${1 eq currentPage ? 'disabled page-link': 'page-link'}"
                       href="/?page=${currentPage -1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                    <li class="page-item"><a
                            class="${loop.index+1 eq currentPage ? 'active page-link': 'page-link'}"
                            href="/?page=${loop.index+1}">${loop.index +1}</a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="${totalPages eq currentPage ? 'disabled page-link': 'page-link'}"
                       href="/?page=${currentPage +1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </c:if>
</section>

<jsp:include page="../layout/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
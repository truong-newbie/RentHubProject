<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trợ Mối - Tìm Nhà Trọ Toàn Quốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/client/css/styles.css" rel="stylesheet" type="text/css">
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
                        <img src="${pageContext.request.contextPath}/resources/images/roomImages/${post.images[0]}" alt="${post.title}">
                        <span class="hot-badge">HOT</span>
                        <button class="heart-btn"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="property-info">
                        <div class="property-price">Từ ${post.price} triệu/tháng</div>
                        <div class="property-title">${post.title}</div>
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

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel"><i class="fas fa-sign-in-alt"></i> Đăng Nhập</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Email hoặc Số điện thoại</label>
                        <input type="text" class="form-control" id="loginEmail" placeholder="Nhập email hoặc số điện thoại">
                    </div>
                    <div class="mb-3">
                        <label for="loginPassword" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="loginPassword" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">
                            Ghi nhớ tôi
                        </label>
                    </div>
                    <button type="submit" class="btn-login">Đăng Nhập</button>

                    <div class="auth-divider">
                        <span>hoặc</span>
                    </div>

                    <div class="social-login">
                        <button type="button"><i class="fab fa-facebook-f"></i> Facebook</button>
                        <button type="button"><i class="fab fa-google"></i> Google</button>
                    </div>

                    <div class="auth-link">
                        <a href="#">Quên mật khẩu?</a>
                    </div>
                    <div class="auth-link">
                        Chưa có tài khoản? <a href="#register" data-bs-toggle="modal" data-bs-target="#registerModal" data-bs-dismiss="modal">Đăng ký ngay</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Register Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel"><i class="fas fa-user-plus"></i> Đăng Ký</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Họ và Tên</label>
                        <input type="text" class="form-control" id="fullName" placeholder="Nhập họ và tên">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="mb-3">
                        <label for="registerEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="registerEmail" placeholder="Nhập email">
                    </div>
                    <div class="mb-3">
                        <label for="registerPassword" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="registerPassword" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                        <input type="password" class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu">
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="agreeTerms">
                        <label class="form-check-label" for="agreeTerms">
                            Tôi đồng ý với <a href="#">Điều khoản sử dụng</a>
                        </label>
                    </div>
                    <button type="submit" class="btn-login">Đăng Ký</button>

                    <div class="auth-divider">
                        <span>hoặc</span>
                    </div>

                    <div class="social-login">
                        <button type="button"><i class="fab fa-facebook-f"></i> Facebook</button>
                        <button type="button"><i class="fab fa-google"></i> Google</button>
                    </div>

                    <div class="auth-link">
                        Đã có tài khoản? <a href="#login" data-bs-toggle="modal" data-bs-target="#loginModal" data-bs-dismiss="modal">Đăng nhập</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
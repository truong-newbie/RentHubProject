<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top-navbar d-flex justify-content-end align-items-center gap-3">
    <div class="dropdown">
        <button class="btn btn-light dropdown-toggle d-flex align-items-center gap-2" type="button" data-bs-toggle="dropdown">
            <c:choose>
                <c:when test="${not empty sessionScope.avatar}">
                        <c:forEach var="img" items="${post.images}">
                            <img src="${pageContext.request.contextPath}/images/avatar/${sessionScope.avatar}" class="user-avatar" alt="Admin">
                        </c:forEach>
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/avatar/default-avatar.jpg" alt="Default roomImage" class="user-avatar">
                </c:otherwise>
            </c:choose>
            <span>${sessionScope.fullName}</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i> Hồ Sơ</a></li>
            <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i> Cài Đặt</a></li>
            <li><hr class="dropdown-divider"></li>
            <li>
                <form method="post" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button class="dropdown-item text-danger"> Đăng xuất</button>
                </form>
            </li>
        </ul>
    </div>
</div>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật người dùng</title>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
            });
        });
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="container p-4">
        <h4 class="mb-4"><i class="fas fa-user-edit me-2"></i> Cập nhật người dùng</h4>

        <form:form action="/admin/user/update/${user.id}" method="post" enctype="multipart/form-data"
              class="card p-4 shadow-sm" modelAttribute="updateUser">
            <div class="mb-3 text-center">
                <div class="col-12 mb-3">
                    <img style="max-height:250px ; display:none;" alt="avatar preview"
                         id="avatarPreview"/>
                </div>
                <div class="mb-4">
                    <input class="form-control" type="file" id="avatarFile"
                           name="TruongFile"
                           accept=".png , .jpg, .jpeg">
                </div>
            </div>

            <div class="mb-3">
                <c:set var="errorFullName">
                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                </c:set>
                <label>Họ và tên</label>
                <form:input type="fullName" class="form-control ${not empty errorFullName ? 'is-invalid' :'' }" path="fullName"/>
                    ${errorFullName}
            </div>

            <div class="mb-3">
                <c:set var="errorEmail">
                    <form:errors path="email" cssClass="invalid-feedback"/>
                </c:set>
                <label>Email</label>
                <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' :'' }" path="email"/>
                    ${errorEmail}
            </div>

            <div class="mb-3">
                <label>Số điện thoại</label>
                <form:input type="text" class="form-control" name="phoneNumber" path="phoneNumber" />
            </div>

            <div class="mb-3">
                <label>Địa chỉ</label>
                <form:input type="text" class="form-control" name="address"  path="address"/>
                <div class="mb-3">
                    <label>Vai trò</label>
                    <form:select class="form-select"  path="role.name">
                        <form:option value="">-- Chọn vai trò --</form:option>
                        <form:option value="ADMIN">Admin</form:option>
                        <form:option value="USER">Người dùng</form:option>
                        <form:option value="LANDLORD">Người cho thuê</form:option>
                    </form:select>
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary me-2"><i class="fas fa-save"></i> Lưu</button>
                    <a href="/admin/user" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Hủy</a>
                </div>
        </form:form>
    </div>
</div>
</body>
</html>

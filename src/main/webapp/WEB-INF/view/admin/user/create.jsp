<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <title>Thêm Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>

<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="content-wrapper">
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4><i class="fas fa-user-plus me-2"></i> Thêm Mới Người Dùng</h4>
                <a href="/admin/user" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Quay lại
                </a>
            </div>

            <div class="card shadow-sm">
                <div class="card-body">
                    <form:form action="/admin/user/create" method="post" enctype="multipart/form-data"
                    modelAttribute="newUser">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                </c:set>
                                <label class="form-label">Email</label>
                                <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' :'' }" path="email"/>
                                    ${errorEmail}
                            </div>
                            <div class="col-md-6">
                                <c:set var="errorPassword">
                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                </c:set>
                                <label class="form-label">Mật khẩu</label>
                                <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" path="password"/>
                                    ${errorPassword}
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <c:set var="errorFullName">
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                </c:set>
                                <label class="form-label">Họ tên</label>
                                <form:input type="fullName" class="form-control ${not empty errorFullName ? 'is-invalid' :'' }" path="fullName"/>
                                    ${errorFullName}
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Số điện thoại</label>
                                <form:input type="text" class="form-control" path="phoneNumber" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-8">
                                <label class="form-label">Địa chỉ</label>
                                <form:input type="text" class="form-control" path="address"/>
                            </div>
                            <div class="col-md-4">
                                <c:set var="errorRole">
                                    <form:errors path="role" cssClass="invalid-feedback"/>
                                </c:set>
                                <label class="form-label">Vai trò</label>
                                <form:select path="role" class="form-select ${not empty errorRole ? 'is-invalid' : ''}">
                                    <form:option value="">-- Chọn vai trò --</form:option>
                                    <form:option value="1">Người cho thuê</form:option>
                                    <form:option value="2">Người thuê phòng</form:option>
                                    <form:option value="3">Admin</form:option>
                                </form:select>
                                ${errorRole}
                            </div>
                        </div>

                        <div>
                            <div class="mb-4">
                                <label class="form-label">Ảnh đại diện (Avatar)</label>
                                <input class="form-control" type="file" id="avatarFile"
                                       name="TruongFile"
                                       accept=".png , .jpg, .jpeg">
                            </div>
                            <div class="col-12 mb-3">
                                <img style="max-height:250px ; display:none;" alt="avatar preview"
                                     id="avatarPreview"/>
                            </div>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="fas fa-save me-1"></i> Tạo mới
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

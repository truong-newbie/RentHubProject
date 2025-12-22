<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật người dùng</title>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            font-size: 14px;
        }

        .update-user-card {
            border-radius: 6px;
            border: 1px solid #dee2e6;
            background: #fff;
        }

        .page-header {
            background: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
        }

        .page-header h4 {
            margin: 0;
            font-size: 16px;
            font-weight: 600;
            color: #212529;
        }

        .avatar-section {
            background: #fff;
            border: 1px solid #dee2e6;
            padding: 1.25rem;
            text-align: center;
            border-radius: 6px;
            margin-bottom: 1.5rem;
        }

        .current-avatar-wrapper {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto 1rem;
            border: 1px solid #dee2e6;
        }

        .current-avatar-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .upload-button-styled {
            background: #e9ecef;
            color: #212529;
            padding: 6px 14px;
            border-radius: 4px;
            font-size: 14px;
            border: 1px solid #ced4da;
        }

        .form-section {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1.25rem;
            background: #fff;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 1rem;
            color: #343a40;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 0.25rem;
            color: #495057;
        }

        .form-control,
        .form-select {
            border-radius: 4px;
            border: 1px solid #ced4da;
            font-size: 14px;
        }

        .form-control:focus,
        .form-select:focus {
            box-shadow: none;
            border-color: #86b7fe;
        }

        .invalid-feedback {
            font-size: 13px;
        }

        .btn-save {
            background: #0d6efd;
            border: none;
            padding: 6px 16px;
            font-size: 14px;
            border-radius: 4px;
            color: #fff;
        }

        .btn-cancel {
            background: #6c757d;
            border: none;
            padding: 6px 16px;
            font-size: 14px;
            border-radius: 4px;
            color: #fff;
        }

        .btn-save:hover,
        .btn-cancel:hover {
            opacity: 0.9;
        }

        .info-badge {
            display: none;
        }

        .section-divider {
            display: none;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/sidebar.jsp" />

<div class="main-content">
    <jsp:include page="../layout/header.jsp" />

    <div class="container p-4">
        <div class="card update-user-card shadow-lg p-4">
            <div class="page-header">
                <h4><i class="fas fa-user-edit"></i> Cập nhật người dùng</h4>
            </div>

            <form:form action="${pageContext.request.contextPath}/admin/user/update/${updateUser.id}"
                       method="post"
                       enctype="multipart/form-data"
                       modelAttribute="updateUser">
                <form:hidden path="id"/>

                <!-- Avatar Section -->
                <div class="avatar-section">
                    <h5 class="section-title justify-content-center">
                        <i class="fas fa-camera"></i> Ảnh đại diện
                    </h5>

                    <div class="current-avatar-wrapper">
                        <c:choose>
                            <c:when test="${not empty updateUser.avatar}">
                                <img src="${pageContext.request.contextPath}/images/avatar/${updateUser.avatar}" alt="Current Avatar">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/images/avatar/default-avatar.jpg" alt="Default Avatar">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="avatar-upload-btn">
                        <label class="upload-button-styled">
                            <i class="fas fa-cloud-upload-alt"></i> Chọn ảnh mới
                            <input class="form-control" type="file" id="avatarFile"
                                   name="TruongFile"
                                   accept=".png, .jpg, .jpeg">
                        </label>
                    </div>

                    <span class="info-badge">
                        <i class="fas fa-info-circle"></i> PNG, JPG, JPEG
                    </span>

                    <div class="preview-wrapper" id="previewWrapper">
                        <div class="preview-label">
                            <i class="fas fa-eye"></i> Xem trước
                        </div>
                        <div class="preview-avatar">
                            <img alt="avatar preview" id="avatarPreview"/>
                        </div>
                    </div>
                </div>

                <hr class="section-divider">

                <!-- Personal Information -->
                <div class="form-section">
                    <h5 class="section-title">
                        <i class="fas fa-user"></i> Thông tin cá nhân
                    </h5>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <c:set var="errorFullName">
                                <form:errors path="fullName" cssClass="invalid-feedback"/>
                            </c:set>
                            <label class="form-label">
                                <i class="fas fa-id-card"></i> Họ và tên
                                <span class="required-mark">*</span>
                            </label>
                            <form:input type="text" class="form-control ${not empty errorFullName ? 'is-invalid' :'' }" path="fullName"/>
                                ${errorFullName}
                        </div>

                        <div class="col-md-6 mb-3">
                            <c:set var="errorEmail">
                                <form:errors path="email" cssClass="invalid-feedback"/>
                            </c:set>
                            <label class="form-label">
                                <i class="fas fa-envelope"></i> Email
                                <span class="required-mark">*</span>
                            </label>
                            <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' :'' }" path="email"/>
                                ${errorEmail}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                <i class="fas fa-phone"></i> Số điện thoại
                            </label>
                            <form:input type="text" class="form-control" path="phoneNumber" />
                        </div>

                        <div class="col-md-6 mb-3">
                            <c:set var="errorRole">
                                <form:errors path="role" cssClass="invalid-feedback"/>
                            </c:set>
                            <label class="form-label">
                                <i class="fas fa-shield-alt"></i> Vai trò
                                <span class="required-mark">*</span>
                            </label>
                            <form:select path="role.id" class="form-select ${not empty errorRole ? 'is-invalid' : ''}">
                                <form:option value="1">👤 Người cho thuê</form:option>
                                <form:option value="2">🏠 Người thuê phòng</form:option>
                                <form:option value="3">⚡ Admin</form:option>
                            </form:select>
                                ${errorRole}
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            <i class="fas fa-map-marker-alt"></i> Địa chỉ
                        </label>
                        <form:input type="text" class="form-control" path="address"/>
                    </div>
                </div>

                <hr class="section-divider">

                <!-- Action Buttons -->
                <div class="d-flex justify-content-center gap-3">
                    <button type="submit" class="btn-save">
                        <i class="fas fa-check-circle me-2"></i> Lưu thay đổi
                    </button>
                    <a href="/admin/user" class="btn-cancel">
                        <i class="fas fa-times-circle me-2"></i> Hủy bỏ
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script>
    // Enhanced preview functionality
    document.getElementById('avatarFile').addEventListener('change', function(e) {
        const previewWrapper = document.getElementById('previewWrapper');
        if (e.target.files && e.target.files[0]) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            document.getElementById('avatarPreview').src = imgURL;
            previewWrapper.style.display = 'block';
        }
    });
</script>
</body>
</html>
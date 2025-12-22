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
    <style>
        body {
            background-color: #f5f6f8;
        }

        .create-user-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
        }

        .page-header {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
            padding: 1.25rem;
            margin: -1rem -1rem 1.5rem -1rem;
            border-radius: 8px 8px 0 0;
        }

        .page-header h4 {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: #212529;
        }

        .form-section {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 1.25rem;
            margin-bottom: 1.5rem;
            background-color: #ffffff;
        }

        .section-title {
            font-size: 1rem;
            font-weight: 600;
            color: #212529;
            margin-bottom: 1rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.35rem;
        }

        .required-mark {
            color: #dc3545;
        }

        .form-control,
        .form-select {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 0.5rem 0.75rem;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #86b7fe;
            box-shadow: none;
        }

        .form-control.is-invalid,
        .form-select.is-invalid {
            border-color: #dc3545;
        }

        .invalid-feedback {
            display: block;
            font-size: 0.85rem;
            margin-top: 0.25rem;
        }

        .info-badge {
            display: inline-block;
            margin-top: 0.4rem;
            font-size: 0.85rem;
            color: #6c757d;
        }

        .section-divider {
            border-top: 1px solid #dee2e6;
            margin: 1.5rem 0;
        }

        /* Avatar upload */
        .avatar-upload-section {
            border: 1px dashed #adb5bd;
            border-radius: 6px;
            padding: 1.25rem;
            text-align: center;
            background-color: #f8f9fa;
            position: relative;
        }

        .avatar-upload-section input[type="file"] {
            position: absolute;
            inset: 0;
            opacity: 0;
            cursor: pointer;
        }

        .upload-icon {
            font-size: 2rem;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }

        .upload-text {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .preview-wrapper {
            margin-top: 1rem;
            display: none;
            text-align: center;
        }

        .preview-container {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            overflow: hidden;
            border: 1px solid #dee2e6;
            margin: 0 auto;
        }

        .preview-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Buttons */
        .btn-create {
            background-color: #0d6efd;
            border-radius: 6px;
            padding: 0.45rem 1.5rem;
            font-weight: 500;
        }

        .btn-back {
            background-color: #6c757d;
            border-radius: 6px;
            padding: 0.4rem 1.25rem;
            font-weight: 500;
            color: #fff;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>

<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="content-wrapper">
        <div class="container-fluid p-4">
            <div class="card create-user-card shadow-lg">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4>
                            <i class="fas fa-user-plus"></i> Thêm Mới Người Dùng
                        </h4>
                        <a href="/admin/user" class="btn btn-back">
                            <i class="fas fa-arrow-left me-2"></i> Quay lại
                        </a>
                    </div>
                </div>

                <div class="card-body p-4">
                    <form:form action="/admin/user/create" method="post" enctype="multipart/form-data"
                               modelAttribute="newUser">

                        <!-- Thông tin đăng nhập -->
                        <div class="form-section">
                            <h5 class="section-title">
                                <i class="fas fa-lock"></i> Thông tin đăng nhập
                            </h5>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">
                                        <i class="fas fa-envelope"></i> Email
                                        <span class="required-mark">*</span>
                                    </label>
                                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' :'' }"
                                                path="email" placeholder="example@email.com"/>
                                        ${errorEmail}
                                </div>

                                <div class="col-md-6 mb-3">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">
                                        <i class="fas fa-key"></i> Mật khẩu
                                        <span class="required-mark">*</span>
                                    </label>
                                    <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                path="password" placeholder="••••••••"/>
                                        ${errorPassword}
                                    <span class="info-badge">
                                        <i class="fas fa-info-circle"></i> Tối thiểu 6 ký tự
                                    </span>
                                </div>
                            </div>
                        </div>

                        <hr class="section-divider">

                        <!-- Thông tin cá nhân -->
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
                                        <i class="fas fa-signature"></i> Họ và tên
                                        <span class="required-mark">*</span>
                                    </label>
                                    <form:input type="text" class="form-control ${not empty errorFullName ? 'is-invalid' :'' }"
                                                path="fullName" placeholder="Nguyễn Văn A"/>
                                        ${errorFullName}
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        <i class="fas fa-phone"></i> Số điện thoại
                                    </label>
                                    <form:input type="text" class="form-control" path="phoneNumber"
                                                placeholder="0123456789"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">
                                        <i class="fas fa-map-marker-alt"></i> Địa chỉ
                                    </label>
                                    <form:input type="text" class="form-control" path="address"
                                                placeholder="Số nhà, Đường, Phường/Xã, Quận/Huyện, Tỉnh/Thành phố"/>
                                </div>
                            </div>
                        </div>

                        <hr class="section-divider">

                        <!-- Vai trò và quyền hạn -->
                        <div class="form-section">
                            <h5 class="section-title">
                                <i class="fas fa-shield-alt"></i> Vai trò và quyền hạn
                            </h5>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <c:set var="errorRole">
                                        <form:errors path="role" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">
                                        <i class="fas fa-user-tag"></i> Vai trò
                                        <span class="required-mark">*</span>
                                    </label>
                                    <form:select path="role" class="form-select ${not empty errorRole ? 'is-invalid' : ''}">
                                        <form:option value="">-- Chọn vai trò --</form:option>
                                        <form:option value="1">🏠 Người cho thuê</form:option>
                                        <form:option value="2">👤 Người thuê phòng</form:option>
                                        <form:option value="3">⚙️ Admin</form:option>
                                    </form:select>
                                        ${errorRole}
                                </div>
                            </div>
                        </div>

                        <hr class="section-divider">

                        <!-- Ảnh đại diện -->
                        <div class="form-section">
                            <h5 class="section-title">
                                <i class="fas fa-camera"></i> Ảnh đại diện
                            </h5>

                            <div class="avatar-upload-section">
                                <div class="upload-icon">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                </div>
                                <div class="upload-text">
                                    <strong>Kéo thả ảnh vào đây</strong> hoặc click để chọn
                                    <br>
                                    <small class="text-muted">Hỗ trợ: PNG, JPG, JPEG</small>
                                </div>
                                <input class="form-control" type="file" id="avatarFile"
                                       name="TruongFile"
                                       accept=".png, .jpg, .jpeg">
                            </div>

                            <div class="preview-wrapper" id="previewWrapper">
                                <div class="preview-container">
                                    <img alt="avatar preview" id="avatarPreview"/>
                                </div>
                            </div>
                        </div>

                        <hr class="section-divider">

                        <!-- Submit Button -->
                        <div class="text-center pt-3">
                            <button type="submit" class="btn btn-create">
                                <i class="fas fa-user-check me-2"></i> Tạo người dùng mới
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
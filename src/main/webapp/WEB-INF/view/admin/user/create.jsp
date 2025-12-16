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
        .create-user-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            margin: -1rem -1rem 2rem -1rem;
            border-radius: 16px 16px 0 0;
        }

        .page-header h4 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .form-section {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #495057;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-title i {
            color: #667eea;
            font-size: 1.2rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: #667eea;
            font-size: 0.9rem;
        }

        .required-mark {
            color: #dc3545;
            margin-left: 0.25rem;
        }

        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
        }

        .form-control.is-invalid, .form-select.is-invalid {
            border-color: #dc3545;
        }

        .invalid-feedback {
            display: block;
            font-size: 0.875rem;
            color: #dc3545;
            margin-top: 0.5rem;
            padding-left: 0.5rem;
        }

        .avatar-upload-section {
            background: white;
            border: 3px dashed #667eea;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .avatar-upload-section:hover {
            background: #f8f9fa;
            border-color: #764ba2;
        }

        .avatar-upload-section input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .upload-icon {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .upload-text {
            color: #6c757d;
            font-weight: 500;
        }

        .preview-wrapper {
            margin-top: 1.5rem;
            display: none;
        }

        .preview-container {
            width: 200px;
            height: 200px;
            margin: 0 auto;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid #667eea;
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.2);
        }

        .preview-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .btn-create {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-create:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(102, 126, 234, 0.3);
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color: white;
        }

        .btn-back {
            background: #6c757d;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: #5a6268;
            color: white;
            transform: translateY(-1px);
        }

        .input-icon-wrapper {
            position: relative;
        }

        .input-icon-wrapper i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .input-icon-wrapper .form-control {
            padding-left: 2.75rem;
        }

        .info-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            background: #e7f3ff;
            color: #0066cc;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-top: 0.5rem;
        }

        .role-option-card {
            transition: all 0.3s ease;
        }

        .section-divider {
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, #667eea 50%, transparent 100%);
            border: none;
            margin: 2rem 0;
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
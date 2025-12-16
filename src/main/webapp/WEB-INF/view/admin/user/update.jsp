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
        .update-user-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            margin: -1.5rem -1.5rem 2rem -1.5rem;
        }

        .page-header h4 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .avatar-section {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .current-avatar-wrapper {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto 1.5rem;
            border: 4px solid white;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            position: relative;
        }

        .current-avatar-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .avatar-upload-btn {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }

        .upload-button-styled {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            border: none;
        }

        .upload-button-styled:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(102, 126, 234, 0.3);
        }

        .avatar-upload-btn input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .preview-wrapper {
            margin-top: 1.5rem;
            display: none;
        }

        .preview-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto;
            border: 4px solid #667eea;
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.3);
        }

        .preview-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .preview-label {
            color: #667eea;
            font-weight: 600;
            margin-top: 0.75rem;
            font-size: 0.9rem;
        }

        .form-section {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.1rem;
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
            margin-top: 0.5rem;
            font-size: 0.875rem;
            color: #dc3545;
            font-weight: 500;
        }

        .section-divider {
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, #667eea 50%, transparent 100%);
            border: none;
            margin: 2rem 0;
        }

        .btn-save {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(40, 167, 69, 0.3);
            background: linear-gradient(135deg, #20c997 0%, #28a745 100%);
            color: white;
        }

        .btn-cancel {
            background: #6c757d;
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-cancel:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
            background: #5a6268;
            color: white;
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
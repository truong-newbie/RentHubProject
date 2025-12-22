<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm mới bài viết</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: #f5f6f8;
        }

        .create-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
        }

        .create-header {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
            padding: 1.25rem;
            margin: -1.5rem -1.5rem 1.5rem -1.5rem;
        }

        .create-header h4 {
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

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.4rem;
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

        .input-group-text {
            background-color: #f1f3f5;
            border: 1px solid #ced4da;
            font-weight: 500;
        }

        .required-mark {
            color: #dc3545;
        }

        .info-badge {
            display: inline-block;
            margin-top: 0.5rem;
            font-size: 0.85rem;
            color: #6c757d;
        }

        .file-upload-wrapper {
            border: 1px dashed #adb5bd;
            border-radius: 6px;
            padding: 1.5rem;
            text-align: center;
            background-color: #f8f9fa;
        }

        .file-upload-icon {
            font-size: 2rem;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }

        .file-upload-text {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .preview-item {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            overflow: hidden;
        }

        .preview-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .section-divider {
            border-top: 1px solid #dee2e6;
            margin: 1.5rem 0;
        }

        .btn-save {
            background-color: #0d6efd;
            border-radius: 6px;
            padding: 0.45rem 1.5rem;
            font-weight: 500;
        }

        .btn-cancel {
            background-color: #6c757d;
            border-radius: 6px;
            padding: 0.45rem 1.5rem;
            font-weight: 500;
            color: #fff;
        }
    </style>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#roomFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#roomPreview").attr("src", imgURL);
                $("#roomPreview").css({ "display": "block" });
            });
        });
    </script>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp"/>
<div class="main-content">
    <jsp:include page="../layout/header.jsp"/>

    <div class="container p-4">
        <div class="card create-card p-4 shadow-lg">
            <div class="create-header">
                <h4><i class="fas fa-pen-to-square"></i> Thêm mới bài viết</h4>
            </div>

            <!-- form:form tự bind dữ liệu với modelAttribute="post" -->
            <form:form action="/admin/post/create" method="post" modelAttribute="post" enctype="multipart/form-data">

                <div class="form-section">
                    <h5 class="mb-3" style="color: #495057; font-weight: 600;">
                        <i class="fas fa-info-circle" style="color: #667eea;"></i> Thông tin cơ bản
                    </h5>

                    <div class="mb-3">
                        <label class="form-label">
                            <i class="fas fa-heading"></i> Tiêu đề
                            <span class="required-mark">*</span>
                        </label>
                        <form:input path="title" cssClass="form-control" placeholder="Nhập tiêu đề bài viết..."/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            <i class="fas fa-align-left"></i> Mô tả
                        </label>
                        <form:textarea path="description" cssClass="form-control" rows="5" placeholder="Nhập mô tả chi tiết về bài viết..."/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            <i class="fas fa-dollar-sign"></i> Giá cả
                            <span class="required-mark">*</span>
                        </label>
                        <div class="input-group">
                            <form:input path="price" type="number" cssClass="form-control" placeholder="Nhập giá cả..." />
                            <span class="input-group-text">VNĐ</span>
                        </div>
                        <span class="info-badge">
                            <i class="fas fa-lightbulb"></i> Nhập giá theo đơn vị VNĐ
                        </span>
                    </div>
                </div>

                <hr class="section-divider">

                <div class="form-section">
                    <h5 class="mb-3" style="color: #495057; font-weight: 600;">
                        <i class="fas fa-images" style="color: #667eea;"></i> Hình ảnh
                    </h5>

                    <div class="mb-3">
                        <label class="form-label">
                            <i class="fas fa-camera"></i> Ảnh minh họa
                        </label>
                        <div class="file-upload-wrapper">
                            <div class="file-upload-icon">
                                <i class="fas fa-cloud-upload-alt"></i>
                            </div>
                            <div class="file-upload-text">
                                <strong>Kéo thả ảnh vào đây</strong> hoặc click để chọn
                                <br>
                                <small class="text-muted">Hỗ trợ: PNG, JPG, JPEG (Nhiều ảnh)</small>
                            </div>
                            <input class="form-control" type="file" id="roomFile"
                                   name="TruongFile"
                                   multiple
                                   accept=".png, .jpg, .jpeg">
                        </div>
                    </div>

                    <div class="col-12 mb-3">
                        <div class="preview-item" style="max-width: 200px; display: none;" id="previewWrapper">
                            <img alt="room preview" id="roomPreview"/>
                        </div>
                    </div>
                </div>

                <hr class="section-divider">

                <div class="form-section">
                    <h5 class="mb-3" style="color: #495057; font-weight: 600;">
                        <i class="fas fa-cog" style="color: #667eea;"></i> Cài đặt
                    </h5>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                <i class="fas fa-toggle-on"></i> Trạng thái
                            </label>
                            <form:select path="status" cssClass="form-select">
                                <form:option value="PENDING" label="⏳ Chờ duyệt"/>
                                <form:option value="APPROVED" label="✅ Đã duyệt"/>
                                <form:option value="HIDDEN" label="🚫 Bị ẩn"/>
                            </form:select>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                <i class="fas fa-home"></i> Loại hình cho thuê
                            </label>
                            <form:select path="rentalType" cssClass="form-select">
                                <form:options items="${rentalTypes}" itemValue="name" itemLabel="displayName"/>
                            </form:select>
                        </div>
                    </div>
                </div>

                <hr class="section-divider">

                <div class="text-center pt-3">
                    <button type="submit" class="btn btn-save me-3">
                        <i class="fas fa-check-circle me-2"></i> Lưu bài viết
                    </button>
                    <a href="/admin/post" class="btn btn-cancel">
                        <i class="fas fa-times-circle me-2"></i> Hủy bỏ
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script>
    // Enhanced preview functionality
    document.getElementById('roomFile').addEventListener('change', function(e) {
        const previewWrapper = document.getElementById('previewWrapper');
        if (e.target.files && e.target.files[0]) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            document.getElementById('roomPreview').src = imgURL;
            previewWrapper.style.display = 'block';
        }
    });
</script>
</body>
</html>
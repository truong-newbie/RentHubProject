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
        .create-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }

        .create-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            margin: -1.5rem -1.5rem 2rem -1.5rem;
        }

        .create-header h4 {
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

        .input-group {
            border-radius: 8px;
            overflow: hidden;
        }

        .input-group-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: 600;
            padding: 0.75rem 1.25rem;
        }

        .file-upload-wrapper {
            position: relative;
            border: 3px dashed #667eea;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            background: white;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .file-upload-wrapper:hover {
            background: #f8f9fa;
            border-color: #764ba2;
        }

        .file-upload-wrapper input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-upload-icon {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .file-upload-text {
            color: #6c757d;
            font-weight: 500;
        }

        .preview-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .preview-item {
            position: relative;
            padding-bottom: 100%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .preview-item img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .btn-save {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(40, 167, 69, 0.3);
            background: linear-gradient(135deg, #20c997 0%, #28a745 100%);
        }

        .btn-cancel {
            background: #6c757d;
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-cancel:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
            background: #5a6268;
        }

        .form-floating-label {
            position: relative;
        }

        .required-mark {
            color: #dc3545;
            margin-left: 0.25rem;
        }

        .section-divider {
            height: 2px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border: none;
            margin: 2rem 0;
            border-radius: 2px;
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
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
        <div class="card p-4 shadow-sm">
            <h4 class="mb-4 text-primary"><i class="fas fa-plus-circle"></i> Thêm mới bài viết</h4>

            <!-- form:form tự bind dữ liệu với modelAttribute="post" -->
            <form:form action="/admin/post/create" method="post"  modelAttribute="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Tiêu đề</label>
                    <form:input path="title" cssClass="form-control" placeholder="Nhập tiêu đề bài viết..."/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <form:textarea path="description" cssClass="form-control" rows="4" placeholder="Nhập mô tả chi tiết..."/>
                </div>
                <div class="input-group mb-3">
                    <form:input path="price" type="number" cssClass="form-control" placeholder="Nhập giá cả..." />
                    <span class="input-group-text">VNĐ</span>
                </div>
                <div>
                    <div class="mb-3">
                        <label class="form-label">Ảnh minh họa</label>
                        <input class="form-control" type="file" id="roomFile"
                               name="TruongFile"
                               multiple
                    accept=".png , .jpg, .jpeg">
                    </div>
                    <div class="col-12 mb-3">
                        <img style="max-height:250px ; display:none;" alt="room preview"
                             id="roomPreview"/>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Trạng thái</label>
                    <form:select path="status" cssClass="form-select">
                        <form:option value="PENDING" label="Chờ duyệt"/>
                        <form:option value="APPROVED" label="Đã duyệt"/>
                        <form:option value="HIDDEN" label="Bị ẩn"/>
                    </form:select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Loại hình cho thuê</label>
                    <form:select path="rentalType" cssClass="form-select">
                        <form:options items="${rentalTypes}" itemValue="name" itemLabel="displayName"/>
                    </form:select>
                </div>


                <div class="text-end">
                    <button type="submit" class="btn btn-success me-2">
                        <i class="fas fa-save"></i> Lưu
                    </button>
                    <a href="/admin/post" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Hủy
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

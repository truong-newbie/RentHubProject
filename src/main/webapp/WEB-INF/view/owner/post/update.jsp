<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Form Nhà Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/resources/css/owner/styles.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <style>
        body {
            background: #f5f6f8;
        }

        .main-container {
            max-width: 1000px;
            margin: 2rem auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            padding: 2.5rem;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 3px solid #0084ff;
        }

        .section-header {
            font-size: 18px;
            font-weight: 700;
            color: #1a1a1a;
            margin: 2rem 0 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-header i {
            color: #0084ff;
            font-size: 20px;
        }

        .form-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
            font-size: 14px;
        }

        .form-control, .form-select {
            border: 1px solid #d1d5db;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            font-size: 15px;
            transition: border-color 0.2s;
        }

        .form-control:focus, .form-select:focus {
            border-color: #0084ff;
            box-shadow: 0 0 0 3px rgba(0, 132, 255, 0.1);
        }

        .checkbox-group {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1rem;
        }

        .form-check {
            padding: 0;
            margin-bottom: 0.75rem;
        }

        .form-check-input {
            width: 18px;
            height: 18px;
            margin-top: 0.15rem;
            cursor: pointer;
            border: 2px solid #d1d5db;
        }

        .form-check-input:checked {
            background-color: #0084ff;
            border-color: #0084ff;
        }

        .form-check-label {
            font-size: 14px;
            color: #444;
            cursor: pointer;
            user-select: none;
        }

        .image-upload-area {
            background: #f8f9fa;
            border: 2px dashed #d1d5db;
            border-radius: 10px;
            padding: 2rem;
            text-align: center;
            margin-bottom: 1rem;
            transition: all 0.2s;
        }

        .image-upload-area:hover {
            border-color: #0084ff;
            background: #f0f7ff;
        }

        .upload-icon {
            font-size: 48px;
            color: #0084ff;
            margin-bottom: 1rem;
        }

        .upload-text {
            font-size: 15px;
            color: #666;
            font-weight: 500;
        }

        .preview-container {
            margin-top: 1rem;
        }

        .preview-image {
            max-width: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: none;
        }

        .info-alert {
            background: #e7f3ff;
            border: 1px solid #b3d9ff;
            border-radius: 8px;
            padding: 1rem 1.25rem;
            margin-top: 1rem;
        }

        .info-alert ul {
            margin: 0;
            padding-left: 1.25rem;
        }

        .info-alert li {
            font-size: 14px;
            color: #0066cc;
            margin-bottom: 0.25rem;
        }

        .btn-submit {
            background: #0084ff;
            border: none;
            color: white;
            padding: 0.875rem 2.5rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            transition: background 0.2s;
        }

        .btn-submit:hover {
            background: #0073e6;
        }

        .btn-cancel {
            background: #6c757d;
            border: none;
            color: white;
            padding: 0.875rem 2.5rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            transition: background 0.2s;
        }

        .btn-cancel:hover {
            background: #5a6268;
        }

        .input-group-text {
            background: #f8f9fa;
            border: 1px solid #d1d5db;
            color: #666;
            font-weight: 500;
        }

        .section-divider {
            height: 1px;
            background: #e5e7eb;
            margin: 2rem 0;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="main-container">

        <h1 class="page-title">
            <i class="bi bi-house-add"></i>
            Cập nhật phòng trọ
        </h1>

        <form:form action="/owner/post/update/${room.id}" method="POST" modelAttribute="room" enctype="multipart/form-data">

            <!-- Thông tin cơ bản -->
            <div class="section-header">
                <i class="bi bi-info-circle"></i>
                Thông tin cơ bản
            </div>

            <div class="row mb-3">
                <div class="col-12">
                    <label class="form-label">Tên nhà trọ, phòng trọ</label>
                    <form:input class="form-control" path="title" type="text" placeholder="VD: Phòng trọ cao cấp gần trường ĐH..."/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">Số lượng phòng</label>
                    <form:input path="roomNumber" type="number" class="form-control" placeholder="VD: 10"/>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Diện tích (m²)</label>
                    <form:input path="area" type="number" class="form-control" placeholder="VD: 25"/>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Giá thuê (triệu/tháng)</label>
                    <form:input path="price" type="number" class="form-control" placeholder="VD: 3"/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-8">
                    <label class="form-label">Địa chỉ</label>
                    <form:input path="address" type="text" class="form-control" placeholder="VD: 123 Đường ABC, Quận XYZ, TP..."/>
                </div>

            </div>

            <div class="section-divider"></div>

            <!-- Đối tượng -->
            <div class="section-header">
                <i class="bi bi-people"></i>
                Đối tượng phù hợp
            </div>
            <div class="checkbox-group">
                <div class="row">
                    <div class="col-md-3 form-check">
                        <form:checkbox path="tenantType" value="HOC_SINH" id="typeHocSinh" class="form-check-input me-2"/>
                        <label class="form-check-label" for="typeHocSinh">Học sinh - Sinh viên</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="tenantType" value="DI_LAM" id="typeDiLam" class="form-check-input me-2"/>
                        <label class="form-check-label" for="typeDiLam">Người đi làm</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="tenantType" value="GIA_DINH" id="typeGiaDinh" class="form-check-input me-2"/>
                        <label class="form-check-label" for="typeGiaDinh">Gia đình</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="tenantType" value="CAP_DOI" id="typeCapDoi" class="form-check-input me-2"/>
                        <label class="form-check-label" for="typeCapDoi">Cặp đôi</label>
                    </div>
                </div>
            </div>

            <!-- Tiện nghi -->
            <div class="section-header">
                <i class="bi bi-stars"></i>
                Tiện nghi
            </div>
            <div class="checkbox-group">
                <div class="row">
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="MEZZANINE" id="amenityMezzanine" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityMezzanine">Gác lửng</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="WIFI" id="amenityWifi" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityWifi">Wifi</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="PRIVATE_WC" id="amenityPrivateWC" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityPrivateWC">Vệ sinh riêng</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="BATHROOM" id="amenityBathroom" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityBathroom">Phòng tắm</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="WATER_HEATER" id="amenityWaterHeater" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityWaterHeater">Bình nóng lạnh</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="KITCHEN_SHELF" id="amenityKitchenShelf" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityKitchenShelf">Kệ bếp</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="WASHING_MACHINE" id="amenityWashingMachine" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityWashingMachine">Máy giặt</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="TV" id="amenityTV" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityTV">Tivi</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="AC" id="amenityAC" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityAC">Điều hòa</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="FRIDGE" id="amenityFridge" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityFridge">Tủ lạnh</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="BED" id="amenityBed" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityBed">Giường nệm</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="amenities" value="WARDROBE" id="amenityWardrobe" class="form-check-input me-2"/>
                        <label class="form-check-label" for="amenityWardrobe">Tủ quần áo</label>
                    </div>
                </div>
            </div>

            <!-- Môi trường xung quanh -->
            <div class="section-header">
                <i class="bi bi-geo-alt"></i>
                Môi trường xung quanh
            </div>
            <div class="checkbox-group">
                <div class="row">
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="MARKET" id="nbMarket" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbMarket">Chợ</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="SUPERMARKET" id="nbSupermarket" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbSupermarket">Siêu thị</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="HOSPITAL" id="nbHospital" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbHospital">Bệnh viện</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="SCHOOL" id="nbSchool" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbSchool">Trường học</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="PARK" id="nbPark" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbPark">Công viên</label>
                    </div>
                    <div class="col-md-3 form-check">
                        <form:checkbox path="neighborhood" value="BUS_STOP" id="nbBusStop" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbBusStop">Bến xe bus</label>
                    </div>
                    <div class="col-md-6 form-check">
                        <form:checkbox path="neighborhood" value="SPORT_CENTER" id="nbSportCenter" class="form-check-input me-2"/>
                        <label class="form-check-label" for="nbSportCenter">Trung tâm thể dục thể thao</label>
                    </div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Mô tả -->
            <div class="section-header">
                <i class="bi bi-card-text"></i>
                Mô tả chi tiết
            </div>
            <form:textarea
                    path="description"
                    class="form-control"
                    rows="6"
                    placeholder="Mô tả chi tiết về phòng trọ: vị trí, tiện ích, quy định, giá điện nước..."
            />

            <div class="section-divider"></div>


            <!-- Thông tin liên hệ -->
            <div class="section-header">
                <i class="bi bi-telephone"></i>
                Thông tin liên hệ
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Họ tên chủ trọ</label>
                    <form:input path="ownerName" type="text" class="form-control" placeholder="VD: Nguyễn Văn A"/>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Số Zalo</label>
                    <form:input path="phoneNumber" type="text" class="form-control" placeholder="VD: 0123456789"/>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Buttons -->
            <div class="d-flex gap-3 justify-content-center">
                <button type="submit" class="btn-submit">
                    <i class="bi bi-check-circle me-2"></i>Cập nhật
                </button>
            </div>
        </form:form>
    </div>
</div>

<script>
    // Make upload area clickable
    document.querySelector('.image-upload-area').addEventListener('click', function() {
        document.getElementById('roomFile').click();
    });

    // Show preview with better styling
    document.getElementById('roomFile').addEventListener('change', function(e) {
        if (e.target.files && e.target.files[0]) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            const preview = document.getElementById('roomPreview');
            preview.src = imgURL;
            preview.style.display = 'block';
            preview.classList.add('preview-image');
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
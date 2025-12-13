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
    <link href="${pageContext.request.contextPath}/resources/css/owner/styles.css" rel="stylesheet" >
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
<body class="bg-light p-4">

<div class="container bg-white p-4 rounded shadow">

    <h4 class="mb-3">Thông tin nhà trọ, phòng trọ</h4>

    <form:form action="/owner/create" method="POST" modelAttribute="room" enctype="multipart/form-data">
        <div class="row mb-3">
            <div class="col-md-12">
                <label class="form-label">Tên nhà trọ, phòng trọ</label>
                <form:input class="form-control" path="title" type="text" placeholder="Tên trọ"/>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Số lượng phòng</label>
                <form:input path="roomNumber" type="number" class="form-control" placeholder="Số lượng phòng"/>
            </div>
            <div class="col-md-6">
                <label class="form-label">Diện tích</label>
                <form:input path="area" type="number" class="form-control" placeholder="Diện tích"/>
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label">Địa chỉ</label>
            <form:input path="address" type="text" class="form-control" placeholder="Địa chỉ"/>
        </div>

        <div class="mb-4">
            <label class="form-label">Giá thuê</label>
            <form:input path="price" type="number" class="form-control" placeholder="Giá thuê"/>
        </div>

        <div class="mb-4">
            <label class="form-label">Loại hình</label>
            <form:select path="rentalType"  class="form-control" placeholder="Loại hình">
                <form:option value="" label="-- Chọn Loại hình --" />
                <form:option value="PHONG_TRO" label="Phòng trọ" />
                <form:option value="CAN_HO" label="Căn hộ" />
                <form:option value="NHA_NGUYEN_CAN" label="Nhà nguyên căn" />
            </form:select>
        </div>


        <h5 class="mt-3">Đối tượng</h5>
        <div class="row mb-3">
            <div class="col-md-2 form-check">
                <form:checkbox path="tenantType" value="HOC_SINH" id="typeHocSinh" class="form-check-input me-2"/>
                <label class="form-check-label" for="typeHocSinh">Đi học</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="tenantType" value="DI_LAM" id="typeDiLam" class="form-check-input me-2"/>
                <label class="form-check-label" for="typeDiLam">Đi làm</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="tenantType" value="GIA_DINH" id="typeGiaDinh" class="form-check-input me-2"/>
                <label class="form-check-label" for="typeGiaDinh">Gia đình</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="tenantType" value="CAP_DOI" id="typeCapDoi" class="form-check-input me-2"/>
                <label class="form-check-label" for="typeCapDoi">Cặp đôi</label>
            </div>
        </div>

        <h5 class="mt-3">Tiện nghi</h5>
        <div class="row mb-3 g-2">
            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="MEZZANINE" id="amenityMezzanine" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityMezzanine">Gác lửng</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="WIFI" id="amenityWifi" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityWifi">Wifi</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="PRIVATE_WC" id="amenityPrivateWC" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityPrivateWC">Vệ sinh trong</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="BATHROOM" id="amenityBathroom" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityBathroom">Phòng tắm</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="WATER_HEATER" id="amenityWaterHeater" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityWaterHeater">Bình nóng lạnh</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="KITCHEN_SHELF" id="amenityKitchenShelf" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityKitchenShelf">Kệ bếp</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="WASHING_MACHINE" id="amenityWashingMachine" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityWashingMachine">Máy giặt</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="TV" id="amenityTV" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityTV">Tivi</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="AC" id="amenityAC" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityAC">Điều hòa</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="FRIDGE" id="amenityFridge" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityFridge">Tủ lạnh</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="BED" id="amenityBed" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityBed">Giường nệm</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="amenities" value="WARDROBE" id="amenityWardrobe" class="form-check-input me-2"/>
                <label class="form-check-label" for="amenityWardrobe">Tủ áo quần</label>
            </div>
        </div>

        <h5 class="mt-3">Môi trường xung quanh</h5>
        <div class="row mb-3 g-2">
            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="MARKET" id="nbMarket" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbMarket">Chợ</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="SUPERMARKET" id="nbSupermarket" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbSupermarket">Siêu thị</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="HOSPITAL" id="nbHospital" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbHospital">Bệnh viện</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="SCHOOL" id="nbSchool" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbSchool">Trường học</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="PARK" id="nbPark" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbPark">Công viên</label>
            </div>

            <div class="col-md-2 form-check">
                <form:checkbox path="neighborhood" value="BUS_STOP" id="nbBusStop" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbBusStop">Bến xe Bus</label>
            </div>

            <div class="col-md-3 form-check">
                <form:checkbox path="neighborhood" value="SPORT_CENTER" id="nbSportCenter" class="form-check-input me-2"/>
                <label class="form-check-label" for="nbSportCenter">Trung tâm thể dục thể thao</label>
            </div>
        </div>

        <label class="form-label" for="descriptionField">Mô tả</label>
        <form:textarea
                path="description"
                id="descriptionField"
                class="form-control mb-4"
                rows="5"
                placeholder="Viết mô tả về nhà trọ, phòng trọ"
        />

        <h5>Hình ảnh tổng quan</h5>
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

        <div class="alert alert-info">
            <ul class="mb-0">
                <li>Đăng tối thiểu 3 ảnh và tối đa 15 ảnh.</li>
                <li>Hãy dùng ảnh thật, không chèn SĐT, không chèn logo.</li>
                <li>Mỗi ảnh kích thước tối thiểu 400×300 px.</li>
            </ul>
        </div>

        <h4 class="mt-4">Thông tin liên hệ</h4>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Họ tên</label>
                <form:input path="ownerName" type="text" class="form-control" placeholder="Tên chủ trọ"/>
            </div>
            <div class="col-md-4">
                <label class="form-label">Zalo</label>
                <form:input path="phoneNumber" type="text" class="form-control" placeholder="Số điện thoại chủ trọ "/>
            </div>
        </div>

        <div class="d-flex gap-3">
            <button class="btn btn-secondary">Hủy</button>
            <button class="btn btn-primary">Lưu</button>
        </div>
    </form:form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

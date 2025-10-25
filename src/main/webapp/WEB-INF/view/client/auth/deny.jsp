<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 - Truy cập bị từ chối</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .error-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .error-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 25px;
            background: #fee;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .error-icon i {
            font-size: 40px;
            color: #d32f2f;
        }

        h1 {
            font-size: 24px;
            font-weight: 600;
            color: #222;
            margin-bottom: 12px;
            text-align: center;
        }

        .error-desc {
            color: #666;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 25px;
            text-align: center;
        }

        .info-box {
            background: #fafafa;
            padding: 16px;
            border-radius: 6px;
            margin-bottom: 25px;
            border-left: 3px solid #e0e0e0;
        }

        .info-box p {
            margin: 0 0 8px 0;
            font-size: 14px;
            color: #555;
        }

        .info-box p:last-child {
            margin-bottom: 0;
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }

        .btn-primary {
            flex: 1;
            padding: 11px 20px;
            background: #1976d2;
            border: none;
            color: white;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary:hover {
            background: #1565c0;
            color: white;
        }

        .btn-secondary {
            flex: 1;
            padding: 11px 20px;
            background: white;
            border: 1px solid #ddd;
            color: #555;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-secondary:hover {
            background: #fafafa;
            color: #555;
        }

        .help-text {
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            text-align: center;
            font-size: 13px;
            color: #888;
        }

        .help-text a {
            color: #1976d2;
            text-decoration: none;
        }

        @media (max-width: 576px) {
            .error-container {
                margin: 40px 15px;
                padding: 30px 20px;
            }

            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-icon">
        <i class="bi bi-lock-fill"></i>
    </div>

    <h1>Không có quyền truy cập</h1>

    <p class="error-desc">
        Bạn không có quyền để xem trang này. Vui lòng kiểm tra lại hoặc liên hệ quản trị viên để được hỗ trợ.
    </p>

    <div class="info-box">
        <p>• Phiên đăng nhập có thể đã hết hạn</p>
        <p>• Tài khoản chưa được cấp quyền</p>
        <p>• Trang yêu cầu quyền quản trị viên</p>
    </div>

    <div class="btn-group">
        <a href="javascript:history.back()" class="btn-secondary">
            Quay lại
        </a>
        <a href="/" class="btn-primary">
            Trang chủ
        </a>
    </div>

    <div class="help-text">
        Cần trợ giúp? <a href="mailto:support@example.com">Liên hệ hỗ trợ</a>
    </div>
</div>
</body>
</html>
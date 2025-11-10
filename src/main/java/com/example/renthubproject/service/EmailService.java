package com.example.renthubproject.service;

import com.sendgrid.*;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class EmailService {

  @Value("${sendgrid.api.key}")
  private String sendGridApiKey;

  @Value("${sendgrid.sender.email}")
  private String senderEmail;

  public void sendOtpEmail(String toEmail, String otpCode) throws IOException {
    Email from = new Email(senderEmail);
    String subject = "Mã OTP khôi phục mật khẩu";
    Email to = new Email(toEmail);
    Content content = new Content("text/plain",
            "Xin chào!\n\nMã OTP của bạn là: " + otpCode +
                    "\nMã này có hiệu lực trong 5 phút.\n\nRentHub");
    Mail mail = new Mail(from, subject, to, content);

    SendGrid sg = new SendGrid(sendGridApiKey);
    Request request = new Request();

    try {
      request.setMethod(Method.POST);
      request.setEndpoint("mail/send");
      request.setBody(mail.build());

      // Thực thi request và nhận response
      Response response = sg.api(request);

      // Kiểm tra trạng thái HTTP
      if (response.getStatusCode() >= 400) {
        // Nếu SendGrid trả về lỗi (4xx hoặc 5xx), in ra chi tiết
        System.err.println("--- SENDGRID API ERROR ---");
        System.err.println("Status Code: " + response.getStatusCode());
        System.err.println("Response Body: " + response.getBody());
        System.err.println("--------------------------");
        throw new IOException("Lỗi gửi mail từ SendGrid API: HTTP Status " + response.getStatusCode());
      }

      // Nếu thành công (200, 202)
      System.out.println("Gửi OTP thành công đến: " + toEmail);
      System.out.println("SendGrid Status: " + response.getStatusCode());

    } catch (IOException ex) {
      // Bắt lỗi kết nối mạng, DNS, hoặc lỗi thư viện
      System.err.println("LỖI KẾT NỐI/THƯ VIỆN Gửi mail: " + ex.getMessage());
      throw new IOException("Gửi mail thất bại do lỗi kết nối", ex);
    }
  }
}
package com.demo;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login") // Định nghĩa đường dẫn thay vì web.xml
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Xử lý đơn giản – giả định tài khoản là admin/123
        if ("admin".equals(username) && "123".equals(password)) {
            // Đúng -> chuyển đến trang thành công
            request.setAttribute("user", username);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // Sai -> chuyển đến trang lỗi
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

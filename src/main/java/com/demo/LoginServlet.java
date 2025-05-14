package com.demo;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login") // Định nghĩa đường dẫn thay vì web.xml
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Giả lập kiểm tra tài khoản (có thể thay bằng truy vấn CSDL)
        if ("admin".equals(username) && "123456".equals(password)) {
            Cookie cookie = new Cookie("user", username);
            cookie.setMaxAge(60 * 60); // tồn tại 1 giờ
            resp.addCookie(cookie);
            resp.sendRedirect("welcome");
        } else {
            resp.getWriter().println("Sai tên đăng nhập hoặc mật khẩu!");
        }
    }
}

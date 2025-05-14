package com.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/welcome")
public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        String user = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    user = c.getValue();
                    break;
                }
            }
        }
        PrintWriter out = resp.getWriter();

        if (user != null) {
            out.println("Chào mừng, " + user + "!");
            out.println("<a href='logout'>Đăng xuất</a>");
        } else {
            out.println("Bạn chưa đăng nhập. <a href='login.html'>Đăng nhập</a>");
        }

    }
}

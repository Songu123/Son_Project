package com.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/welcomesession")
public class WelcomeSessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String username = (String) session.getAttribute("username");
            if (username != null) {
                resp.getWriter().println("Chào mừng, " + username + "!");
            } else {
                resp.getWriter().println("Bạn chưa đăng nhập.");
            }
        } else {
            resp.getWriter().println("Phiên làm việc đã hết hạn.");
        }
    }
}

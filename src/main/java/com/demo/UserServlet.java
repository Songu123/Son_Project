package com.demo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // HTML đầu trang
        out.println("<html><body>");
        out.println("<h2>Danh sách người dùng</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Email</th></tr>");

        UserDAO userDAO = new UserDAO();

        List<User> listUser = null;
        try {
            listUser = userDAO.selectAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        for(User u: listUser){
            out.println("<tr>");
            out.println("<td>" + u.getId() + "</td>");
            out.println("<td>" + u.getName() + "</td>");
            out.println("<td>" + u.getEmail()+ "</td>");
            out.println("</tr>");
        }


        // Kết thúc HTML
        out.println("</table>");
        out.println("</body></html>");
    }
}

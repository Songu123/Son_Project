<%@ page import="java.util.*, com.example.demo.User" %>
<%
    List<User> listUser = (List<User>) request.getAttribute("listUser");
%>
<table border="1">
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Country</th>
    </tr>
    <%
        for (User user : listUser) {
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getCountry() %></td>
    </tr>
    <%
        }
    %>
</table>

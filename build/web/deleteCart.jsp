<%-- 
    Document   : deleteCart
    Created on : 16 Mar, 2025, 4:20:36 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
<%
    int cartid = Integer.parseInt(request.getParameter("cartid"));
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
        PreparedStatement ps = con.prepareStatement("delete from o_cart where ocart_id = ?");
        ps.setInt(1, cartid);
        ps.executeUpdate();
          response.sendRedirect("addtocart.jsp");
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
    </body>
</html>

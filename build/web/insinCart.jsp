<%-- 
    Document   : insinCart
    Created on : 16 Mar, 2025, 4:13:39 PM
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
            String n = (String) session.getAttribute("uname");
            String cid = (String) session.getAttribute("uid");
        int f=0;
            if (cid == null) {
//                session.setAttribute("errorMessage", "Please Login first!");
//                response.sendRedirect("htm.jsp");

                          f=1;
                           //response.sendRedirect("categorymg.jsp?f=invalid");
                       }
               
                   if(f==1)
                   {
                      response.sendRedirect("cardDis.jsp?f=invalid"); 
                   }
            else {
                int result;
                int uid = Integer.parseInt(cid);
                int pid = Integer.parseInt(request.getParameter("pid"));

//                  double price =Double.parseDouble(request.getParameter("price"));
//                String pname= request.getParameter("pname");
//                      String pimg= request.getParameter("pimg");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                    //out.println(" Connection Successfull");
                    PreparedStatement ps = con.prepareStatement("insert into o_cart(uid,pid,quantity) values(?,?,?)");
                    ps.setInt(1, uid);
                    ps.setInt(2, pid);
                    ps.setInt(3, 0);
                    result = ps.executeUpdate();
                    if (result > 0) {
                        response.sendRedirect("addtocart.jsp");
                    } else {
                        out.print(" Values Not Entered");
                    }

                } catch (Exception e) {
                    out.print(e);
                 }

             }%>
    </body>
</html>
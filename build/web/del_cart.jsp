<%-- 
    Document   : del_cart
    Created on : 16 Mar, 2025, 3:58:44 PM
    Author     : SAKSHI
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String url,user1,pass,q;
           Connection con;
           int cid=Integer.parseInt(request.getParameter("cartid"));
           try
           {
               Class.forName("com.mysql.cj.jdbc.Driver");
               url="jdbc:mysql://localhost:3306/coffeeshop";
               user1="root";
               pass="sweet15";
               con=DriverManager.getConnection(url,user1,pass);
               q="delete from b_cart where bcart_id="+cid;
               PreparedStatement pst=con.prepareStatement(q);
               int c=pst.executeUpdate();
               if(c>0)
               {
                   response.sendRedirect("cartdisplay.jsp");
               }
           }
           catch(Exception e)
           {
               out.println(e);
           }
        %>
    </body>
</html>


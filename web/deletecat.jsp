<%-- 
    Document   : deletecat
    Created on : 16 Mar, 2025, 1:17:37 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String url,user,pass,q;
           Connection con;
           int cid=Integer.parseInt(request.getParameter("cid"));
           try
           {
               Class.forName("com.mysql.cj.jdbc.Driver");
              url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
               con=DriverManager.getConnection(url,user,pass);
               q="delete from p_category where p_cid="+cid;
               PreparedStatement pst=con.prepareStatement(q);
               int c=pst.executeUpdate();
               if(c>0)
               {
                   response.sendRedirect("cattegoryMng.jsp");
               }
           }
           catch(Exception e)
           {
               out.println(e);
           }
        %>
    </body>
</html>

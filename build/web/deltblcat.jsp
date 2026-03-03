<%-- 
    Document   : deltblcat
    Created on : 16 Mar, 2025, 2:07:51 PM
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
           String url,user,pass,q;
           Connection con;
           int cid=Integer.parseInt(request.getParameter("tblid"));
           try
           {
               Class.forName("com.mysql.cj.jdbc.Driver");
               url="jdbc:mysql://localhost:3306/coffeeshop";
               user="root";
               pass="sweet15";
               con=DriverManager.getConnection(url,user,pass);
               q="delete from t_category where t_cid="+cid;
               PreparedStatement pst=con.prepareStatement(q);
               int c=pst.executeUpdate();
               if(c>0)
               {
                   response.sendRedirect("tblcatmg.jsp");
               }
           }
           catch(Exception e)
           {
               out.println(e);
           }
        %>
    </body>
</html>
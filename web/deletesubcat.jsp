<%-- 
    Document   : deletesubcat
    Created on : 16 Mar, 2025, 1:26:06 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete SubCategory</title>
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
               q="delete from p_subcategory where sub_cid="+cid;
               PreparedStatement pst=con.prepareStatement(q);
               int c=pst.executeUpdate();
               if(c>0)
               {
                   response.sendRedirect("SubCategoryMng.jsp?cid="+cid);
               }
           }
           catch(Exception e)
           {
               out.println(e);
           }
        %>
    </body>
</html>
<%-- 
    Document   : proddel
    Created on : 16 Mar, 2025, 1:32:24 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete product Page</title>
    </head>
    <body>
         <% 
             
          int id=Integer.parseInt(request.getParameter("pid"));
       
        
             try{
      Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
            PreparedStatement ps=con.prepareStatement("delete from product where pid="+id+"");
          
               ps.executeUpdate();
          
               response.sendRedirect("productins.jsp");
         
           
           
             }
             catch(Exception e)
             {
             
             }    
         %>
    </body>
</html>
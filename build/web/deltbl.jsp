<%-- 
    Document   : deltbl
    Created on : 16 Mar, 2025, 2:17:46 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    <title>delete product</title>
    </head>
    <body>
         <% 
             
          int id=Integer.parseInt(request.getParameter("t_id"));
          int id2=Integer.parseInt(request.getParameter("tcat"));
        
             try{
      Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
            PreparedStatement ps=con.prepareStatement("delete from tables where tid="+id+"");
          
              int res=ps.executeUpdate();
               if(res>0)
                 response.sendRedirect("tablemg.jsp?tcatid="+id2);
               
                   
           
           
             }
             catch(Exception e)
             {
             out.print(e);
             }    
         %>
        
    </body>
</html>




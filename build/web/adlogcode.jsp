<%-- 
    Document   : adlogcode
    Created on : 16 Mar, 2025, 1:07:57 PM
    Author     : SAKSHI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin login code</title>
        
    </head>
    <body>
        <% 
            Connection con;
             String url="jdbc:mysql://localhost:3306/coffeeshop";
             String user="root";
             String pass="sweet15";
            String email=request.getParameter("t1");
            String pasw=request.getParameter("t2");
            
           boolean f=false;
           if (email == null || pass == null) 
           { response.sendRedirect("login.jsp?f=invalid");
           return; 
           }
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection(url,user,pass); 
                String sql="SELECT *FROM admin";
                PreparedStatement pst=con.prepareStatement(sql);
                  ResultSet rst=pst.executeQuery();
                   while(rst.next())
                   {
                       if(email.equals(rst.getString(1)) && pasw.equals(rst.getString(2)))
                       {    f=true;
                              
                       
                       
                             session.setAttribute("email",email);
                           response.sendRedirect("admhome.jsp");
                       }
                   }
                   if(f==false)
                   {
                       
                       response.sendRedirect("admin_login.jsp?f=invalid");
                   }
          }
            catch(Exception e)
            {
               out.println(e);
            }
        %>
    </body>
</html>


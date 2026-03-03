<%-- 
    Document   : userlogcheck
    Created on : 16 Mar, 2025, 12:40:54 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user Login Check Page</title>
    </head>
    
      <%  
          
        int f=0;
        
           String uemail= request.getParameter("umail");
             String userpass= request.getParameter("upass");
          try{
      Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
            PreparedStatement ps=con.prepareStatement("select * from user");
            ResultSet rs=ps.executeQuery();
     while(rs.next())
     {
       if(uemail.equals(rs.getString(3)) && userpass.equals(rs.getString(4)))
       {
          String name=rs.getString(2);
            session.setAttribute("uname",name);
                String uid=rs.getString(1);
                out.println(uid);
                session.setAttribute("uid",uid);
                response.sendRedirect("uhome.jsp");
              
        //out.println("Succesfull");
        
                  response.sendRedirect("uhome.jsp?f=valid"); 
           
        }
       else{
       f=1;
       }
     
     }
       if(f == 1)
       { 
        response.sendRedirect("uhome.jsp?f=invalid"); 

        
       }
              }
           catch(Exception e)
        {  
           // out.println(e);
        }
      %>
    
<%
String logout = request.getParameter("logout");
if ("true".equals(logout)) {
    session.invalidate(); // Destroy session
    response.sendRedirect("uhome.jsp"); // Redirect to original page
}
%>

<%-- 
    Document   : catupcode
    Created on : 16 Mar, 2025, 1:15:51 PM
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
            int c=Integer.parseInt(request.getParameter("t1"));
            String s=request.getParameter("t2");
            String url,pass,user;
        try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   String sql="update p_category set p_cname='"+s+"' where p_cid="+c+"";
                   PreparedStatement pst=con.prepareStatement(sql);
                   int res=pst.executeUpdate();
                   if(res>0)
                       response.sendRedirect("cattegoryMng.jsp");
                }
               catch(Exception e)
                       {
                           out.print(e);
                       }
              
        %>
    </body>
</html>

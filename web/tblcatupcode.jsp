<%-- 
    Document   : tblcatupcode
    Created on : 16 Mar, 2025, 1:50:24 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
                   String sql="update t_category set t_cname='"+s+"' where t_cid="+c+"";
                   PreparedStatement pst=con.prepareStatement(sql);
                   int res=pst.executeUpdate();
                   if(res>0)
                       response.sendRedirect("tblcatmg.jsp");
                }
               catch(Exception e)
                       {
                           out.print(e);
                       }
              
        %>
    </body>
</html>
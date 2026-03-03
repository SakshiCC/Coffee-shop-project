<%-- 
    Document   : subcatupcode
    Created on : 16 Mar, 2025, 1:24:19 PM
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
            int cid=Integer.parseInt(request.getParameter("cid"));
            Connection con;
            String url,pass,user;
        try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                    con=DriverManager.getConnection(url,user,pass);
                   String sql="update p_subcategory set sub_cname='"+s+"' where sub_cid="+c+"";
                   PreparedStatement pst=con.prepareStatement(sql);
                   int res=pst.executeUpdate();
                   if(res>0)
                       response.sendRedirect("SubCategoryMng.jsp?cid="+cid);
                }
               catch(Exception e)
                       {
                           out.print(e);
                       }
              
        %>
    </body>
</html>

   
</html>

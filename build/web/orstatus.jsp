<%-- 
    Document   : orstatus
    Created on : 16 Mar, 2025, 3:25:33 PM
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
          
            int s=Integer.parseInt(request.getParameter("oid"));
            String url,pass,user;
        try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   String sql="update orders set pay_status='Paid' where oid="+s+"";
                   PreparedStatement pst=con.prepareStatement(sql);
                   int res=pst.executeUpdate();
                   if(res>0)
                       response.sendRedirect("admorders.jsp");
                }
               catch(Exception e)
                       {
                           out.print(e);
                       }
            %>  
    </body>
</html>

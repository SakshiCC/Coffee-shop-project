<%-- 
    Document   : tblcatcode
    Created on : 16 Mar, 2025, 3:02:36 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table cat Code</title>
    </head>
    <body>
         <%
               String cat_name=request.getParameter("t2");
               int  f=0;
               try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String user="root";
                   String pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   PreparedStatement ps1 = con.prepareStatement("select * from t_category");
                ResultSet rst = ps1.executeQuery();
                while (rst.next()) {
                    if (rst.getString("t_cname").equals(cat_name)) {
                        f = 1;
                        //response.sendRedirect("categorymg.jsp?f=invalid");
                    }
                }
                if (f == 1) {
                    response.sendRedirect("tblcatmg.jsp?f=invalid");
                } else {
                   String sql="INSERT INTO t_category(t_cname)"+"VALUES(?)";
                   PreparedStatement pst=con.prepareStatement(sql);
                   pst.setString(1,cat_name);
                   
                   int cnt=pst.executeUpdate();
                   if(cnt>0)
                   {
                       response.sendRedirect("tblcatmg.jsp");
                   }
                   else
                    {     out.print("Failed");
                          con.close();
                     }
                }        
               }
               catch(Exception e)
                       {
                           out.print(e);
                       }
               //if(uname!=null && password.length()==8)
               //{
                 // response.sendRedirect("home.jsp");
                //}
               //else
               //{
                 //  out.print("Invalid user name or password");
              // }
        %>
        
    </body>
</html>

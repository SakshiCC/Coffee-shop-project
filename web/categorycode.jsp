<%-- 
    Document   : categorycode
    Created on : 16 Mar, 2025, 2:50:02 PM
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
               String cat_name=request.getParameter("t2");
               int f=0;
               try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String user="root";
                   String pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   String Checkcat="select * from p_category";
                   PreparedStatement ps=con.prepareStatement(Checkcat);
                   ResultSet rst=ps.executeQuery();
                   while(rst.next())
                   {
                       if(rst.getString("p_cname").equals(cat_name))
                       {       f=1;
                           //response.sendRedirect("categorymg.jsp?f=invalid");
                       }
                   }
                   if(f==1)
                   {
                      response.sendRedirect("cattegoryMng.jsp?f=invalid"); 
                   }
                   else
                   {
                  String sql="INSERT INTO p_category(p_cname)"+"VALUES(?)";
                   PreparedStatement pst=con.prepareStatement(sql);
                   pst.setString(1,cat_name);
                   
                   int cnt=pst.executeUpdate();
                   if(cnt>0)
                   {
                       response.sendRedirect("cattegoryMng.jsp");
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

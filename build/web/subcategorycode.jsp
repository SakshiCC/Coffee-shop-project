<%-- 
    Document   : subcategorycode
    Created on : 16 Mar, 2025, 2:52:22 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JADD SUB CAT Page</title>
         
    </head>
    <body>
        <%
               String cat_name=request.getParameter("t2");
               int cid=Integer.parseInt(request.getParameter("cid"));
                  String url,pass,user;
                  int f=0;
               try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                    String Checkcat="select * from p_subcategory";
                   PreparedStatement ps=con.prepareStatement(Checkcat);
                   ResultSet rst=ps.executeQuery();
                   while(rst.next())
                   {
                       if(rst.getString("sub_cname").equals(cat_name))
                       {       f=1;
                           //response.sendRedirect("categorymg.jsp?f=invalid");
                       }
                   }
                   if(f==1)
                   {
                      response.sendRedirect("SubCategoryMng.jsp?f=invalid&cid="+cid); 
                   }
                   else
                   {
                   String sql="INSERT INTO p_subcategory(sub_cname,p_cid)"+"VALUES(?,?)";
                   PreparedStatement pst=con.prepareStatement(sql);
                   pst.setString(1,cat_name);
                   pst.setInt(2,cid);
                   
                   int cnt=pst.executeUpdate();
                   if(cnt>0)
                   {
                     response.sendRedirect("SubCategoryMng.jsp?cid="+cid);
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

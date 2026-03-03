<%-- 
    Document   : chngpassword
    Created on : 16 Mar, 2025, 12:59:29 PM
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
        String email=request.getParameter("email");
        String pass=request.getParameter("upass");
        int result;
          try{
      Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
            PreparedStatement ps=con.prepareStatement("update user set upassword=? where uemail=?");
             ps.setString(2,email);
          ps.setString(1,pass);
          result= ps.executeUpdate();
                con.close();
            if(result>0)
            {
                %>
                
                <script>
                
                                        var x = confirm("Password Is Changed!");
                                     if(x)
                                    {
                                       
                                        window.location.href='uhome.jsp';
                                        }  
                                    
                </script>
                
                <%
//             RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
//             rd.include(request, response); 
            }
//           response.sendRedirect("htm.jsp");

           }
 
        catch(Exception e)
        {
        }
        
        %>
    </body>
</html>

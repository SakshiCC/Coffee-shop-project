<%-- 
    Document   : logout
    Created on : 16 Mar, 2025, 3:33:20 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%    
               session=request.getSession(false);
               if(session != null)
               {
                   session.invalidate();
               }
               response.sendRedirect("uhome.jsp");
             
        %>
    </body>
</html>

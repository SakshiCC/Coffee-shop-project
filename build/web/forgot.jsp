<%-- 
    Document   : forgot
    Created on : 16 Mar, 2025, 12:56:27 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Forgot Password</title>
    </head>
    <body style="display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url('image/Cof1.jpeg') no-repeat;
    background-size: cover;
    background-position: center;">



    <%
        // Retrieve the 'number' parameter from the URL
//        String number = request.getParameter("number");
        String email = request.getParameter("email");
         int number=Integer.parseInt(request.getParameter("number"));
     
        try{
      Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop","root","sweet15");
            PreparedStatement ps=con.prepareStatement("select * from user");
            ResultSet rs=ps.executeQuery();
     while(rs.next())
     {
           if(email.equals(rs.getString(3)) && number==rs.getInt(7))
       {
              %>
    
              <div class="container col-xs-3" style="width: 50%; height:50%; border: solid wheat; border-radius:5px; padding: 10px 10px 10px 10px; margin :150px 150px 150px 150px ; background: transparent;  backdrop-filter: blur(20px); ">
                  <form action="chngpassword.jsp" method="post" >
                      <div class="form-group text-light" style="margin:5px;">
      <label for="pwd">New Password:</label>
      <input type="password" class="form-control" id="pwd"  name="upass" maxlength="8" minlength="6" required>
      <input type="hidden" name="email" value="<%=request.getParameter("email")%>"/>
    </div>
                      <button type="submit" class="btn btn-primary" style="margin-top:15px ;">Change</button>
  </form>
  </div>
 
 
 
 
 
 <%
        //out.println("Succesfull");
          
//             request.setAttribute("umail",email);
//           request.getRequestDispatcher("chngpassword.jsp").forward(request, response);
//                
           
        }
           else
           {
          
           }
     
     
     }
     
         }
        catch(Exception e)
        {}
    %>
    </body>
</html>

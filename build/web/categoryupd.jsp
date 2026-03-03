<%-- 
    Document   : categoryupd
    Created on : 16 Mar, 2025, 1:14:18 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAT UPDATE Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
         #hed2{
                justify-content: center;
                border: 2px solid white;
                height: 400px;
                width: 400px;
                padding: 50px 30px 30px 30px;
                color: white;
                border-radius: 10px;
                
                
            }
            #btn{
                background-color: crimson;
                border-radius: 5px;
                height: 35px;
                width: 70px;
                color: white;
            }
            
            
            
        </style>
        
         
    </head>
    <body style="background-color: black;">
        
        <br><br><br><br><br>
         <center>
            
       <% 
            String c=request.getParameter("cid");
            
            out.println(c);
            //int ci=Integer.parseInt(c);
            String url,pass,user;
        try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   String sql="select *from p_category where p_cid="+c+"";
                   PreparedStatement pst=con.prepareStatement(sql);
               ResultSet rst=pst.executeQuery();
               while(rst.next())
               {
       %>
        <center>
            
            <div id="hed2">
                <h2 style="color: white; font-style: italic;">Manage Category</h2>
        <form class="form1" action="catupcode.jsp"><br>
            <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Category Id</label>
  <input type="text" class="form-control" id="formGroupExampleInput" name="t1" value="<%=rst.getInt(1)%>" readonly>
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Category Name</label>
  <input type="text" class="form-control" id="formGroupExampleInput2" name="t2" value="<%=rst.getString(2)%>">
</div>     
            <input id="btn" type="submit" value="Update"><br><br>
             </form>
        
            <%
               }
}
catch(Exception e)
{
   out.println(e);
}
             %>
            </div>
         </center>
         </center>
            </body>
</html>

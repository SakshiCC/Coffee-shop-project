<%-- 
    Document   : tblcatupd
    Created on : 16 Mar, 2025, 1:48:18 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table cat Update Page</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
   
         
    </head>
    <body style="background-image: url('image/prodbackground1.jpg'); background-size: 100%;">
        <jsp:include page="admsidebar.jsp"></jsp:include>
        <br><br><br><br><br>
         <center>
            
       <% 
            String c=request.getParameter("tcatid");
            
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
                   String sql="select *from t_category where t_cid="+c+"";
                   PreparedStatement pst=con.prepareStatement(sql);
               ResultSet rst=pst.executeQuery();
               while(rst.next())
               {
       %>
        <center>
            
            <div id="hed2">
                <h2 style="color: white; font-style: italic;">Manage Category</h2>
        <form class="form1" action="tblcatupcode.jsp"><br>
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
  
         

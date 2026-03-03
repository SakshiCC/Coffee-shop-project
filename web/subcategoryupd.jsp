<%-- 
    Document   : subcategoryupd
    Created on : 16 Mar, 2025, 1:21:53 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            int sbc=Integer.parseInt(request.getParameter("sbcid"));
            int c=Integer.parseInt(request.getParameter("cid"));
            
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
                   String sql="select *from p_subcategory where sub_cid="+sbc+"";
                   PreparedStatement pst=con.prepareStatement(sql);
               ResultSet rst=pst.executeQuery();
               while(rst.next())
               {
       %>
        <center>
            
            <div id="hed2">
                <h2 style="color: white; font-style: italic;">Manage Sub-Category</h2>
        <form class="form1" action="subcatupcode.jsp"><br>
            <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Sub-Category Id</label>
  <input type="text" class="form-control" id="formGroupExampleInput" name="t1" value="<%=rst.getInt(2)%>" readonly>
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Sub-Category Name</label>
  <input type="text" class="form-control" id="formGroupExampleInput2" name="t2" value="<%=rst.getString(3)%>">
</div>    
<input type="hidden" name="cid" value="<%=c%>">
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



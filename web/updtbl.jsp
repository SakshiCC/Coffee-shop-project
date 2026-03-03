<%-- 
    Document   : updtbl
    Created on : 16 Mar, 2025, 2:32:40 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table Update Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <style>

            img {
                border: 1px double #ddd;
                border-radius: 25%;
                padding: 3px;
            }
            body{

                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url('image/prodbackground1.jpg') no-repeat;
                background-size: 100% 100%;

                background-position: center;

            }
        </style>
    </head>
    <body>
         <%@include  file="admsidebar.jsp" %>
        <%
            int id = Integer.parseInt(request.getParameter("tid"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                PreparedStatement p = con.prepareStatement("select * from tables where tid=" + id + "");
                ResultSet r = p.executeQuery();
                while (r.next()) {
        %>
                     
        <form action="tblupimg" method="post" enctype="multipart/form-data"  style=" margin-top: 75px;">
                       <div>
                        <div class="col-xs-3" style=" width: 150%; height: 100%; padding: 5px 35px 10px 35px;  background: transparent ;backdrop-filter: blur(20px); border: 2px solid rgba(255,255,255,.5); border-radius: 20px;text-align: center;">
                        <h1 class="text-light" style="text-align:center;">EDIT TABLE INFO</h1>
                        <strong class="text-light" style=" margin-top: 3px">Category</strong>
           
                        <input type="number" class="form-control mt-3"  name="tcat" value=<%=r.getInt(3)%>>
                        <br>
                        
                        
                        <strong class="text-light" style=" margin-top: 3px">Table Id</strong>
           
                        <input type="number" class="form-control mt-3"  name="tid" value=<%=r.getInt(2)%> readonly>
                        <br>
            
            
                         <strong class="text-light"> Table Price</strong>
                         <input type="text" class="form-control mt-3"  name="price" value="<%=r.getDouble(6)%>">
                         <br>
         
           
                      <div class="mb-3">
                        <label for="DefaultFile"  class="form-label text-light"> Table Image </label>
                        <input class="form-control"  type="file" id="DefaultFile" name="img">
                  
                        <img style="margin: 15px" src="tableimages/<%=r.getString(4)%>" class="rounded" alt="Cinque Terre" width="175" height="150">
                        <br>
                        
                        
                       </div>
                      <div class="mb-3 mt-3">
                       <label for="comment" class="form-label text-light">Description</label>
                       <textarea class="form-control" rows="3" id="comment" name="desc" ><%=r.getString(7)%></textarea>
                      
                       
                      </div>
                          <input type="hidden" class="form-control mt-3" name="tiname" value="<%=r.getString(4)%>">
                          <br>
                          <input type="hidden" name="tpath" value="<%=r.getString(5)%>" />
                          
          
                         <button type="submit" class="btn btn-danger" >Update Table</button>
                   
            </div>
            </div>
        </form> 
                          
      
        
        
        
                   <%
                  }
           
           
             }
             catch(Exception e)
             {
             
             }    
       
       %>
    </body>
</html>

<%-- 
    Document   : edit
    Created on : 16 Mar, 2025, 1:34:02 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


        <title>Edit button Page</title>
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
/*                background: url('image/prodbackground1.jpg') no-repeat;*/
                background-size: 100% 100%;

                background-position: center;

            }
        </style>
    </head>
    <body style="background-color: #000000;">
        <%@include  file="admsidebar.jsp" %>
        <form action="demo2" method="post" enctype="multipart/form-data" style=" margin-top: 100px;">
            <div >
                <div class="col-xs-3" style=" width: 150%; height: 100%; padding: 5px 35px 10px 35px;  background: transparent ;backdrop-filter: blur(20px); border: 2px solid rgba(255,255,255,.5); border-radius: 20px;text-align: center;">
                    <h1 class="text-light" style="text-align:center;">EDIT PRODUCT</h1>
                    <%
                        int currentsubcatid = 0;
                        try {
                            int pid = Integer.parseInt(request.getParameter("pid")); // Getting product id from URL
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                            PreparedStatement ps1 = con.prepareStatement("SELECT sub_cid FROM product WHERE pid=?");
                            ps1.setInt(1, pid);
                            ResultSet rs1 = ps1.executeQuery();
                            if (rs1.next()) {
                                currentsubcatid = rs1.getInt("sub_cid");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>


                          <div class="container mt-3 " style="text-align:center;">
                            <label for="dropdownTextField" class="form-label text-light">Select Sub Category</label>
                            <select id="dropdownTextField" class="form-select " name="subcategory" required aria-label="Choose an option">
                                <option value="" disabled selected>Select an option...</option>

                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                                PreparedStatement ps = con.prepareStatement("SELECT sub_cid, sub_cname FROM p_subcategory");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    int subcatid = rs.getInt("sub_cid");
                                    String subcatname = rs.getString("sub_cname");
                        %>
                        <option value="<%= subcatid%>" <%= subcatid == currentsubcatid ? "selected" : ""%>><%= subcatname%></option>
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                   </select>
                        </div><br>





                    <%
                        int id = Integer.parseInt(request.getParameter("pid"));
                     

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                            PreparedStatement p = con.prepareStatement("select * from product where pid=" + id + "");
                            ResultSet r = p.executeQuery();
                            while (r.next()) {
                    %>


                    <strong class="text-light" style=" margin-top: 3px">Product Name</strong>

                    <input type="text" class="form-control mt-3"  name="pname" value="<%=r.getString(2)%>"><br>

                    <strong class="text-light"> Product Prize</strong>
                    <input type="text" class="form-control mt-3"  name="price" value="<%=r.getString(5)%>"><br>


                    <div class="mb-3">
                        <label for="DefaultFile"  class="form-label text-light"> Product Image </label>
                        <input class="form-control"  type="file" id="DefaultFile" name="img">

                        <img style="margin: 15px" src="cofimg/<%=r.getString(3)%>" class="rounded" alt="Cinque Terre" width="175" height="150"><br>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="comment" class="form-label text-light">Description</label>
                        <textarea class="form-control" rows="3" id="comment" name="textar" ><%=r.getString(6)%></textarea>
                    </div>
                    <input type="hidden" class="form-control mt-3" name="piname" value="<%=r.getString(3)%>"><br>
                    <input type="hidden" name="ppath" value="<%=r.getString(4)%>" />
                    <input type="hidden" name="pid" value="<%=r.getString(1)%>" />

                    <button type="submit" class="btn btn-danger" >update product</button>

                </div>
            </div>
        </form> 





        <%
                }

            } catch (Exception e) {

            }

        %>
    </body>
</html>

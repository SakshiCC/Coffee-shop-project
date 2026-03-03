<%-- 
    Document   : productins
    Created on : 16 Mar, 2025, 1:28:13 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Prod Ins Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


        <style>

            body{
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
               background-color: #000000;
                background-size: 100% 100%;

                background-position: center;
            }
            #Alert{
                /*{   margin-left: 80px;*/
                align-self: center;
                margin-top: 10px;
            }

        </style>
        <script type="text/javascript">

            function Del(a)
            {

                var x = confirm("Are you sure?");
                if (x)
                {

                    window.location.href = 'proddel.jsp?pid=' + a;
                }
            }
            function setdisplay()
            {
                const a = document.getElementById('Alert');
                a.style.display = "center";
            }
        </script>
    </head>
    <body style="background-color: #000000;" >
        <jsp:include page="admsidebar.jsp"></jsp:include>

       



    <div style=" margin-top: 100px">


        <%    
 session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("admin_login.jsp");
            } else {

                String s = request.getParameter("f");
                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                PreparedStatement pst = con.prepareStatement("select *from p_subcategory");
                ResultSet rst = pst.executeQuery();
        %>
         <center>
        <%
            if (s != null && s.equals("invalid")) {
        %>
        <script>
            setdisplay();
        </script>
        <div id="Alert">
            <div class="alert alert-danger alert-dismissible w-25 fade show" role="alert">
                <strong>sorry !</strong> <br> This Product already Exists !!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">

                </button>
            </div>
        </div>
        <%
            }

        %>

    </center>


        <div>

            <form action="uploadimg1" method="post" enctype="multipart/form-data">


                <div class="col-xs-3" style=" width: 50%;  height: 100%; padding: 5px 35px 5px 35px; margin: 15px 250px 15px 250px;  background: transparent ;backdrop-filter: blur(20px); border: 2px solid rgba(255,255,255,.5); border-radius: 20px;text-align: center;"   >

                    <h1 class="text-light" style="text-align:center">MANAGE PRODUCT</h1>
                    <strong class="text-light"> Product Name</strong>
                    <input type="text" class="form-control mt-3"  name="pname" required ><br>
                    <div class="container mt-3 " style="text-align:center;">
                        <label for="dropdownTextField" class="form-label text-light">Choose an Option</label>
                        <select id="dropdownTextField" class="form-select " name="subcategory" required aria-label="Choose an option">
                            <option value="" disabled selected>Select an option...</option>


                            <%
                                while (rst.next()) {
                            %>

                            <option value="<%= rst.getInt("sub_cid")%>"><%= rst.getString("sub_cname")%></option>

                            <%
                                    }

                                } catch (Exception e) {
                                    out.print(e);
                                }

                            %>

                        </select>
                    </div><br>

                    <strong class="text-light">Product Prize</strong>
                    <input type="text" class="form-control mt-3"  name="price" required ><br>
                    <div class="mb-3">
                        <label for="DefaultFile"class="form-label text-light"> Product Image </label>
                        <input class="form-control"  type="file" id="DefaultFile" name="img" required><br>
                    </div>
                    <div class="mb-3 mt-3 text-light">
                        <label for="comment">Description</label>
                        <textarea class="form-control" rows="3" id="comment" name="textar" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-light text-light"  style="background: linear-gradient(45deg, #A97142, #D2A679); 
              border: 2px solid #E0C3A5;
              color: white; font-weight: bold; border-radius: 8px; 
              padding: 10px 20px; 
              box-shadow: 0 4px 8px rgba(224, 195, 165, 0.5);"  >ADD PRODUCT</button>
                </div>   
            </form>
        </div>  

        <%                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                //out.println(" Connection Successfull");
                PreparedStatement p = con.prepareStatement(" SELECT p.pid, p.pname, p.pimg, p.pimg_path, p.p_price, p.pdesc, s.sub_cname FROM product p INNER JOIN p_subcategory s ON p.sub_cid = s.sub_cid;");

                ResultSet rs = p.executeQuery();
        %>
        <div class="container mt-3 p-3" style="margin-top: 50px; align-items: center; width: 100% ">         
            <table class="table table-dark table-hover table-striped" >
                <thead>
                    <tr>
                        <th>Sr.No.</th>
                        <th> Product</th>
                        <th> Name</th>
                        <th> Sub Category</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead><%
                    while (rs.next()) {
                %>




                <tbody>
                    <tr>
                        <td><%= rs.getInt("pid")%></td>
                        <td><img style="margin: 15px; width: 100px; height:100px" src="cofimg/<%=rs.getString("pimg")%>" class="img-fluid rounded" alt="Cinque Terre" width="150" height="125"></td>
                        <td><%= rs.getString("pname")%></td>
                        <td><%= rs.getString("sub_cname")%></td>
                        <td><%= rs.getString("pdesc")%></td>
                        <td>Rs.<%= rs.getString("p_price")%></td>
                        <td> <button type="button" class="btn btn-light"  onclick="window.location.href = 'edit.jsp?pid=' + '<%=rs.getInt(1)%>'" style="background: linear-gradient(45deg, #FFA726, #FFB74D); 
                       color: white; font-weight: bold; border-radius: 8px; 
                       padding: 8px 15px; box-shadow: 0 4px 8px rgba(255, 183, 77, 0.3);">Edit</button></td>
                        <td> <button type="button" class="btn btn-light" onclick="Del(<%= rs.getInt(1)%>)" style="background: linear-gradient(45deg, #D72638, #FF3B3F); 
                            color: white; font-weight: bold; border-radius: 8px; 
                            padding: 8px 15px; box-shadow: 0 4px 8px rgba(215, 38, 56, 0.3);">Delete</button></td> 
                    </tr>
                </tbody>


                <%
                    }
                %>
            </table></div>
            <%
                    } catch (Exception e) {
                        out.print(e);
                    }
                }
            %>


    </div>
</body>
</html>


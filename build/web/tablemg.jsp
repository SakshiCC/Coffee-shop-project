<%-- 
    Document   : tablemg
    Created on : 16 Mar, 2025, 2:12:23 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>


        <script type="text/javascript">

            function Del(a, b)
            {

                var x = confirm("Are you sure?");
                if (x)
                {

                    window.location.href = 'deltbl.jsp?t_id=' + a + '&tcat=' + b;
                }
            }
            function setdisplay()
            {
                 const a = document.getElementById('Alert');
                a.style.display="center";
            }

        </script>

        <style>
            .body1{
                margin-top: 120px;
                align-items: center;
                margin-bottom: 20px;
            }
            #Alert{

                align-self: center;
                margin-top: 50px;
            }
        </style>
    </head>
    <body style="background-color: black;">
        <jsp:include page="admsidebar.jsp"></jsp:include>

        <%

            session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("admin_login.jsp");
            } else {
                String adm = (String) session.getAttribute("email");
            }
            int tcid = Integer.parseInt(request.getParameter("tcatid"));

            String s = request.getParameter("f");
            if (s != null && s.equals("invalid")) {
        %>
        <script>
            setdisplay();</script>
    <center>  <div id="Alert">
            <div class="alert alert-danger alert-dismissible w-25 fade show" role="alert">
                <strong>sorry !</strong> <br> This Table already Exists !!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div></center>
        <%
            }
        %>

    <div class="body1" >
        <div>

            <form action="TableAdd" method="post" enctype="multipart/form-data">


                <div class="col-xs-3" id="mngprd"style=" width: 40%; height: 80%; padding: 5px 35px 5px 35px; margin: 15px 135px 15px 250px;  background: transparent ;backdrop-filter: blur(20px); border: 2px solid rgba(255,255,255,.5); border-radius: 20px;text-align: center;"   >

                    <h1 class="text-light" style="text-align:center">MANAGE TABLES</h1>
                    <div class="mb-3 mt-3 text-light">
                        <label for="comment">category</label>
                        <input type='number' class="form-control"  name="tcat"  value=<%=tcid%> readonly>
                    </div>
                    <div class="mb-3 mt-3 text-light">
                        <label for="comment">Table ID</label>
                        <input type='number' class="form-control"  name="tblid" required>

                    </div>
                    <strong class="text-light">Table Price</strong>
                    <input type="text" class="form-control mt-3"  name="price" required ><br>
                    <div class="mb-3">
                        <label for="DefaultFile" class="form-label text-light"> Table Image </label>
                        <input class="form-control"  type="file" id="DefaultFile" name="img" required><br>
                    </div>
                    <div class="mb-3 mt-3 text-light">
                        <label for="comment">Description</label>
                        <textarea class="form-control" rows="3" id="comment" name="desc" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-light text-light"  style="background: linear-gradient(45deg, #A97142, #D2A679); 
              border: 2px solid #E0C3A5;
              color: white; font-weight: bold; border-radius: 8px; 
              padding: 10px 20px; 
              box-shadow: 0 4px 8px rgba(224, 195, 165, 0.5);" >ADD TABLE</button>
                </div>   
            </form>
        </div>  


        <%

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                //out.println(" Connection Successfull");
                PreparedStatement p = con.prepareStatement("select tid,timg,t_price,tdesc,t_cid from tables");

                ResultSet rs = p.executeQuery();
        %>

        <div class="container mt-3" style="margin-top: 50px">         
            <table class="table table-dark table-hover table-striped" >
                <thead>
                    <tr>
                        <th>Table Id</th>
                        <th>Image</th>
                        <th> Price</th>
                        <th>Description</th>
                        <th>category</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead><%
                    while (rs.next()) {
                %>
                <tbody>
                    <tr>
                        <td><%= rs.getInt(1)%></td>
                        <td><img style="margin: 7px;" src="tableimages/<%=rs.getString(2)%>" class="img-fluid rounded" alt="Cinque Terre" width="90" height="90"></td>
                        <td>Rs.<%= rs.getDouble(3)%></td>

                        <td><%= rs.getString(4)%></td>
                        <%
                            int cid = rs.getInt(5);

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                                PreparedStatement p2 = con2.prepareStatement("select t_cname from t_category where t_cid=" + cid);
                                ResultSet rst = p2.executeQuery();
                                while (rst.next()) {
                        %>
                        <td><%= rst.getString(1)%></td>
                        <td> <button type="button" class="btn btn"  onclick="window.location.href = 'updtbl.jsp?tid=' + '<%=rs.getInt(1)%>'" style="background: linear-gradient(45deg, #FFA726, #FFB74D); 
                       color: white; font-weight: bold; border-radius: 8px; 
                       padding: 8px 15px; box-shadow: 0 4px 8px rgba(255, 183, 77, 0.3);">Edit</button></td>
                        <td> <button type="button" class="btn btn-light" onclick="Del(<%= rs.getInt(1)%>,<%=rs.getInt(5)%>)" style="background: linear-gradient(45deg, #D72638, #FF3B3F); 
                            color: white; font-weight: bold; border-radius: 8px; 
                            padding: 8px 15px; box-shadow: 0 4px 8px rgba(215, 38, 56, 0.3);">Delete</button></td> 
                    </tr>
                </tbody>


                <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    }
                %>
            </table></div>
            <%
                } catch (Exception e) {
                    out.print(e);
                }

            %>


    </div>
</body>
</html>


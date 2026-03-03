<%-- 
    Document   : tblcatmg
    Created on : 16 Mar, 2025, 1:45:59 PM
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
                height: 350px;
                width: 400px;
                padding: 50px 25px 25px 25px;
                color: white;
                border-radius: 10px;
                margin-top: 50px;
                margin-bottom: 10px;

            }
            #btn{

                border-radius: 5px;
                height: 35px;
                width: 70px;
                background-color: white;
                margin-top: 20px;

            }
            .displaytbl{
                margin-left: 60px;
                margin-right: 60px;
            }
            #Alert
            {    
                align-self: center;
                margin-top: 10px;
            }


        </style>

        <%-- <link rel="stylesheet" href="Common_css/admcat.css">--%>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>

        <script>
            function del(tblcatid)
            {
                var res = window.confirm("are you sure to delete the data ?");

                if (res)
                {
                    window.location.href = "deltblcat.jsp?tblid=" + tblcatid;
                }
            }
            function setdisplay()
            {
                const a = document.getElementById('Alert');
                a.style.display = "center";
            }
        </script>

    </head>

    <body style="background-color: black">
        <jsp:include page="admsidebar.jsp"></jsp:include>
        <%
            session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("admin_login.jsp");
            } else {
                String adm = (String) session.getAttribute("email");
                String s = request.getParameter("f");

        %>               
    <center>
        <%                 if (s != null && s.equals("invalid")) {
        %>
        <script>
            setdisplay();
        </script>
        <div id="Alert">
            <div class="alert alert-danger alert-dismissible w-25 fade show" role="alert">
                <strong>sorry !</strong> <br> This category already Exists !!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">

                </button>
            </div>
        </div>
        <%
            }

        %>

        <div id="hed2">
            <h2 style="color: white; font-style: italic;"> MANAGE TABLE CATEGORY</h2>
            <form class="form1" action="tblcatcode.jsp"><br>

                <div class="mb-3">
                    <label for="formGroupExampleInput2" class="form-label">Category Name</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" name="t2" required>
                </div>     
               <button class="btn"  type="submit" 
       style="background: linear-gradient(45deg, #A97142, #D2A679); 
              border: 2px solid #E0C3A5;
              color: white; font-weight: bold; border-radius: 8px; 
              padding: 10px 20px; 
              box-shadow: 0 4px 8px rgba(224, 195, 165, 0.5);">
     Add
</button><br><br>
            </form>
        </div>
    </center> 

    <%              String url, pass, user;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/coffeeshop";
            user = "root";
            pass = "sweet15";
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "select *from t_category";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rst = pst.executeQuery();
    %>




    <div class="displaytbl">
        <table class="table table-borderd border-dartk  table-dark table-striped table-hover align-middle">
            <thead>
                <tr>
                    <th scope="col">Table Category Id</th>
                    <th scope="col">Category Name</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Add</th>

                </tr>
            </thead>
            <%
                while (rst.next()) {
            %>

            <tr>

                <td style="color:white;"><%=rst.getInt(1)%></td>
                <td style="color:white;"><%=rst.getString(2)%></td>
                <td style="color: white;"><a href="tblcatupd.jsp?tcatid=<%=rst.getInt(1)%>" class="btn btn" style="background: linear-gradient(45deg, #FFA726, #FFB74D); 
                       color: white; font-weight: bold; border-radius: 8px; 
                       padding: 8px 15px; box-shadow: 0 4px 8px rgba(255, 183, 77, 0.3);">Update</a></td>
                <td style="color: white;"><button class="btn btn-light" onclick="del(<%=rst.getInt(1)%>)" style="background: linear-gradient(45deg, #D72638, #FF3B3F); 
                            color: white; font-weight: bold; border-radius: 8px; 
                            padding: 8px 15px; box-shadow: 0 4px 8px rgba(215, 38, 56, 0.3);">Delete</button></td>
                <td style="color: white;"><a href="tablemg.jsp?tcatid=<%=rst.getInt(1)%>" class="btn btn-light"  style="background: linear-gradient(45deg, #6D4C41, #8D6E63); 
                       color: white; font-weight: bold; border-radius: 8px; 
                       padding: 8px 15px; box-shadow: 0 4px 8px rgba(141, 110, 99, 0.3);">Add Tables</a></td>
            </tr>
            <%
                }

            %>
        </table> </div>

    <%                      } catch (Exception e) {
            out.print(e);
        }

    %>
    <%}%>

</body>
</html>


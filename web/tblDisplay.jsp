<%-- 
    Document   : tblDisplay
    Created on : 16 Mar, 2025, 3:38:11 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>booking demo Page</title>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <style>
            .cards{
                display: inline-block;
                padding-left: 40px;
                padding-right: 40px;
                margin-top: 150px;
            }
              .card {

                border: 1px solid rgba(255,255,255,0.2);
                border-radius: 15px; 
                box-shadow: 0 0px 15px rgba(0, 0, 0, 0.7); /* Dark shadow */
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            .card:hover {
                transform: scale(1.05); /* Zoom effect */
                box-shadow: 0 15px 25px rgba(255, 255, 255, 0.4); /* Light white shadow on hover */
            }

            .card-title {
                color: #FFFFFF; /* White Title */
                font-weight: bold;
                font-size: 1.2rem;
            }
            body{

                min-height: 100vh;
                background: url('image/back ground.jpg') no-repeat;
                background-size: 100% 100%;
                background-position: center;
            }

        </style>
        <script>
            function checkSes(f, tid, pr)
            {

                if (f == 1)
                {

                    alert("Please login first to book the table !");
                    window.location.href = "uhome.jsp";

                } else
                {
                    window.location.href = "bookdemo.jsp?tid=" + encodeURIComponent(tid) + "&price=" + encodeURIComponent(pr);
                }
            }

        </script>

    </head>
   
    <body>
         <%@include  file="uhome2.jsp" %>
        <%
            int f = 0;
            session = request.getSession(false);
            if (session == null || session.getAttribute("uname") == null || session.getAttribute("uid") == null) {
                f = 1;

                //response.sendRedirect("admin_login.jsp");
            } else {
                String uname = (String) session.getAttribute("uname");
                String uidstr = (String) session.getAttribute("uid");
                int uid = Integer.parseInt(uidstr);
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/coffeeshop";
                String user1 = "root";
                String pass = "sweet15";
                Connection con = DriverManager.getConnection(url, user1, pass);
                //select t.t_id,t.timg,t.tdesc,t.tprice,tc.tcatname from tblinfo t join tblcat1 on t.tcat=tc.tblid 
                String sql = "select tid,timg,tdesc,t_price from tables";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
        %>
        <div class="cards">
            <div class="card"  data-bs-theme="dark" style="width: 18rem; height: 30rem;">
                <img src="tableimages/<%=rs.getString(2)%>" class="card-img-top" alt="table img" style="width:100%; height: 50%;">
                <div class="card-body">
                    <h5 class="card-title"> Table No :<%=rs.getString(1)%></h5>
                    <p class="card-text"><%=rs.getString(3)%></p>
                    <p class="card-text">Rs.<%=rs.getInt(4)%></p>
                    <button class="btn btn-dark" onclick="checkSes(<%=f%>,<%=rs.getInt(1)%>,<%=rs.getInt(4)%>)"  style=" background-color:#724c39;" >Book</button>

                </div>
            </div> 
        </div>


        <%
                }
            } catch (Exception e) {
                out.println(e);
            }


        %>
    </body>
</html>


<%-- 
    Document   : cardDis
    Created on : 16 Mar, 2025, 4:10:38 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Display</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <style>

            .category-title {
                margin-top: 30px;
                text-align: center;
                font-weight: bold;
                font-size: 24px;
            }
            .subcategory-title {
                margin-top: 20px;
                text-align: center;
                font-size: 20px;
                color: #555;
            }
            .crd{
                display: inline-block;
                padding-left: 40px;
                padding-right: 40px;
                margin-top: 20px ;

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
            #Alert
            {    
                align-self: center;
                margin-top: 10px;
            }
            .custom-alert {
    background-color: #ff9900 !important;
     color: #4d2600 !important;
    border-color: #cc7a00 !important;
}

            body{

                min-height: 100vh;
                background: url('image/back ground.jpg') no-repeat;
                background-size: 100% 100%;
                background-position: center;
            }
            .small-circle {
                font-size: 8px;
                color:  #FFFFFF   ;
                animation: glow 1.5s infinite alternate;
            }

            @keyframes glow {
                0% { text-shadow: 0 0 5px brown; }
                100% { text-shadow: 0 0 10px brown; }
            }

            .bi-x-diamond-fill{animation: glow 1.5s infinite alternate;}

        </style>
        <script>  function setdisplay()
            {
                const a = document.getElementById('Alert');
                a.style.display = "center";
               
            }
        function redirectToPage() {
        setTimeout(function () {
            window.location.href = "uhome.jsp"; 
        }, 500); // Waits 500ms before redirecting
    }</script>
    </head>
    <body>
        <%@include  file="uhome2.jsp" %>
        <div style=" margin-top: 100px;">
            <div class="container">
                <%             String s = request.getParameter("f");
                %>
                <center>
                    <%
                        if (s != null && s.equals("invalid")) {
                    %>
                    <script>
                        setdisplay();
                    </script>
                    <div id="Alert">
                        <div class="alert custom-alert alert-dismissible w-25 fade show" role="alert">
                            <strong>Please Login first!</strong> <br> 
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"  onclick="redirectToPage()">

                            </button>
                        </div>
                    </div>
                    <%
                        }

                    %>

                    <h1 class="text-center mb-2" style="color: white;">Our Menu</h1>
                    <%            try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3306/coffeeshop";
                            String user1 = "root";
                            String pass = "sweet15";
                            Connection con = DriverManager.getConnection(url, user1, pass);

                            // Fetch all categories
                            String getCategories = "SELECT p_cid, p_cname FROM p_category";
                            PreparedStatement pstCat = con.prepareStatement(getCategories);
                            ResultSet rsCat = pstCat.executeQuery();

                            while (rsCat.next()) {
                                int mainCategory = rsCat.getInt("p_cid");
                                String catname = rsCat.getString("p_cname");
                                // Display main category
                    %>

                    <div class="text-center">
                        <h2 class="category-title" style="color: white; display: inline-block; position: relative; padding-bottom: 5px;">
                            <i class="bi bi-x-diamond-fill"> </i>  <%= catname%>  <i class="bi bi-x-diamond-fill"> </i> 
                        </h2>

                    </div>

                    <%             // Fetch subcategories under this category
                        String getSubcategories = "SELECT sub_cid, sub_cname FROM p_subcategory WHERE p_cid=?";
                        PreparedStatement pstSub = con.prepareStatement(getSubcategories);
                        pstSub.setInt(1, mainCategory);
                        ResultSet rsSub = pstSub.executeQuery();

                        while (rsSub.next()) {
                            int subcid = rsSub.getInt("sub_cid");
                            String subcategory = rsSub.getString("sub_cname");
                            // Display subcategory
                    %>        
                    <hr style="width: 50%; margin: 5px auto 15px; border: 1px solid white;">       
                    <h3 class="subcategory-title" style="color: white; ">
                        <i class="fas fa-circle small-circle"></i> <%= subcategory%> <i class="fas fa-circle small-circle"></i> 
                    </h3>
                    <hr style="width: 50%; margin: 5px auto 15px; border: 1px solid white;">

                    <%          // Fetch products for this subcategory
                        String sql = "SELECT pid, pimg, pname, pdesc, p_price FROM product WHERE sub_cid=?";
                        PreparedStatement pstProd = con.prepareStatement(sql);
                        pstProd.setInt(1, subcid);
                        ResultSet rsProd = pstProd.executeQuery();

                    %>
                    <div class="row justify-content-center">
                        <% while (rsProd.next()) {%>
                        <div class=" crd col-md-4 mb-4">
                            <div class="card custom-shadow"  data-bs-theme="dark" style="width: 18rem; height: 30rem; ">
                                <img src="cofimg/<%= rsProd.getString(2)%>" class="card-img-top" alt="Product Image" style="width:100%; height: 50%;">
                                <div class="card-body text-center">
                                    <h5 class="card-title" style="color: white;"><%= rsProd.getString(3)%></h5>
                                    <p class="card-text" style="color: white;"><%= rsProd.getString(4)%></p>
                                    <p class="card-text font-weight-bold" style="color: white;">Rs.<%= rsProd.getInt(5)%></p>
                                    <a href='insinCart.jsp?pid=<%=rsProd.getInt(1)%>' class="btn" style="background-color: #724c39;">Add to cart</a>
                                    <a href='insinCart.jsp?pid=<%=rsProd.getInt(1)%>' class="btn" style="margin-left: 25px;background-color:#724c39; ">Take Away</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    %>
            </div>
        </div>
    </body>
</html>


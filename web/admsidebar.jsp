<%-- 
    Document   : admsidebar
    Created on : 16 Mar, 2025, 1:10:44 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sidebar Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .offcanvas-body ul li{
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 10px;
            }
            .offcanvas-body ul li a{
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <!-- <i class="bi bi-list" data-bs-toggle="offcanvas" onclick="offcanvasExample" aria-controls="offcanvasExample"></i>-->
        <nav class="navbar fixed-top navbar-light pe-3">
            <div class="container">

                <a class="btn btn-dark" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                    <i class="bi bi-list"></i>
                </a> 

                <p style="color: white; font-size: 25px; font-family: Georgia, 'Times New Roman', Times, serif; ">Cafe Friends</p>
                <img src="image/web_logo.png" alt="" width="65" height="65" class="rounded-circle taxt-dark me-5 position-absolute end-0">

            </div>
        </nav>

        <div class="offcanvas offcanvas-start" style="width: 300px; background-color: #854836;" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel" style="margin-right: 15px; margin-left: 20px; color: white;font-family: Georgia, 'Times New Roman', Times, serif; ">Cafe Friends</h5>
                <img src="image/web_logo.png" alt="" width="65" height="65" class="rounded-circle taxt-dark">
                <!-- <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>-->
            </div><hr style="color: #FFB22C;"/>
            <div class="offcanvas-body">
                <ul type="none">
                    <li>
                        <i class="bi bi-columns-gap" style="font-size: 25px; color: white;"></i>
                        <a href="admhome.jsp" style="text-decoration: none; font-size: 20px; color: white;">Home</a>
                    </li>
                    <li>
                        <i class="bi bi-x-diamond-fill" style="font-size: 25px; color: white;"></i>
                        <a href="cattegoryMng.jsp" style="text-decoration: none; font-size: 20px; color: white;">Product Category</a>       

                    </li>
                    <li>
                        <i class="bi bi-cup-hot" style="font-size: 25px; color: white;"></i>
                        <a href="productins.jsp" style="text-decoration: none; font-size: 20px; color: white;">Products</a>
                    </li>
                    <li>
                        <i class="bi bi-cash-stack" style="font-size: 25px; color: white;"></i>
                        <a href="tblcatmg.jsp" style="text-decoration: none; font-size: 20px; color: white;">Tables</a>
                    </li>
                    <li>
                        <i class="bi bi-list-check" style="font-size: 25px; color: white;"></i>
                        <a href="admorders.jsp" style="text-decoration: none; font-size: 20px; color: white;">Order</a>
                    </li>
                    <li>
                        <i class="bi bi-calendar-check" style="font-size: 25px; color: white;"></i>
                        <a href="admbooking.jsp" style="text-decoration: none; font-size: 20px; color: white;">Bookings</a>
                    </li>
<!--                    <li>
                        <i class="bi bi-reception-4" style="font-size: 25px; color: white;"></i>
                        <a href="#" style="text-decoration: none; font-size: 20px; color: white;">Reports</a>
                    </li>-->
                    <li>
                        <i class="bi bi-box-arrow-right" style="font-size: 25px; color: white;"></i>
                        <a href="logout.jsp" style="text-decoration: none; font-size: 20px; color: white;">Log Out</a>
                    </li>
                </ul>

            </div>
        </div>

    </body>
</html>
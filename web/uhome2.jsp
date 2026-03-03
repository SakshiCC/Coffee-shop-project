<%-- 
    Document   : uhome2
    Created on : 16 Mar, 2025, 12:31:11 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="uhome2styl.css">


    </head>
    <body>

        <header>

            <nav class="navbar navbar-dark navigation fixed-top" style="background:  #000000;">
                <div class="container">
                    <p class="navbar-brand mb-0 h1" style="color: #eab9a1;; font-size: 25px;font-family: Georgia, 'Times New Roman', Times, serif; font-weight: bold;">
                        <img src="image/web_logo.png" alt="" width="65" height="65" class="rounded-circle">
                        <i class="logo"> Cafe Friends</i></p>
                    <a class="nav-link  fs-5" href="uhome.jsp">Home</a>
                    
                    <a class=" nav-link fs-5" href="tblDisplay.jsp">Tables</a>
                    <a class=" nav-link fs-5" href="cardDis.jsp">Menu</a>
                   
                    <%
                        String user = (String) session.getAttribute("uname");
                        if (user != null) {
                    %>
<!--                    <a class="nav-link fs-5" href="tblDisplay">Book a Table</a>-->
                    <a class="nav-link fs-5" href="addtocart.jsp">Cart</a>
                     <a class="nav-link fs-5" href="cartdisplay.jsp">Your Tables</a>
                    <a class=" nav-link fs-5" href="showOrder.jsp">History</a>
                    <%
                        } else {

                        }
                    %>

            </nav>
        </header>








        <script src="uhome.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


    </body>
</html>


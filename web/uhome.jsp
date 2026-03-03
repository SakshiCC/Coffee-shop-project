<%-- 
    Document   : uhome
    Created on : 16 Mar, 2025, 12:29:32 PM
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
           <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

        <link rel="stylesheet" href="uhomestyl.css">

        <style>
                        #Alert
            {    
                align-self: center;
                margin-top: 10px;
                width: 1500px;
            }
            .custom-alert {
    background-color: #ff9900 !important;
     color: #4d2600 !important;
    border-color: #cc7a00 !important;
}

        </style>
         <script type="text/javascript"> 
      function showAlert(shmessage)
      {
          window.addEventListener('load',function(){alert(shmessage);}) ;
         
      }
    
      
         </script>
        <script type="text/javascript">
           
    
     function setdisplay()
            {
                const a = document.getElementById('Alert');
                a.style.display = "center";
               
            }
    
   

        </script>
    </head>
    <body  style="background-color: #000000;">
        <div class="bd">
            <header>

                <nav class="navbar navbar-dark navigation fixed-top" style=" background-color:  #000000;" >
                    <div class="container">
                        <p class="navbar-brand mb-0 h1" style="color: #eab9a1; font-size: 25px;font-family: Georgia, 'Times New Roman', Times, serif; font-weight: bold;">
                            <img src="image/web_logo.png" alt="" width="65" height="65" class="rounded-circle">
                            <i class="logo"> Cafe Friends</i></p>
                        <a class="nav-link  fs-5" href="uhome.jsp">Home</a>
                        <a class=" nav-link fs-5" href="#about">About</a>
                        <a class=" nav-link fs-5" href="tblDisplay.jsp">Tables</a>
                        <a class=" nav-link fs-5" href="cardDis.jsp">Menu</a>

                        <%
                            String user = (String) session.getAttribute("uname");
                            if (user != null) {
                        %>
                        <!--                     <a class="nav-link fs-5" href="#">Book a Table</a>-->
                        <a class="nav-link fs-5" href="addtocart.jsp">Cart</a>
                         <a class="nav-link fs-5" href="cartdisplay.jsp">Your Tables</a>
                        <a class=" nav-link fs-5" href="showOrder.jsp">History</a>
                        <button class="btnlogin-pop" onclick="logout()">Logout</button>
                        <%
                        } else {
                        %>
                        <button class="btnlogin-pop">Login</button>
                        <%
                            }
                        %>

                </nav>
            </header>
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
                            <strong>Invalid Email or Password!</strong> <br> 
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"  onclick="redirectToPage()">

                            </button>
                        </div>
                    </div>
                    <%
                        }
                          if (s != null && s.equals("valid")) {
                    %>
                    <script>
                        setdisplay();
                    </script>
                    <div id="Alert">
                        <div class="alert custom-alert alert-dismissible w-25 fade show" role="alert">
                            <strong>Login Successfull!</strong> <br> 
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"  onclick="redirectToPage()">

                            </button>
                        </div>
                    </div>
                    <%
                        }

                    %>

             

            <div class="wrapper">
                <span class="icon-close">
                    <ion-icon name="close-outline"></ion-icon>
                </span>
                <div class="form-box login">
                    <h1> Login</h1>
                    <form action="userlogcheck.jsp" method="post">

                        <div class="inputbox">
                            <span class="icon"><ion-icon name="mail"></ion-icon></span>
                            <input type="email" id="email" name="umail" required>
                            <label>Email</label>
                        </div>
                        <div class="inputbox">

                            <input type="password" name="upass"  maxlength="8" required>
                            <label>Password</label>
                        </div>
                        <div class="forgot">
                            <a href="#"  onclick="getNumberAndRedirect(event)" >Forgot Password?</a>

                        </div>

                        <button type="submit"   class="fbt" onclick="Clk()"   >Login</button>


                        <div class="regLink">
                            <p>Don't have an account?<a href="#" class="register-link"> Register</a></p>
                        </div>
                    </form>

                </div>

                <div class="form-box reg">
                    <h1> Register</h1>
                    <form action="ulogin.jsp" method="post" onsubmit="validateForm(event)">
                        <div class="inputbox">

                            <input type="text" name="uname"  required>
                            <label> Enter Your Name</label>
                        </div>
                        <div class="inputbox">

                            <input type="tel" name="umob" pattern="[6-9]{1}[0-9]{9}" maxlength="10" required>

                            <label> Enter Mobile Number</label>
                        </div>

                        <div class="inputbox">

                            <input type="email" name="umail" required>
                            <label>Email</label>
                        </div>
                        <div class="inputbox">

                            <input type="password" name="upass" maxlength="8" minlength="6" required>
                            <label>Password</label>
                        </div>
                        <div class="inputbox">

                            <input type="text" name="uadd" required >
                            <label> Enter your Address</label>
                        </div>
                        <div class="inputbox">

                            <input type="number" name="uscrq" required >
                            <label>Question:What Is Your Favourite Number?</label>
                        </div>


                        <button type="submit" class="fbt">Register</button>

                        <div class="loginLink">
                            <p>Already have an account?<a href="#" class="login-link"> Login</a></p>
                        </div>
                    </form>

                </div>
            </div>
        </div>

 <% String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null)
        { %> <script type="text/javascript"> 
            showAlert("<%= errorMessage %>"); </script> 
        <% } %>
        



        <script>
            function getNumberAndRedirect(event) {
                event.preventDefault(); // Prevent the default anchor link behavior
                let email = document.getElementById('email').value;
                // Prompt user for a number
                if (email) {
                    let userNumber = prompt("SECURITY QUESTION: WHAT IS YOUR FAVOURITE NUMER?");

                    // Check if the user entered a valid number (not null or NaN)
                    if (userNumber && !isNaN(userNumber)) {
                        // Construct the new URL with the number passed as a query parameter
                        // Your next JSP page
                        window.location.href = 'forgot.jsp?number=' + encodeURIComponent(userNumber) + '&email=' + encodeURIComponent(email);

//                 window.location.href='tbldel.jsp?t_id='+a;
                    } else {
                        alert("Please enter a valid number.");
                    }
                } else {
                    alert("Please enter a valid email address.");
                }
            }
        </script>

        <script src="uhome.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

          


 <div id="about" style="background-color: black;">
    <section class="about-us">
        <img src="image/ab.jpg" alt="Coffee Shop Image">
        <div>
            <h2 style=" color:  #ff9900">About Us</h2>
            <p>
                Welcome to our coffee shop! We are passionate about serving the finest coffee, made from freshly ground beans and love.
                Our cozy ambiance and delicious treats make us the perfect spot to relax and unwind. Join us for a warm cup of coffee
                and experience the aroma of happiness.
            </p>
        </div>
    </section>

    <!-- Footer Section --><footer class="footer">
    <div class="footer-content">
        <h3>CafeFriends</h3>
        <p>We provide the best facility to order the Takaway for saving your precious time and also the availability for the table booking in prior.</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="admin_login.jsp"><i class="fas fa-user-shield"></i></a> <!-- Admin Icon -->
        </div>
    </div>
    <div class="footer-content">
        <h3>Our Store</h3>
        <a href="htm.jsp">Home</a><br>
        <a href="#about">About</a><br>
        <a href="tblDisplay.jsp">Book Table</a><br>
        <a href="cardDis.jsp">Takeaway</a>
    </div>
    <div class="footer-content">
        <h3>Get In Touch</h3>
        <p><i class="fas fa-map-marker-alt"></i> 2443 Oak Ridge Omaha, GA 45056</p>
        <p><i class="fas fa-phone"></i> 207-8767-452</p>
        <p><i class="fas fa-envelope"></i> cafefriends@site.com</p>
    </div>
</footer>
</div>


    </body>
</html>




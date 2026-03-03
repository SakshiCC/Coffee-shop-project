<%-- 
    Document   : admin_login
    Created on : 16 Mar, 2025, 1:06:52 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        
    <script type="text/javascript"> 
        function setdisplay() 
            {    const a = document.getElementById('Alert');
                a.style.display="center";
            }
        </script>
        
      
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body><center>
        <form action="adlogcode.jsp">
         <section class="vh-100" style="background-color: #854836;">
             <div class="container py-5 h-100">
           <div class="row d-flex justify-content-center align-items-center h-100">
              
        
        <%  
         String s=request.getParameter("f");
         if(s != null && s.equals("invalid") )
         {
             %>
             <script>
             setdisplay();
         </script>
<div id="Alert">
<div class="alert alert-warning alert-dismissible w-25 fade show" role="alert">
  <strong>sorry !</strong> <br>Invalid username or password !!
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
      
  </button>
</div>
</div>
     <%
        }
      %>    
        
   
  
     <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <div class="card shadow-2-strong" style="border-radius: 2rem;">
          <div class="card-body p-5 text-center">
              <img src="image/web_logo.png" style="border-radius: 80px; width: 80px; height: 80px; ">
              <h2 style="color: #982B1C;font-family: Georgia, 'Times New Roman', Times, serif; font-weight: bold;">Cafe Friends</h2>
              <h3 class="mb-5">Sign in</h3>

           <div class="form-floating mb-3">
         <input type="email" name="t1" class="form-control" id="floatingInput" placeholder="name@example.com" required>
       <label for="floatingInput">Email address</label>
          </div>
      <div class="form-floating">
  <input type="password"  name="t2" class="form-control" id="floatingPassword" placeholder="Password" required>
  <label for="floatingPassword">Password</label>
      </div><br><br>
              <div>
        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
              </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
    </section>    
        <center>         
</body>
</html>

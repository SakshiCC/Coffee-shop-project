package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class uhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Bootstrap Example</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("           <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"uhomestyl.css\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("                        #Alert\n");
      out.write("            {    \n");
      out.write("                align-self: center;\n");
      out.write("                margin-top: 10px;\n");
      out.write("                width: 1500px;\n");
      out.write("            }\n");
      out.write("            .custom-alert {\n");
      out.write("    background-color: #ff9900 !important;\n");
      out.write("     color: #4d2600 !important;\n");
      out.write("    border-color: #cc7a00 !important;\n");
      out.write("}\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("         <script type=\"text/javascript\"> \n");
      out.write("      function showAlert(shmessage)\n");
      out.write("      {\n");
      out.write("          window.addEventListener('load',function(){alert(shmessage);}) ;\n");
      out.write("         \n");
      out.write("      }\n");
      out.write("    \n");
      out.write("      \n");
      out.write("         </script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("           \n");
      out.write("    \n");
      out.write("     function setdisplay()\n");
      out.write("            {\n");
      out.write("                const a = document.getElementById('Alert');\n");
      out.write("                a.style.display = \"center\";\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("    \n");
      out.write("   \n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body  style=\"background-color: #000000;\">\n");
      out.write("        <div class=\"bd\">\n");
      out.write("            <header>\n");
      out.write("\n");
      out.write("                <nav class=\"navbar navbar-dark navigation fixed-top\" style=\" background-color:  #000000;\" >\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <p class=\"navbar-brand mb-0 h1\" style=\"color: #eab9a1; font-size: 25px;font-family: Georgia, 'Times New Roman', Times, serif; font-weight: bold;\">\n");
      out.write("                            <img src=\"image/web_logo.png\" alt=\"\" width=\"65\" height=\"65\" class=\"rounded-circle\">\n");
      out.write("                            <i class=\"logo\"> Cafe Friends</i></p>\n");
      out.write("                        <a class=\"nav-link  fs-5\" href=\"uhome.jsp\">Home</a>\n");
      out.write("                        <a class=\" nav-link fs-5\" href=\"#about\">About</a>\n");
      out.write("                        <a class=\" nav-link fs-5\" href=\"tblDisplay.jsp\">Tables</a>\n");
      out.write("                        <a class=\" nav-link fs-5\" href=\"cardDis.jsp\">Menu</a>\n");
      out.write("\n");
      out.write("                        ");

                            String user = (String) session.getAttribute("uname");
                            if (user != null) {
                        
      out.write("\n");
      out.write("                        <!--                     <a class=\"nav-link fs-5\" href=\"#\">Book a Table</a>-->\n");
      out.write("                        <a class=\"nav-link fs-5\" href=\"addtocart.jsp\">Cart</a>\n");
      out.write("                         <a class=\"nav-link fs-5\" href=\"cartdisplay.jsp\">Your Tables</a>\n");
      out.write("                        <a class=\" nav-link fs-5\" href=\"showOrder.jsp\">History</a>\n");
      out.write("                        <button class=\"btnlogin-pop\" onclick=\"logout()\">Logout</button>\n");
      out.write("                        ");

                        } else {
                        
      out.write("\n");
      out.write("                        <button class=\"btnlogin-pop\">Login</button>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("                </nav>\n");
      out.write("            </header>\n");
             String s = request.getParameter("f");
                
      out.write("\n");
      out.write("                <center>\n");
      out.write("                    ");

                        if (s != null && s.equals("invalid")) {
                    
      out.write("\n");
      out.write("                    <script>\n");
      out.write("                        setdisplay();\n");
      out.write("                    </script>\n");
      out.write("                    <div id=\"Alert\">\n");
      out.write("                        <div class=\"alert custom-alert alert-dismissible w-25 fade show\" role=\"alert\">\n");
      out.write("                            <strong>Invalid Email or Password!</strong> <br> \n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"  onclick=\"redirectToPage()\">\n");
      out.write("\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }
                          if (s != null && s.equals("valid")) {
                    
      out.write("\n");
      out.write("                    <script>\n");
      out.write("                        setdisplay();\n");
      out.write("                    </script>\n");
      out.write("                    <div id=\"Alert\">\n");
      out.write("                        <div class=\"alert custom-alert alert-dismissible w-25 fade show\" role=\"alert\">\n");
      out.write("                            <strong>Login Successfull!</strong> <br> \n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"  onclick=\"redirectToPage()\">\n");
      out.write("\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }

                    
      out.write("\n");
      out.write("\n");
      out.write("             \n");
      out.write("\n");
      out.write("            <div class=\"wrapper\">\n");
      out.write("                <span class=\"icon-close\">\n");
      out.write("                    <ion-icon name=\"close-outline\"></ion-icon>\n");
      out.write("                </span>\n");
      out.write("                <div class=\"form-box login\">\n");
      out.write("                    <h1> Login</h1>\n");
      out.write("                    <form action=\"userlogcheck.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("                            <span class=\"icon\"><ion-icon name=\"mail\"></ion-icon></span>\n");
      out.write("                            <input type=\"email\" id=\"email\" name=\"umail\" required>\n");
      out.write("                            <label>Email</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"password\" name=\"upass\"  maxlength=\"8\" required>\n");
      out.write("                            <label>Password</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"forgot\">\n");
      out.write("                            <a href=\"#\"  onclick=\"getNumberAndRedirect(event)\" >Forgot Password?</a>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <button type=\"submit\"   class=\"fbt\" onclick=\"Clk()\"   >Login</button>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"regLink\">\n");
      out.write("                            <p>Don't have an account?<a href=\"#\" class=\"register-link\"> Register</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-box reg\">\n");
      out.write("                    <h1> Register</h1>\n");
      out.write("                    <form action=\"ulogin.jsp\" method=\"post\" onsubmit=\"validateForm(event)\">\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"text\" name=\"uname\"  required>\n");
      out.write("                            <label> Enter Your Name</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"tel\" name=\"umob\" pattern=\"[6-9]{1}[0-9]{9}\" maxlength=\"10\" required>\n");
      out.write("\n");
      out.write("                            <label> Enter Mobile Number</label>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"email\" name=\"umail\" required>\n");
      out.write("                            <label>Email</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"password\" name=\"upass\" maxlength=\"8\" minlength=\"6\" required>\n");
      out.write("                            <label>Password</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"text\" name=\"uadd\" required >\n");
      out.write("                            <label> Enter your Address</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"inputbox\">\n");
      out.write("\n");
      out.write("                            <input type=\"number\" name=\"uscrq\" required >\n");
      out.write("                            <label>Question:What Is Your Favourite Number?</label>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <button type=\"submit\" class=\"fbt\">Register</button>\n");
      out.write("\n");
      out.write("                        <div class=\"loginLink\">\n");
      out.write("                            <p>Already have an account?<a href=\"#\" class=\"login-link\"> Login</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write(" ");
 String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null)
        { 
      out.write(" <script type=\"text/javascript\"> \n");
      out.write("            showAlert(\"");
      out.print( errorMessage );
      out.write("\"); </script> \n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function getNumberAndRedirect(event) {\n");
      out.write("                event.preventDefault(); // Prevent the default anchor link behavior\n");
      out.write("                let email = document.getElementById('email').value;\n");
      out.write("                // Prompt user for a number\n");
      out.write("                if (email) {\n");
      out.write("                    let userNumber = prompt(\"SECURITY QUESTION: WHAT IS YOUR FAVOURITE NUMER?\");\n");
      out.write("\n");
      out.write("                    // Check if the user entered a valid number (not null or NaN)\n");
      out.write("                    if (userNumber && !isNaN(userNumber)) {\n");
      out.write("                        // Construct the new URL with the number passed as a query parameter\n");
      out.write("                        // Your next JSP page\n");
      out.write("                        window.location.href = 'forgot.jsp?number=' + encodeURIComponent(userNumber) + '&email=' + encodeURIComponent(email);\n");
      out.write("\n");
      out.write("//                 window.location.href='tbldel.jsp?t_id='+a;\n");
      out.write("                    } else {\n");
      out.write("                        alert(\"Please enter a valid number.\");\n");
      out.write("                    }\n");
      out.write("                } else {\n");
      out.write("                    alert(\"Please enter a valid email address.\");\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <script src=\"uhome.js\"></script>\n");
      out.write("        <script type=\"module\" src=\"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js\"></script>\n");
      out.write("        <script nomodule src=\"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js\"></script>\n");
      out.write("\n");
      out.write("          \n");
      out.write("\n");
      out.write("\n");
      out.write(" <div id=\"about\" style=\"background-color: black;\">\n");
      out.write("    <section class=\"about-us\">\n");
      out.write("        <img src=\"image/ab.jpg\" alt=\"Coffee Shop Image\">\n");
      out.write("        <div>\n");
      out.write("            <h2 style=\" color:  #ff9900\">About Us</h2>\n");
      out.write("            <p>\n");
      out.write("                Welcome to our coffee shop! We are passionate about serving the finest coffee, made from freshly ground beans and love.\n");
      out.write("                Our cozy ambiance and delicious treats make us the perfect spot to relax and unwind. Join us for a warm cup of coffee\n");
      out.write("                and experience the aroma of happiness.\n");
      out.write("            </p>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Footer Section --><footer class=\"footer\">\n");
      out.write("    <div class=\"footer-content\">\n");
      out.write("        <h3>CafeFriends</h3>\n");
      out.write("        <p>We provide the best facility to order the Takaway for saving your precious time and also the availability for the table booking in prior.</p>\n");
      out.write("        <div class=\"social-icons\">\n");
      out.write("            <a href=\"#\"><i class=\"fab fa-facebook\"></i></a>\n");
      out.write("            <a href=\"#\"><i class=\"fab fa-twitter\"></i></a>\n");
      out.write("            <a href=\"#\"><i class=\"fab fa-instagram\"></i></a>\n");
      out.write("            <a href=\"admin_login.jsp\"><i class=\"fas fa-user-shield\"></i></a> <!-- Admin Icon -->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"footer-content\">\n");
      out.write("        <h3>Our Store</h3>\n");
      out.write("        <a href=\"htm.jsp\">Home</a><br>\n");
      out.write("        <a href=\"#about\">About</a><br>\n");
      out.write("        <a href=\"tblDisplay.jsp\">Book Table</a><br>\n");
      out.write("        <a href=\"cardDis.jsp\">Takeaway</a>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"footer-content\">\n");
      out.write("        <h3>Get In Touch</h3>\n");
      out.write("        <p><i class=\"fas fa-map-marker-alt\"></i> 2443 Oak Ridge Omaha, GA 45056</p>\n");
      out.write("        <p><i class=\"fas fa-phone\"></i> 207-8767-452</p>\n");
      out.write("        <p><i class=\"fas fa-envelope\"></i> cafefriends@site.com</p>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.*;

public final class bkcode_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Common_Bootsrap/bootstrap.jsp");
  }

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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");
      out.write("\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css\">\n");
      out.write("\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>");
      out.write("\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         ");
   String ustr="";
             int uid=0;
             session=request.getSession(false);
                if(session==null || session.getAttribute("uname")==null  || session.getAttribute("uid")==null)
                {     
                   
                    response.sendRedirect("uhome.jsp");
                }
                else
                {
                    ustr=(String)session.getAttribute("uid");
                   uid=Integer.parseInt(ustr);
              int tid=Integer.parseInt(request.getParameter("tid"));
           
              String fn=request.getParameter("fname");
              String ln=request.getParameter("lname");
          String numPersonsStr = request.getParameter("num_persons");
int ps = (numPersonsStr != null && !numPersonsStr.isEmpty()) ? Integer.parseInt(numPersonsStr) : 1;

String priceStr = request.getParameter("price");
double pr = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0.0;
         
             String date=request.getParameter("date");
             String st=request.getParameter("stime");
             String et=request.getParameter("etime");
             session=request.getSession(false);
               
               try
               {
               Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String user="root";
                   String pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                  java.sql.Date sqlDate = new java.sql.Date(dateFormat.parse(date).getTime());
                   java.sql.Time sqlsTime = java.sql.Time.valueOf(st + ":00");
                    java.sql.Time sqleTime = java.sql.Time.valueOf(et + ":00");
                  String checkSQL = "SELECT COUNT(*) FROM b_cart WHERE tid = ? AND bk_date = ? " +
                  "AND ( " +
                  "      (? BETWEEN stime AND etime) OR " + // New stime is inside an existing booking
                  "      (? BETWEEN stime AND etime) OR " + // New etime is inside an existing booking
                  "      (stime BETWEEN ? AND ?) OR " + // Existing stime is inside the new booking
                  "      (etime BETWEEN ? AND ?) OR " + // Existing etime is inside the new booking
                  "      (stime = ? AND etime = ?) " + // Exact match case
                  ")";;
            PreparedStatement psCheck = con.prepareStatement(checkSQL);
            psCheck.setInt(1, tid);
            psCheck.setDate(2, sqlDate);
            psCheck.setTime(3, sqlsTime);
            psCheck.setTime(4, sqleTime);
            psCheck.setTime(5, sqlsTime);
            psCheck.setTime(6, sqleTime);

            ResultSet rsCheck = psCheck.executeQuery();
            if (rsCheck.next() && rsCheck.getInt(1) > 0) {
                // If the table is already booked for the same date and time, redirect to bookdemo.jsp
                out.print("Already booked");
                response.sendRedirect("bookdemo.jsp?f=invalid&tid="+tid+"&price="+pr);
            }
            else {
                // Insert into tbl_cart if no conflict
                     String sql="INSERT INTO b_cart(tid, uid, bk_date, stime, etime, persons, t_price) VALUES(?,?,?,?,?,?,?)";
                   PreparedStatement pst=con.prepareStatement(sql);
                   pst.setInt(1,tid);
                   pst.setInt(2,uid);
                   pst.setDate(3,sqlDate);
                   pst.setTime(4,sqlsTime);
                   pst.setTime(5,sqleTime);
                   pst.setInt(6, ps);
          
                   pst.setDouble(7, pr);
                 
                   int cnt=pst.executeUpdate();
                   if(cnt>0)
                   {
                       response.sendRedirect("cartdisplay.jsp?fn="+fn+"&ln="+ln);
                   }
                   else
                   {
                       response.sendRedirect("tbldisplay.jsp");
                   }
            }
               }
               catch(Exception e)
                       {
                           out.print(e);
                            e.printStackTrace();
                       }
                }
               //if(uname!=null && password.length()==8)
               //{
                 // response.sendRedirect("home.jsp");
                //}
               //else
               //{
                 //  out.print("Invalid user name or password");
              // }
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

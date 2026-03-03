<%-- 
    Document   : bkcode
    Created on : 16 Mar, 2025, 3:43:51 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        
    </head>
    <body>
         <%   String ustr="";
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
           double pr=Double.parseDouble(request.getParameter("price"));
              String fn=request.getParameter("fname");
              String ln=request.getParameter("lname");
             
             String numPersonsStr = request.getParameter("num_persons");
             int ps= Integer.parseInt(numPersonsStr);
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
                   String checkSQL = "SELECT COUNT(*) FROM booking_items WHERE tid = ? AND bk_date = ? " +
                  "AND ( " +
                  "      (? BETWEEN stime AND etime) OR " + // New stime is inside an existing booking
                  "      (? BETWEEN stime AND etime) OR " + // New etime is inside an existing booking
                  "      (stime BETWEEN ? AND ?) OR " + // Existing stime is inside the new booking
                  "      (etime BETWEEN ? AND ?) OR " + // Existing etime is inside the new booking
                  "      (stime = ? AND etime = ?) " + // Exact match case
                  ")";
            PreparedStatement psCheck = con.prepareStatement(checkSQL);
            psCheck.setInt(1, tid);
            psCheck.setDate(2, sqlDate);
            psCheck.setTime(3, sqlsTime);
            psCheck.setTime(4, sqleTime);
            psCheck.setTime(5, sqlsTime);
            psCheck.setTime(6, sqleTime);
            psCheck.setTime(7, sqlsTime);
            psCheck.setTime(8, sqleTime);
            psCheck.setTime(9, sqlsTime);
            psCheck.setTime(10, sqleTime);
            ResultSet rsCheck = psCheck.executeQuery();
            if (rsCheck.next() && rsCheck.getInt(1) > 0) {
                // If the table is already booked for the same date and time, redirect to bookdemo.jsp
                out.print("Already booked");
                response.sendRedirect("bookdemo.jsp?f=invalid&tid="+tid+"&price="+pr);
            }
            else {
//                
//                out.println("SQL Query: INSERT INTO b_cart(tid, uid, bk_date, stime, etime, persons, t_price) VALUES(" 
//    + tid + ", " + uid + ", " + sqlDate + ", " + sqlsTime + ", " + sqleTime + ", " + ps + ", " + pr + ")");

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
        %>
        
    </body>
</html>


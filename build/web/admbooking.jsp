<%-- 
    Document   : admbooking
    Created on : 16 Mar, 2025, 2:42:59 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <style>
            .table{
                margin-top: 100px;
            } 

        </style>
    </head>
    <body style="background-color: #000000;">  
        <%@include  file="admsidebar.jsp" %>
        
        <script>
             function Upd(a)
            {

              
                    window.location.href = 'status.jsp?bookid=' + a;
                
            }
        </script>
        <%

            session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("admin_login.jsp");
            } else {
                String adm = (String) session.getAttribute("email");
            }
             double grandTotal = 0.0;
            ResultSet rs = null;
            Connection con = null;
            PreparedStatement pst = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                //out.println(" Connection Successfull");
              
                pst = con.prepareStatement(" SELECT b.bill_id, b.bid, b.uid, b.total_amount, b.payment_status,u.uname, i.tid, i.stime, i.etime, i.bk_date FROM booking_bill b JOIN booking_items i ON b.bid = i.bid JOIN user u ON b.uid = u.uid");
                rs = pst.executeQuery();
                PreparedStatement ps = con.prepareStatement("select *from  booking_bill where payment_status='paid'");
               ResultSet rst = ps.executeQuery();

        %>
        <div class="container mt-3"> <center> 
                <h2 style="color: white; margin-top: 70px;">🍽 Booking details</h2></center>
            <table class="table table-dark table-hover table-striped">
                <thead>
                    <tr>
                        <th>Booking Id</th>
                        <th>User Id</th>
                        <th>User Name</th>
                        <th>Table No.</th>
                        <th>Booking Date</th>
                        <th>Time</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                    </tr> </thead><tbody>
                    <%        while (rs.next()) {

                    %>



                    <tr>
                        <td><%= rs.getInt("bid")%></td>
                        <td><%= rs.getInt("uid")%></td>
                        <td><%= rs.getString("uname")%></td>
                        <td><%= rs.getInt("tid")%></td>
                        <td><%= rs.getDate("bk_date")%></td>
                        <td><%= rs.getTime("stime")%>-<%= rs.getTime("etime")%></td>
                        <td>Rs.<%= rs.getDouble("total_amount")%></td>
                        <td><button type="button" class="btn btn-light" 
        style="background-color: <%= rs.getString("payment_status").equals("Pending") ? "#FF4C4C" : "#4CAF50" %>; 
               color: white;" 
        onclick="Upd(<%= rs.getInt("bid")%>)">
        <%= rs.getString("payment_status")%>
    </button></td></tr>
                     
                    
                    
                    <%
                        
                        
                        
                         while(rst.next())
                                 {
                        
                            grandTotal += rs.getDouble("total_amount");}
                        }
                    %>
                    <tr style="background-color: #444; font-weight: bold;">
                        <td colspan="4" style="text-align: right; color: white; padding: 10px;">
                            Grand Total:
                        </td>
                        <td colspan="5" style="color: #FFD700; padding: 10px;">
                            Rs. <%= String.format("%.2f", grandTotal)%>
                        </td>
                    </tr>
             
                   
                </tbody>  </table></div>
                <%
                    } catch (Exception e) {
                        out.print(e);
                    }


                %>
    </body>
</html>

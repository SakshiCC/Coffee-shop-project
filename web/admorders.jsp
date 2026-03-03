<%-- 
    Document   : admorders
    Created on : 16 Mar, 2025, 2:39:42 PM
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
        <jsp:include page="admsidebar.jsp"></jsp:include>
            <script>
                function Upd(a)
                {


                    window.location.href = 'orstatus.jsp?oid=' + a;

                }
            </script>

        <%

            session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("admin_login.jsp");
            } else {
                String adm = (String) session.getAttribute("email");
            }
            ResultSet rs = null;
            Connection con = null;
            PreparedStatement pst = null;
            double grandTotal = 0.0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");

                pst = con.prepareStatement("SELECT o.uid, o.oid, o.pid, o.tkdate, o.tktime, o.quantity, p.p_price, (o.quantity * p.p_price) AS total, orders.pay_status, u.uname FROM order_items o  JOIN product p ON o.pid = p.pid JOIN user u ON o.uid = u.uid JOIN orders ON o.oid = orders.oid");
                rs = pst.executeQuery();
                PreparedStatement ps = con.prepareStatement("select *from  orders where pay_status='paid'");
                ResultSet rst = ps.executeQuery();

        %>
        <div class="container mt-3" style="margin-top: 50px ;"> <center> 
                <h2 style="color: white; margin-top: 60px;">🍱 Takeaway Details</h2>
                <table class="table table-dark table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th>User Id</th>
                            <th>User Name</th>
                            <th>Product Id</th>
                            <th>Quantity</th>
                            <th>Takeaway Date</th>
                            <th>Takeaway Time</th>
                            <th>Total</th>
                            <th> Status </th>

                        </tr> </thead><tbody>
                        <%        while (rs.next()) {

                        %>

                        <tr>
                            <td><%= rs.getInt("oid")%></td>
                            <td><%= rs.getInt("uid")%></td>
                            <td><%= rs.getString("uname")%></td>
                            <td><%= rs.getInt("pid")%></td>
                            <td><%= rs.getInt("quantity")%></td>
                            <td><%= rs.getDate("tkdate")%></td>
                            <td><%= rs.getTime("tktime")%></td>
                            <td><%= rs.getDouble("total")%></td>
                            <td><button type="button" class="btn btn-light" style="background-color: <%= rs.getString("pay_status").equals("Pending") ? "#FF4C4C" : "#4CAF50"%>; color: white;" onclick="Upd(<%= rs.getInt("oid")%>)">
                                    <%= rs.getString("pay_status")%>
                                </button></td></tr>

                        <%
                                while (rst.next()) {
                                    grandTotal += rs.getDouble("total");
                                }
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

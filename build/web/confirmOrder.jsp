<%-- 
    Document   : confirmOrder
    Created on : 16 Mar, 2025, 4:22:01 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Order Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <style>

            body{

                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url('image/Cof1.jpeg') no-repeat;
                background-size: 100% 100%;

                background-position: center;

            }


        </style>
    </head>
    <body>
         <%@include  file="uhome2.jsp" %>
        <%
            String n = (String) session.getAttribute("uname");
            String cid = (String) session.getAttribute("uid");

            if (cid == null) {
                response.sendRedirect("none.jsp");
            } else {
                String tot = request.getParameter("total");
                Double total = Double.parseDouble(tot);
                //out.print(total);
                int uid = Integer.parseInt(cid);

                String pidData = request.getParameter("pidData");
                String quantities = request.getParameter("quantities");

                try {
                    if (total != null && pidData != null && quantities != null) {
                        String[] pids = pidData.split("-");
                        String[] qty = quantities.split(",");

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");

                        for (int i = 0; i < pids.length; i++) {
                            int pid = Integer.parseInt(pids[i]);
                            int quantity = Integer.parseInt(qty[i]);

                            out.println("PID: " + pid + " Qty: " + quantity + "<br>");

                            // Update quantity into cart table
                            PreparedStatement ps = con.prepareStatement("UPDATE o_cart SET quantity=? WHERE pid=? AND uid=?");
                            ps.setInt(1, quantity);
                            ps.setInt(2, pid);
                            ps.setInt(3, uid);
                            int rows = ps.executeUpdate();

                            if (rows > 0) {
                                //  out.println(" Product " + pid + " Updated<br>");
                            }
                        }
                    }
                } catch (Exception e) {
                    out.print(e);
                }
        %>     








        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                //out.println(" Connection Successfull");
                PreparedStatement p = con.prepareStatement("SELECT  p.pname, c.ocart_id,c.pid,c.quantity FROM o_cart c INNER JOIN product p ON c.pid = p.pid WHERE c.uid = ?");
                p.setInt(1, uid);
                ResultSet rs = p.executeQuery();
        %>

        <div class="container mt-4" >


            <form action="insOrderitems.jsp" class="needs-validation" method="post">
                <div style=" width: 50%; padding: 5px 35px 10px 35px; margin:100px 250px 100px 50px ;background: #000000 ;backdrop-filter: blur(20px); border: 2px solid rgba(255,255,255,.5); border-radius: 20px;text-align: center;">
                    <div class="container">
                        <h1 class="text-center text-light">TakeAway Order</h1>
                    </div>
                    <div class="row">
                        <div class="mb-3 mt-3 col">
                            <label for="uname" class="form-label text-light">First Name:</label>
                            <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
                        </div>

                        <div class="mb-3 mt-3 col">
                            <label for="uname" class="form-label text-light">Last Name:</label>
                            <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>

                        </div>


                        <div class="row">

                            <div class="container mt-3 col-xs-2" style="text-align:center;">
                                <label for="dropdownTextField" class="form-label text-light">Products Name</label>
                                <select id="dropdownTextField" class="form-select " aria-label="Products Name" >
                                    <option  disabled selected> Your Ordered Items</option>


                                    <%
                                        while (rs.next()) {
                                    %>

                                    <option disabled><%=rs.getString("pname")%> - <%=rs.getInt("quantity")%></option>

                                    <%
                                            }

                                        } catch (Exception e) {
                                            out.print(e);
                                        }

                                    %>

                                </select>
                            </div>




                            <div class="mb-3 mt-3 col">
                                <label for="price" class="form-label text-light"> Total Price</label>
                                <input type="text" class="form-control" id="price" name="ptotal"  value="Rs.<%=total%>" required readonly>
                                <input type="hidden" name="ttl" value="<%=total%>"/>
                            </div>




                        </div>


                        <div class="row">
                            <div class="mb-3 mt-3 col">
                                <label for="date" class="form-label text-light">Date</label>
                                <input type="date" class="form-control" id="date" name="date" required>

                            </div>
                            <div class="mb-3 mt-3 col">
                                <label for="timepicker" class="form-label text-light">Time For TakeAway:</label>
                                <input type="time" id="timepicker" class="form-control" min="09:00" max="22:00" name="time" required>
                                <div id="timeError" class="text-danger mt-2" style="display:none;">Please select a time between 9 to
                                    22(9AM-10PM).</div>

                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-outline-danger btn-lg w-50 center-center mt-3">Submit</button>
                </div>
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('#timepicker').on('input', function () {
                    var time = $(this).val();
                    var hour = parseInt(time.split(':')[0]);

                    // Check if the selected time is between 9 AM and 10 PM
                    if (hour < 9 || hour >= 22) {
                        $('#timeError').show();
                    } else {
                        $('#timeError').hide();
                    }
                });
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Get the current date in YYYY-MM-DD format
                const today = new Date().toISOString().split('T')[0];
                $('#date').attr('min', today).attr('max', today);

                // Set the "min" attribute to today's date
                document.getElementById('date').setAttribute('min', today);
            });

        </script>










        <%}%>    













    </body>
</html>

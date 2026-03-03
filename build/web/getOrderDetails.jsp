<%-- 
    Document   : getOrderDetails
    Created on : 16 Mar, 2025, 4:36:55 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*, java.time.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Takeaway Bill</title>
        <style>
            body { font-family: 'Poppins', sans-serif; text-align: center; margin: 20px; background: #f5f5f5; }
            .bill-box { width: 800px; background: white; padding: 20px; margin: auto; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); border-radius: 10px; }
            h2 { color: #ff5733; letter-spacing: 2px; text-transform: uppercase; }
            table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
            table, th, td { border: 1px solid black; padding: 10px; text-align: center; }
            th { background: #ff5733; color: white; }
            td { background: #ffe5d9; }
            #total { font-weight: bold; font-size: 20px; color: #ff5733; }
            .footer { margin-top: 20px; color: green; font-size: 18px; font-weight: bold; }
            .btn { padding: 10px; background: #ff5733; color: white; border: none; cursor: pointer; }
        </style>
    </head>
    <body onload="generatePDF()">

        <div class="bill-box">
            <h2>🍕 Takeaway Food Bill</h2>

            <%
                String n = (String) session.getAttribute("uname");
                String cid = (String) session.getAttribute("uid");
                
                String date = LocalDate.now().toString();
                String time = LocalTime.now().toString().substring(0, 5);
                String tktime = request.getParameter("tktime");
                String paymode = "Cash";  // You can pass payment mode in URL like cash or online
                if (cid == null) {
                     session.setAttribute("errorMessage", "Please Loigin First!");
                response.sendRedirect("uhome.jsp");
                } else {
                      int uid=Integer.parseInt(cid);
            %>

            <h3>Customer Name: <%=n%></h3>
            <h3>Date: <%= date%> | Time: <%= time%></h3>
            <h3>Takeaway Time: <%= tktime%></h3>
            <h3>Payment Mode: <%= paymode%></h3>

            <table>
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int oid = Integer.parseInt(request.getParameter("oid"));
                        double grandTotal = 0;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                            PreparedStatement ps = con.prepareStatement("SELECT p.pname, oi.quantity, p.p_price, (oi.quantity * p.p_price) AS total FROM order_items oi JOIN product p ON oi.pid = p.pid WHERE oi.oid = ?");
                            ps.setInt(1, oid);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                                String pname = rs.getString("pname");
                                int qty = rs.getInt("quantity");
                                double price = rs.getDouble("p_price");
                                double total = rs.getDouble("total");
                                grandTotal += total;
                    %>
                    <tr>
                        <td><%= pname%></td>
                        <td><%= qty%></td>
                        <td>₹<%= price%></td>
                        <td>₹<%= total%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

            <h3 id="total">Grand Total: ₹<%= grandTotal%></h3>

            <div class="footer">💖 Thank You for Booking Takeaway! Visit Again ❤️</div>
            <button class="btn" onclick="generatePDF()">Download PDF</button>
        </div>

        <script>
            function generatePDF() {
                window.print();
                   setTimeout(function () {
            let confirmDownload = confirm("Did you download the PDF successfully?");
            if (confirmDownload) {
                window.location.href = "uhome.jsp"; // Redirect only if user confirms
            }
        }, 1000); // 
            }
        </script>

        <%
                   //  Clear Cart After Order Confirmation
                    PreparedStatement clearCart = con.prepareStatement("DELETE FROM o_cart WHERE uid = ?");
                    clearCart.setInt(1,uid );
                     clearCart.executeUpdate();
                } catch (Exception e) {
                    out.print(e);
                
                }
            }
        %>

    </body>
</html>

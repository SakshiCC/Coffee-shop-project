<%-- 
    Document   : insOrderitems
    Created on : 16 Mar, 2025, 4:31:04 PM
    Author     : SAKSHI
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Takeaway Bill</title>

    </head>
    <body>

        <%String n = (String) session.getAttribute("uname");
            String cid = (String) session.getAttribute("uid");

            if (cid == null) {
                response.sendRedirect("uhome.jsp");
            } else {

                int uid = Integer.parseInt(cid);
                try {
                    Double total = Double.parseDouble(request.getParameter("ttl"));
                    String odate = java.time.LocalDate.now().toString();
                    String otime = java.time.LocalTime.now().toString().substring(0, 8);

                    String dateStr = request.getParameter("date");
                    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date dateUtil = inputFormat.parse(dateStr);
                    java.sql.Date sqlDate = new java.sql.Date(dateUtil.getTime());

                    String timeStr = request.getParameter("time");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                    Date timeUtil = timeFormat.parse(timeStr);
                    java.sql.Time sqlTime = new java.sql.Time(timeUtil.getTime());

                    int oid = 0;

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                    // Insert into `order` table to generate Order ID
                    PreparedStatement ps1 = con.prepareStatement("INSERT INTO orders (uid, odate, otime, total ,pay_status) VALUES (?, ?, ?,?,?)", Statement.RETURN_GENERATED_KEYS);
                    ps1.setInt(1, uid);
                    ps1.setString(2, odate);
                    ps1.setString(3, otime);
                    ps1.setDouble(4, 00.00);
                    ps1.setString(5, "Pending");

                    ps1.executeUpdate();
                    ResultSet rs = ps1.getGeneratedKeys();

                    if (rs.next()) {
                        oid = rs.getInt(1); // Get Generated Order ID
                    } else {
                        out.println("Failed to create order!");

                        return;

                    }

                    // Insert into `orderitem` table with Quantity from `cart`
                    PreparedStatement ps2 = con.prepareStatement("INSERT INTO order_items (uid, pid, tkdate, tktime, quantity, oid) SELECT uid, pid, ?, ?,quantity , ? FROM o_cart WHERE uid=?");
                    ps2.setDate(1, sqlDate);
                    ps2.setTime(2, sqlTime);

                    ps2.setInt(3, oid);
                    ps2.setInt(4, uid);
                    ps2.executeUpdate();
                    // Insert into order table with updated total value
                    PreparedStatement ps = con.prepareStatement("UPDATE orders SET total = ? WHERE oid = ?");
                    ps.setDouble(1, total);
                    ps.setInt(2, oid);
                    ps.executeUpdate();

                    out.println("<script>alert('Order Confirmed Successfully'); window.location='getOrderDetails.jsp?oid=" + oid + "&tktime=" + timeStr + "';</script>");

//                   response.sendRedirect("htm.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                }
            }
        %>


    </body>
</html>

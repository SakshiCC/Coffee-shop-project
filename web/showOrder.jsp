<%-- 
    Document   : showOrder
    Created on : 16 Mar, 2025, 4:40:58 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <title>JSP Page</title>
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
                session.setAttribute("errorMessage", "Please Loigin First!");
                response.sendRedirect("uhome.jsp");
            } else {

                int uid = Integer.parseInt(cid);

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                    //out.println(" Connection Successfull");
                    PreparedStatement p = con.prepareStatement("SELECT p.pimg, p.p_price, p.pname, c.oid,c.pid,c.quantity,c.tkdate FROM order_items c INNER JOIN product p ON c.pid = p.pid WHERE c.uid = ?");
                    p.setInt(1, uid);
                    ResultSet rs = p.executeQuery();
 if (!rs.isBeforeFirst()) { // Check if cart is empty
        %>
       <div class="container text-center" style="margin-top: 100px;">
    <div class="card" style="width: 400px; margin: auto; padding: 25px; 
                background: rgba(255, 255, 255, 0.95); 
                border-radius: 12px; 
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">
        <i class="bi bi-clock-history" style="font-size: 60px; color: #8B4513;"></i>  
        <h4 style="color: #5C4033; font-weight: bold; margin-top: 10px;">No History Available!</h4>
        <p style="color: #6D4C41;">You Have not ordered any TakeAway Yet</p>
        <a href="uhome.jsp" class="btn" style="background: linear-gradient(45deg, #8B4513, #A0522D); 
                color: white; font-weight: bold; 
                padding: 10px 20px; border-radius: 8px; 
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); 
                box-shadow: 0 4px 8px rgba(139, 69, 19, 0.3);">
            Go Back
        </a>
    </div>
</div>
        <%
        } else {
        %>

        <div class="container mt-1" style=" align-items: center; "> 
            <h2 style="color:  #FFFFFF; align-content: center; margin-top: 150px;">Your Previous Take Away Products &#128522;</h2>
            <table class="table table-dark table-hover table-striped" >
                <thead>
                    <tr>
                        <th>Sr.No.</th>
                        <th> Product</th>
                        <th> Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                         <th>Date</th>

                        
                    </tr>
                </thead><%                    int i = 1;
                    while (rs.next()) {
                %>




                <tbody>
                    <tr>
                        <td><%=i++%>  </td>
                        <td><img style="margin: 15px; height:100px; width: 100px;" src="cofimg/<%=rs.getString("pimg")%>" class="img-fluid rounded" alt="product image" width="150" height="125"></td>
                        <td><span class="pname"><%= rs.getString("pname")%></span></td>
                        <td><%=rs.getInt("quantity")%></td>
                        <td>Rs.<%= rs.getDouble("p_price")%></td>
                        <td><%= rs.getDate("tkdate")%></td>


                      
                    </tr>
                </tbody>


                <%
                    }

                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                %>

               


            </table></div>
            <% }%>
    </body>
</html>

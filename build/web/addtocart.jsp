<%-- 
    Document   : addtocart
    Created on : 16 Mar, 2025, 4:15:39 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Add to cart Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <%@include file="Common_Bootsrap/bootstrap.jsp" %>
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
        <script type="text/javascript">

            function Del(a)
            {

                var x = confirm("Are you sure?");
                if (x)
                {

                    window.location.href = 'deleteCart.jsp?cartid=' + a;
                }
            }
            function Order() {
                var x = confirm("Are you sure to Place the Order?");
                if (x) {
                    let result = document.getElementById("result").innerText; // Total Price
                    let quantities = document.querySelectorAll('.pquant'); // Quantity Inputs
                    let pids = document.querySelectorAll('.pid'); // Hidden Product IDs

                    let quantityData = "";
                    let pidData = "";

                    // Loop to get all PIDs & Quantities
                    for (let i = 0; i < quantities.length; i++) {
                        if (quantities[i].value != "") { // Only take non-empty quantities
                            pidData += pids[i].value + "-"; // PID
                            quantityData += quantities[i].value + ",";
                        }
                    }

                    // Removing last comma and dash
                    pidData = pidData.slice(0, -1);
                    quantityData = quantityData.slice(0, -1);

                    if (pidData != "" && quantityData != "") {
                        window.location.href = "confirmOrder.jsp?total=" + result + "&pidData=" + pidData + "&quantities=" + quantityData;
                    } else {
                        alert("Your Cart is Empty 🛒");
                    }
                }
            }





        </script>


        <%            String n = (String) session.getAttribute("uname");
            String cid = (String) session.getAttribute("uid");
        
            if (cid == null) {
                
                 request.setAttribute("errorMessage","Pleaase Login First!!");
             request.getRequestDispatcher("uhome.jsp").include(request, response);
                         
                       }
             else {

                int uid = Integer.parseInt(cid);

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                    //out.println(" Connection Successfull");
                    PreparedStatement p = con.prepareStatement("SELECT p.pimg, p.p_price, p.pname, c.ocart_id,c.pid FROM o_cart c INNER JOIN product p ON c.pid = p.pid WHERE c.uid = ?");
                    p.setInt(1, uid);
                    ResultSet rs = p.executeQuery();

                    if (!rs.isBeforeFirst()) { // Check if cart is empty
        %>
      <div class="container text-center" style="margin-top: 100px;">
    <div class="card" style="width: 400px; margin: auto; padding: 25px; 
                background: rgba(255, 255, 255, 0.95); 
                border-radius: 12px; 
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">
        <i class="bi bi-cart-x" style="font-size: 60px; color: #8B4513;"></i>  
        <h4 style="color: #5C4033; font-weight: bold; margin-top: 10px;">Your Cart is Empty!</h4>
        <p style="color: #6D4C41;">Add items to your cart to proceed with Takeaway.</p>
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
            <table class="table table-dark table-hover table-striped" >
                <thead>
                    <tr>
                        <th>Sr.No.</th>
                        <th> Product</th>
                        <th> Name</th>
                        <th>Quantity</th>
                        <th>Price</th>

                        <th>Delete</th>
                    </tr>
                </thead><%                    int i = 1;
                    while (rs.next()) {
                %>




                <tbody>
                    <tr>
                        <td><%=i++%>  </td>
                        <td><img style="margin: 15px; height:100px; width: 100px;" src="cofimg/<%=rs.getString("pimg")%>" class="img-fluid rounded" alt="product image" width="150" height="125"></td>
                        <td><span class="pname"><%= rs.getString("pname")%></span></td>
                        <td><form method="post"> <div class="col-xs-2">
                                    <input class="pquant form-control" type="number" name="qnty" min="1" max="20" value="1" required oninput="calculateTotal()">
                                    <input type="hidden" class="pid" name="pid" value="<%= rs.getInt("pid")%>">

                                </div></form>
                        </td>
                        <td class="pri">Rs.<%= rs.getDouble("p_price")%></td>


                        <td> <button type="button" class="btn btn-light" onclick="Del(<%=rs.getInt("ocart_id")%>)">Delete</button></td> 
                    </tr>
                </tbody>


                <%
                            }
                        
                %>

                <tr >
                    <td colspan="2" style=" text-align: center;" ><p> Total :  Rs.</p></td>
                    <td colspan="3">
                        <p id="result" style="color: #fff; ">0.00</p>
                    </td>
                    <td>
                        <button type="button" class="btn btn-light" onclick="Order()">Confirm Takeaway</button></td> 
             

                </tr>



            </table></div>
            <% }
                    } catch (Exception e) {
                        out.print(e);
                    }
}%>

        <script>

            function calculateTotal() {
                let quantities = document.querySelectorAll('.pquant'); // Select all quantity inputs
                let prices = document.querySelectorAll('.pri'); // Select all price spans
                let result = document.getElementById("result"); // Total amount display
                let grandTotal = 0;

                for (let i = 0; i < quantities.length; i++) {
                    let qty = parseInt(quantities[i].value); // Get quantity
                    let price = parseFloat(prices[i].innerText.replace("Rs.", "").trim()); // Get price without Rs.

                    if (!isNaN(qty) && !isNaN(price)) {
                        grandTotal += qty * price; // Calculate subtotal
                    }
                }

                result.innerHTML = grandTotal.toFixed(2); // Display Grand Total

                if (grandTotal == 0) {
                    Swal.fire({
                        icon: 'info',
                        title: 'Oops...',
                        text: 'Your Cart is Empty!',
                        confirmButtonColor: '#FFA500',
                        background: 'rgba(0, 0, 0, 0.8)', // Transparent Background
                        color: '#FFA500' // Text color
                    }, "info");
                }
            }

// Call calculateTotal on Page Load
            window.onload = calculateTotal;

// Automatically calculate on Quantity Change without Button
            document.querySelectorAll('.pquant').forEach(item => {
                item.addEventListener("input", calculateTotal);
            });


        </script>


    </body>
</html>

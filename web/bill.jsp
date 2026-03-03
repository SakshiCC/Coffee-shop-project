<%-- 
    Document   : bill
    Created on : 16 Mar, 2025, 4:07:48 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <style>
        /* Custom styling for the bill */
        .bill-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }.bill-header {
            margin-bottom: 30px;
            text-align: center;
        }

        .bill-header h2 {
            font-size: 36px;
            color: #007bff;
        }

        .bill-header p {
            font-size: 18px;
        }

        .bill-footer {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
        }
         .bill-footer .total {
            font-weight: bold;
            font-size: 20px;
        }

        .table th,
        .table td {
            text-align: center;
        }
        .table th,
        .table td  { border: 1px solid black; padding: 10px; text-align: center; }
            th { background: #ff5733; color: white; }
            td { background: #ffe5d9; }

        .btn {
            font-size: 16px;
        }

        @media (max-width: 576px) {
            .bill-container {
                margin: 20px;
                padding: 15px;
            }
        }
        
    </style>

    
    
    <script>
           function Gpdf()
           {
               window.print();
               setTimeout(()=>{
                     let confirmDownload = confirm("Did you download the PDF successfully?");
            if (confirmDownload) {
                window.location.href = "uhome.jsp"; // Redirect only if user confirms
            }
                   
                  
               },1000);
             
           }
        
        </script>
    </head>
    <body>
        <%
            String fn=request.getParameter("fn");
            String ln=request.getParameter("ln");
            int bkid=Integer.parseInt(request.getParameter("bid"));
            ResultSet rs,rs1;
            Connection con=null;
            PreparedStatement pst=null;
            try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String  user="root";
                   String  pass="sweet15";
                   con=DriverManager.getConnection(url,user,pass);
                   int bid=0;
                   java.sql.Date dt=null;
                   Double total=0.0;
                   pst=con.prepareStatement("select bill_id,bill_date,total_amount from booking_bill where bid="+bkid);
                   rs=pst.executeQuery();
                   while(rs.next())
                   {
                       bid=rs.getInt(1);
                       dt=rs.getDate(2);
                       total=rs.getDouble(3);
                   }
                   
                   %>
                    <div class="bill-container">
        <!-- Bill Header -->
        <div class="bill-header">
            <h2 style="color: #ff5733; letter-spacing: 2px; text-transform: uppercase;"> 🧾 Invoice</h2>
            <p><strong>Bill Number:</strong> <%=bid%></p>
            <p><strong>Date:</strong> <%=dt%></p>
            <p><strong>Customer Name:</strong><%=fn%> <%=ln%></p>
            <h3>Booking Details</h3>
        </div>
            <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Table Id</th>
                        <th scope="col">Price</th>
                        <th scope="col">Date of Booking</th>
                        <th scope="col">Start Time</th>
                        <th scope="col">End Time</th>
                    </tr></thead>
                    <tbody>
                  <%
                     
                 PreparedStatement  pst1=con.prepareStatement("SELECT tid, t_price, bk_date, stime, etime FROM booking_items WHERE bid=" + bkid);
                   rs1=pst1.executeQuery();
                   
if (!rs1.isBeforeFirst()) { 
    out.println("<p>No booking data found!</p>"); // Debugging line
}
                  if (rs1.next()) {
    do {
%>
    <tr>
        <td><%=rs1.getInt(1)%></td>
        <td><%=rs1.getDouble(2)%></td>
        <td><%=rs1.getDate(3)%></td>
        <td><%=rs1.getTime(4)%></td>
        <td><%=rs1.getTime(5)%></td>
    </tr>
<%
    } while (rs1.next());
} else {
    out.println("<p>No booking details available.</p>");
}
                   %>
                    </tbody>
            </table>
        </div>
         <!-- Bill Footer with Total -->
        <div class="bill-footer">
            <p class="total">Total Amount: <%=total%></p>
             <p class="total">Payment mode : Cash on Service Delivery </p>
             <h3 style="color: #007bff;">Thank you for Booking ❤️!!</h3>
        </div>

        <!-- Print and Download Buttons -->
        <div class="text-center mt-4">
            
            <button class="btn btn-primary" onclick="Gpdf()">Download Bill</button>
            
        </div>
    </div>
            <%
           }
            catch (Exception e) {
        
        out.println(e.getMessage());
      }
        
        
     finally {
        // Close resources
        try {
            
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
            
            
            
            %>
    </body>
</html>

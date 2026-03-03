<%-- 
    Document   : cartdisplay
    Created on : 16 Mar, 2025, 3:50:42 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cart display Page</title>
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

        <script>
           function bill(a,b,t)
            {
                var res=window.confirm("are you sure to Confirm the booking and generate bill ?");
                   
                  if(res)
                  {
                      window.location.href = "bookcnf.jsp?fn="+encodeURIComponent(a)+"&ln="+encodeURIComponent(b)+"&tot="+encodeURIComponent(t);
                  }
            }
            function del(cartid)
             {    
                  var res=window.confirm("are you sure to delete the item ?");
                   
                  if(res)
                  {
                      window.location.href = "del_cart.jsp?cartid="+cartid;
                  }
             }
             function display()
             {
                 var na=document.getElementById("notavl");
                 var av=document.getElementById("avl");
                na.style.display="center";
                av.style.display="none";
             }
            </script>
    </head>
    <body>
         <%@include  file="uhome2.jsp" %>
        <%  
            
            
            
            int uid=0;
            String ustr="";
             session=request.getSession(false);
                if(session==null || session.getAttribute("uname")==null  || session.getAttribute("uid")==null)
                {     
                   response.sendRedirect("uhome.jsp");
                }
                else
                {
                    ustr=(String)session.getAttribute("uid");
                     uid=Integer.parseInt(ustr);
                    // out.println(uid);
            String fn=request.getParameter("fn");
            String ln=request.getParameter("ln");
        try
               {
               Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String user1="root";
                   String pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user1,pass);
                   PreparedStatement pst=con.prepareStatement("select * from b_cart where uid="+uid);
                       ResultSet r1=pst.executeQuery();
                        if (!r1.isBeforeFirst()) { // Check if cart is empty
                        %>
                       <div class="container text-center" style="margin-top: 100px;">
    <div class="card" style="width: 400px; margin: auto; padding: 25px; 
                background: rgba(255, 255, 255, 0.95); 
                border-radius: 12px; 
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">
        <i class="bi bi-cart-x" style="font-size: 60px; color: #8B4513;"></i>  
        <h4 style="color: #5C4033; font-weight: bold; margin-top: 10px;">Your Cart is Empty!</h4>
        <p style="color: #6D4C41;">Add items to your cart to proceed with booking.</p>
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
                             } 
                     else {
                       double total=0;
                      %>
                                              <center>
 <table class="table table-hover table-striped table-borderd table-dark" style="width: 800px; margin-top:100px;" id="avl">
                           <tr><td colspan="7"><h3>Booking cart</h3></td></tr>
                           
                           <th scope="col">Table Id</th>
                           <th scope="col">Table</th>
                           <th scope="col">Booking date</th>
                           <th scope="col">start Time</th>
                           <th scope="col">End Time</th>
                           <th scope="col">Price</th>
                           <th scope="col">Remove from cart</th>
                           
                           
                               <%
                                    while(r1.next())
                                    {
                                        %>
                                        
                                   <tr> 
                               <td><%=r1.getInt(2)%></td>
                               <%
                                  
                                    pst=con.prepareStatement("select timg from tables where tid="+r1.getInt(2));
                       ResultSet r2=pst.executeQuery();  
                                    
                                   while(r2.next())
                                   {
                                       %>
                                       <td><img src="tableimages/<%=r2.getString("timg")%>" style="height: 80px;width: 80px;"></td>
                                  <%
                                   }
                                    
                                   %>
                                       
                                       <td><%=r1.getDate(4)%></td>
                                       <td><%=r1.getTime(5)%></td>
                                       <td><%=r1.getTime(6)%></td>
                                       <td><%=r1.getDouble(8)%></td>
                                       <td><button class="btn btn-light" onclick="del(<%=r1.getInt(1)%>)">Delete</button></td>
                           </tr>
                           <%     total=total+r1.getDouble(8);
                           }
                     
                   %>
                   <tr>
                       <td>Total:</td>
                       <td colspan="5">Rs.<%=total%></td>
                       <td><button class="btn btn-light" style="background-color: orange;" onclick="bill('<%= fn %>','<%= ln %>','<%= total %>')">Confirm Booking</button></td></tr>
                       </table>
    </center>
                   <% 
                       //r1=null;
                  }    
               }
               catch(Exception e)
                       {
                           out.print(e);
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

            
    
<%-- 
    Document   : admhome
    Created on : 16 Mar, 2025, 1:02:33 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        
        <style>
            .content
            {
                padding-left: 60px;
                padding-right: 40px;
                display: flex;
            }
            
            .bodyblw.border{
                margin-top: 100px;
                background-color:  wheat;
                height: 250px;
                width: 250px;
                margin-left: 100px;
                margin-right: 100px;
                
            }
            
             .bodyblw p
             {
                 font-size: 20px;
                 color: black;
                 align-content: center;
                 font-weight: bold;
             }
             
            
             .content::hover{
                 background-color: #FFB22C;
             }
             
        </style>
        <%   
                session=request.getSession(false);
                if(session==null || session.getAttribute("email")==null)
                {
                    response.sendRedirect("admin_login.jsp");
                }
                else
                {
                    String adm=(String)session.getAttribute("email");
                }
                 String url,pass,user;
                 int ucount,pcount,bcount,ocount,pscount,tbcount;
                 ucount=pcount=bcount=ocount=pscount=tbcount=0;
        try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                    url="jdbc:mysql://localhost:3306/coffeeshop";
                    user="root";
                    pass="sweet15";
                   Connection con=DriverManager.getConnection(url,user,pass);
                   PreparedStatement pstu,pstp,psto,pstb,ps1,ps2;
                   ResultSet rstp,rstu,rsto,rstb,rs1,rs2;
                   String sqlu="select count(*)from user";
                   pstp=con.prepareStatement(sqlu);
                   rstp=pstp.executeQuery();
                   while(rstp.next())
                   {
                       ucount=rstp.getInt(1);
                   }
                   String sqlp="select count(*)from product";
                   pstu=con.prepareStatement(sqlp);
                   rstu=pstu.executeQuery();
                   while(rstu.next())
                   {
                       pcount=rstu.getInt(1);
                   }
                   String sqlb="select count(*)from bookings";
                   pstb=con.prepareStatement(sqlb);
                   rstb=pstb.executeQuery();
                   while(rstb.next())
                   {
                       bcount=rstb.getInt(1);
                   }
                   String sqlo="select count(*)from orders";
                   psto=con.prepareStatement(sqlo);
                   rsto=psto.executeQuery();
                   while(rsto.next())
                   {
                       ocount=rsto.getInt(1);
                   }
                   String sql1="select count(*)from order_items";
                   ps1=con.prepareStatement(sql1);
                   rs1=ps1.executeQuery();
                   while(rs1.next())
                   {
                       pscount=rs1.getInt(1);
                   }
                   String sql2="select count(*)from booking_items";
                   ps2=con.prepareStatement(sql2);
                   rs2=ps2.executeQuery();
                   while(rs2.next())
                   {
                       tbcount=rs2.getInt(1);
                   }
                   
               }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
    </head>
    <body style="background-color: #87431D;">
        <jsp:include page="admsidebar.jsp"></jsp:include>
        
        
        <div class="content">
        <div class="bodyblw border border-5 rounded-5 border-dark">
            <center>
            <i class="bi bi-person-fill-check" style="font-size: 80px; color: black;"></i>
            <br><p>Registered Users</p><p><%= ucount %></p>
            </center>
        </div>
        <div class="bodyblw border border-5 rounded-5 border-dark">
            <center>
            <i class="bi bi-cup-hot" style="font-size: 80px;"></i>
            <br><p>Products</p>
            <p><%= pcount %></p></center>
        </div>
        <div class="bodyblw border border-5 rounded-5 border-dark">
            <center>
            <i class="bi bi-calendar-check" style="font-size: 80px;"></i>
            <br><p>Bookings</p><p><%= bcount %></p></center>
        </div></div>
        <div class="content">
               <div class="bodyblw border border-5 rounded-5 border-dark">
                   <center>  
            <i class="bi bi-list-check" style="font-size: 80px;"></i>
            <br><p>Orders</p><p><%= ocount %></p>
                   </center>
               </div> 
             <div class="bodyblw border border-5 rounded-5 border-dark">
            <center>
            <i class="bi bi-cart-check-fill" style="font-size: 80px;"></i>
            <br>
            <p>Total Products Sold till now</p><p><%= pscount %></p></center>
             </div>
            <div class="bodyblw border border-5 rounded-5 border-dark">
            <center>
            <i class="bi bi-calendar3" style="font-size: 80px;"></i>
            <br><p>Total Tables Booked till now</p><p><%= tbcount %></p></center>
        </div>
        </div>
        
    </body>
</html>

<%-- 
    Document   : bookcnf
    Created on : 16 Mar, 2025, 3:59:59 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>

  <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>book confirm code Page</title>
    </head>
    <body >
<%  String ustr="";
    int uid=0;
               session=request.getSession(false);
                   ustr=(String)session.getAttribute("uid");
                   uid=Integer.parseInt(ustr);
    String fname=request.getParameter("fn");
    String lname=request.getParameter("ln");
    Double total=Double.parseDouble(request.getParameter("tot"));
    java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
    int bookId = 0;
    ResultSet rs,rst=null;
    Connection con=null;
    PreparedStatement pst,ps,ps2,psCheck=null;
     try
               {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/coffeeshop";
                   String  user="root";
                   String  pass="sweet15";
                   con=DriverManager.getConnection(url,user,pass);
                   
           
        String insertBookings = "INSERT INTO bookings (date, uid, total) VALUES (?, ?, ?)";
        pst = con.prepareStatement(insertBookings, Statement.RETURN_GENERATED_KEYS);
        pst.setDate(1, currentDate);
        pst.setInt(2,uid); 
        pst.setDouble(3, total); 
        pst.executeUpdate();
        rs = pst.getGeneratedKeys();
        if (rs.next()) {
            bookId = rs.getInt(1);
        }
       // out.println(bookId);
        String selectCart = "SELECT tid, t_price, bk_date, persons, stime, etime FROM b_cart WHERE uid =?";
        ps = con.prepareStatement(selectCart);
        ps.setInt(1, uid); 
        rst = ps.executeQuery();
        //out.println("s1"); 
        int res=0;
          String insertBookItems = "INSERT INTO booking_items ( tid, t_price, bk_date, persons, stime, etime ,uid, bid) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps2 = con.prepareStatement(insertBookItems);
       // out.println("s1");
        
      while (rst.next()) {
            int tblid = rst.getInt("tid");  //out.println("s1");
            int price = rst.getInt("t_price");
            int person = rst.getInt("persons");
            java.sql.Date dt = rst.getDate("bk_date");
            java.sql.Time st=rst.getTime("stime");
            java.sql.Time et=rst.getTime("etime");  //out.println("s1");
            ps2.setInt(1,tblid);
            ps2.setInt(2,price);
            ps2.setDate(3,dt);
             ps2.setInt(4,person);
            ps2.setTime(5,st);
             ps2.setTime(6,et);
              ps2.setInt(7,uid);
               ps2.setInt(8,bookId);
            res=ps2.executeUpdate();
        }
        
        
        out.println("s1");
         if(res>0)
      {
        String deleteCartSQL = "DELETE FROM b_cart WHERE uid = ?";
        pst = con.prepareStatement(deleteCartSQL);
        pst.setInt(1, uid); 
        pst.executeUpdate();
      }  
        out.println("s2"); 
        String insertBill = "INSERT INTO booking_bill (uid, bid, total_amount, bill_date, payment_status) VALUES (?, ?, ?, ?, ?)";
        pst = con.prepareStatement(insertBill);
              pst.setInt(1, uid);
              pst.setInt(2, bookId);
              pst.setDouble(3, total);
              pst.setDate(4, currentDate);
              pst.setString(5, "Pending");
            int res2= pst.executeUpdate();
        if(res2>0)
        {
             out.print(fname);
             out.print(lname);
             out.print(bookId);
        response.sendRedirect("bill.jsp?fn="+fname+"&ln="+lname+"&bid="+bookId);
           
        }
   } 
  
     catch (Exception e) {
        
        out.println(e.getMessage());
      }
        
        
     finally {
        // Close resources
        
        }
    
%>
 
    </body>
</html>

<%-- 
    Document   : ulogin
    Created on : 16 Mar, 2025, 12:42:42 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user login Page</title>
    </head>
    <body>
        <%

            String username = request.getParameter("uname");
            // String usermob= request.getParameter("umob");
            String uemail = request.getParameter("umail");
            String useradd = request.getParameter("uadd");
            String userpass = request.getParameter("upass");
            long umob = Long.parseLong(request.getParameter("umob"));
            int uscr = Integer.parseInt(request.getParameter("uscrq"));
            int result;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffeeshop", "root", "sweet15");
                PreparedStatement p = con.prepareStatement("select * from user");
                ResultSet rs = p.executeQuery();
                while (rs.next()) {
                    if (uemail.equals(rs.getString(3))) {

                       request.setAttribute("errorMessage","This email is Already registered !!");
                       request.getRequestDispatcher("uhome.jsp").include(request, response);


                    }

                }
                PreparedStatement ps = con.prepareStatement("insert into user(uname, Mobile_no, uemail, upassword,address,scr_que) values(?,?,?,?,?,?)");

                ps.setString(1, username);
                ps.setLong(2, umob);
                ps.setString(3, uemail);
                ps.setString(4, userpass);
                ps.setString(5, useradd);
                ps.setInt(6, uscr);
                result = ps.executeUpdate();
                //out.println("Inserted data Successfully");
                con.close();
                if (result > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("uhome.jsp");
                    rd.include(request, response);
                } else {
                }

            } catch (Exception e) {
               // out.println(e);
            }
        %>


    </body>
</html>

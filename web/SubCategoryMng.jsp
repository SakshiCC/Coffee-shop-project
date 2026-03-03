<%-- 
    Document   : SubCategoryMng
    Created on : 16 Mar, 2025, 1:19:15 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Category Manage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <%@include file="Common_Bootsrap/bootstrap.jsp" %>
        <style>
            #hed2{
                justify-content: center;
                border: 2px solid white;
                height: 300px;
                width: 400px;
                padding: 50px 25px 25px 25px;
                color: white;
                border-radius: 10px;
                margin-top: 50px;
                margin-bottom: 10px;

            }
            #btn{
                margin-top: 25px;
                border-radius: 5px;
                height: 35px;
                width: 70px;
                color: black;
            }
            .displaytbl{
                margin-left: 60px;
                margin-right: 60px;
            }
            #Alert
            {    
                align-self: center;
                margin-top: 10px;
            }

        </style>



        <script>
            function del(cid)
            {
                var res = window.confirm("are you sure to delete the data ?");

                if (res)
                {
                    window.location.href = "deletesubcat.jsp?cid=" + cid;
                }
            }
             function setdisplay() 
            {    const a = document.getElementById('Alert');
                a.style.display="center";
            }
        </script>

    </head>

    <body style="background-color: #000000;">
        <jsp:include page="admsidebar.jsp"></jsp:include>
            <br><br>
        <%! int cid=0;%>
                
        <% 
          
              cid =Integer.parseInt(request.getParameter("cid"));
              String s=request.getParameter("f");
        %>
         <center>
             <%
                 if(s != null && s.equals("invalid"))
         {
                 %>
             <script>
             setdisplay();
         </script>
<div id="Alert">
<div class="alert alert-danger alert-dismissible w-25 fade show" role="alert">
  <strong>sorry !</strong> <br> This category already Exists !!
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
      
  </button>
</div>
</div>
         <%
         }
         
         %>
      

       
    <center>

        <div id="hed2" style="background: transparent ; backdrop-filter: blur(20px);">
            <h2 style="color: white; font-style: italic;">MANAGE SUB CATEGORY</h2>
            <form class="form1" action="subcategorycode.jsp"><br>

                <div class="mb-3">
                    <label for="formGroupExampleInput2" class="form-label"> Sub-Category Name</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" name="t2" required>
                </div>  
                <input type="hidden" name="cid" value="<%=cid%>">
                <button class="btn"  type="submit" 
       style="background: linear-gradient(45deg, #A97142, #D2A679); 
              border: 2px solid #E0C3A5;
              color: white; font-weight: bold; border-radius: 8px; 
              padding: 10px 20px; 
              box-shadow: 0 4px 8px rgba(224, 195, 165, 0.5);">
     Add
</button>
            </form>
        </div>
    </center> 

    <%
        String url, pass, user;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/coffeeshop";
            user = "root";
            pass = "sweet15";
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "select *from p_subcategory";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rst = pst.executeQuery();
    %>




    <div class="displaytbl mt-4">
        <table class="table table-borderd border-light table-dark table-striped table-hover align-middle">
            <thead>
                <tr>
                    <th scope="col">Category Id</th>
                    <th scope="col">Sub-Category Id</th>
                    <th scope="col">Sub-category</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>

                </tr>
            </thead>
            <%
                while (rst.next()) {
            %>

            <tr>
                <td><%=rst.getInt(1)%></td>
                <td><%=rst.getInt(2)%></td>
                <td><%=rst.getString(3)%></td>
                <td><a href="subcategoryupd.jsp?sbcid=<%=rst.getInt(2)%>&cid=<%=rst.getInt(1)%>" class="btn btnt"  style="background: linear-gradient(45deg, #FFA726, #FFB74D); 
                       color: white; font-weight: bold; border-radius: 8px; 
                       padding: 8px 15px; box-shadow: 0 4px 8px rgba(255, 183, 77, 0.3);">Update</a></td>
                <td><button class="btn btn-light" onclick="del(<%=rst.getInt(2)%>)" style="background: linear-gradient(45deg, #D72638, #FF3B3F); 
                            color: white; font-weight: bold; border-radius: 8px; 
                            padding: 8px 15px; box-shadow: 0 4px 8px rgba(215, 38, 56, 0.3);">Delete</button></td>

            </tr>

            <%
                }
            %>
        </table> </div>

    <%
        } catch (Exception e) {
            out.print(e);
        }

    %>


</body>
</html>

</html>



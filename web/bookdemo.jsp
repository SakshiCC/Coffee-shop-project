<%-- 
    Document   : bookdemo
    Created on : 16 Mar, 2025, 3:42:42 PM
    Author     : SAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Shop Booking Form</title>
    <%@include file="Common_Bootsrap/bootstrap.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <style>
            .bkform{
                margin-top: 70px;
                width: 600px;
                height: 650px;
                margin-left: 800px; 
                background-color: black;
                border: solid 2px white;
                color: white;
                border-radius: 15px;
            }
            #Alert
            {    margin-left: 300px;
                align-self: center;
                margin-top: 150px;
            }
            </style>
            <script>
                 function setdisplay() 
            {    const a = document.getElementById('Alert');
                a.style.display="center";
            }
            </script>
                    
</head>
<body style="background: url('image/tbg1.jpg') no-repeat;background-size: cover;">
    <%@include  file="uhome2.jsp" %>
    <%
         
          int tid=Integer.parseInt(request.getParameter("tid"));
         Double price=Double.parseDouble(request.getParameter("price"));
       
         String s=request.getParameter("f");
         if(s != null && s.equals("invalid") )
         {
             %>
             <script>
             setdisplay();
         </script>
<div id="Alert">
<div class="alert alert-danger alert-dismissible w-50 fade show" role="alert">
  <strong>sorry !</strong> <br>This table is already booked with the same slot.Please choose another slot.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
      
  </button>
</div>
</div>
<%
    }
%>
<div class="bkform" style=" margin-top: 150px">
    <div class="container mt-4">
        <h2 class="text-center mt-2 mb-3">Book a Table</h2> 
        <form action="bkcode.jsp" method="POST"> 
            <div class="row mb-2"> 
                <div class="col-md-6"> 
                    <label for="fname" class="form-label">Table Id</label> 
                    <input type="text" class="form-control" id="tid" name="tid"  value=<%=tid%> readonly> 
                </div> 
                <div class="col-md-6"> 
                    <label for="fname" class="form-label">Price</label> 
                    <input type="text" class="form-control" id="price" name="price" value=<%=price%> readonly> 
                </div> 
            </div> 
            <div class="row mb-2"> 
                <div class="col-md-6"> 
                    <label for="fname" class="form-label">First Name</label> 
                    <input type="text" class="form-control" id="fname" name="fname" required> 
                    
                </div> 
                <div class="col-md-6"> 
                    <label for="lname" class="form-label">Last Name</label> 
                    <input type="text" class="form-control" id="lname" name="lname" required>
                    
                </div>
            </div>
            <div class="row mb-2"> 
                <div class="col-md-6"> 
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                    
                </div> 
                <div class="col-md-6"> 
                        <label for="date" class="form-label">Date</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                       
                </div> 
            </div> 
            <div class="row mb-2"> 
                <div class="col-md-6"> 
                    <label for="time" class="form-label"> Start Time</label> 
                    <input type="time" class="form-control time" id="time" name="stime" required>
                    
                 </div> 
                 <div class="col-md-6"> 
                    <label for="time" class="form-label"> End Time</label> 
                    <input type="time" class="form-control time" id="time2" name="etime" required>
                    
                </div>
            </div>
           <div class="row mb-2"> 
             <div class="col-md-6"> 
               <label for="num_persons" class="form-label">Number of Persons</label>
               <input type="number" class="form-control" id="num_persons" name="num_persons" min="1" max="15" required> 
               
             </div>
           </div>
            <center>
            <button type="submit" class="btn btn-outline-danger btn-lg w-50 center-center mt-3">Book Table</button> 
    </form> 
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    
    
    <script>
    document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById('date');
    const startTimeInput = document.getElementById('time');
    const endTimeInput = document.getElementById('time2');

    function validateTime(input) {
        const selectedTime = input.value;
        const selectedHour = parseInt(selectedTime.split(':')[0]);

        if (selectedHour < 7 || selectedHour >= 20) {
            alert('Please select a time between 7 AM and 8 PM.');
            input.value = ''; // Clear the invalid input
        }
    }

    function validateDate(input) {
        const selectedDate = new Date(input.value);
        const currentDate = new Date();
        const maxDate = new Date();
        maxDate.setDate(currentDate.getDate() + 8);

        if (selectedDate < currentDate || selectedDate > maxDate) {
            alert('Please select a date within the next 8 days.');
            input.value = ''; // Clear the invalid input
        }
    }

    dateInput.addEventListener('input', function () {
        validateDate(this);
    });

    startTimeInput.addEventListener('input', function () {
        validateTime(this);
    });

    endTimeInput.addEventListener('input', function () {
        validateTime(this);
    });

    // Set min and max dates for the date input
    const currentDate = new Date();
    const maxDate = new Date();
    maxDate.setDate(currentDate.getDate() + 8);

    dateInput.min = currentDate.toISOString().split('T')[0];
    dateInput.max = maxDate.toISOString().split('T')[0];
});

</script>
 </div>
</body>
</html>

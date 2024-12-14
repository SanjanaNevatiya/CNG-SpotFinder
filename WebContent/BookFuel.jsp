<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Fuel</title> <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<%@ page import="java.sql.*, dbconnection.ConnectDB1" %>
 <%@ page import="fuelstation.*" %>
     <!-- Custom Style-CSS -->
    
    <style>
        /* Additional Custom CSS */
        body {
    font-family: Arial, sans-serif;
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
    background-color: #f2f2f2; /* Light gray background */
}

.header {
    background-color: #333; /* Dark background for header */
    color: #fff; /* White text */
    padding: 10px 0;
    z-index: 1000; /* Ensure header appears above other content */
}

.header h1 a {
    color: #fff; /* White text for the logo */
}

.sidebar {
    position: fixed;
    left: 0;
    top: 80px; /* Top position aligned with the header */
    bottom: 0; /* Make sidebar take full height */
    width: 250px;
    background-color: #333; /* Red background */
    padding-top: 40px;
    overflow-y: auto; /* Enable scrolling if content overflows */
    z-index: 999; /* Ensure sidebar appears beneath header */
}

.sidebar h2 {
    color: #fff;
    text-align: center;
    margin-bottom: 20px;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    text-align: center;
    margin-bottom: 10px; /* Space between sidebar items */
}

.sidebar ul li a {
    color: #fff;
    text-decoration: none;
    display: block;
    padding: 10px;
    transition: background-color 0.3s ease;
}

.sidebar ul li a:hover {
    background-color: #555; /* Darker background on hover */
}

.content {
    margin-left: 250px; /* Ensure content doesn't overlap sidebar */
    padding: 20px;
}

/* Styling for the main content */
h1 {
    color: #e31b23; /* Red color for headings */
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;

}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

th {
    background-color: #333;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

a {
    color: #007BFF;
    text-decoration: none;
    padding: 5px;
}

a:hover {
    text-decoration: underline;
}
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #e31b23; /* Red color */
            margin-bottom: 20px;
            text-align: center;
        }

        h3 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 5px;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #e31b23; /* Red color */
            color: #fff;
            border: none;
            padding: 12px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #a6171a; /* Darker red */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #e31b23; /* Red color */
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            color: #a6171a; /* Darker red */
        }
    </style>
</head>
<div class="header">
    <div class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <h1><a href="#">IndeedFuel</a></h1>
        </div>
        <div class="top-nav-text">
            <div class="nav-contact-w3ls"><i class="fa fa-phone" aria-hidden="true"></i><p>+0(12) 444 262 399</p></div> 
        </div>
        <!-- navbar-header -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="hvr-underline-from-center active" href="index.html">Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AdminLogin.html">Login</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fuel Station <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="loginfuel.html">Login</a></li>
                        <li><a href="FuelStationRegister.html">Register</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">User <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="UserLogin.html">Login</a></li>
                        <li><a href="UserRegister.html">Register</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Delivery Person <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="DeliveryPersonLogin.html">Login</a></li>
                    </ul>
                </li>
                <li><a href="#" class="hvr-underline-from-center">Contact</a></li>
            </ul>
        </div>
        <div class="clearfix"> </div>    
    </div>
</div>
<div class="sidebar">
    <h2>Fuel Station Management</h2>
       <ul>
        <li><a href="ViewFuelStation.jsp">View Fuel Stations</a></li>
        <li><a href="SearchFuelStation.jsp">Search Fuel Station</a></li>
        <li><a href="UserViewPending.jsp">View Pending Bookings</a></li>
        <li><a href="ViewAssignedBookingsUser.jsp">View Assigned Bookings</a></li>
         <li><a href="ViewDeliveredBookingsU.jsp">View Delivery Bookings</a></li>
         <li><a href="ViewRejectedBookings.jsp">View Rejected Bookings</a></li>
        <li><a href="ChangePasswordUser.html">Change Password</a></li>
    </ul></div>
       
       
        <div class="content">
          <h4>Book Fuel:</h4>
                        <div class="table-container">
                            <form action="Book.jsp" method="post">
                                <%
                                    int stationid = 0;
                                 String stationidParam = request.getParameter("stationid");
                              if (stationidParam != null && !stationidParam.trim().isEmpty()) {
                                     stationid = Integer.parseInt(stationidParam);
                                    }
                                %>
                                <input type="hidden" name="stationid" value="<%= stationid %>">
                                <input type="hidden" name="userid" value="<%=GetterSetterUser.getId() %>">
                                <label for="fuelType">Select Fuel Type:</label>
                                <select id="fuelType" name="fuelType" required>
                                    <option value="Petrol">Petrol</option>
                                    <option value="Diesel">Diesel</option>
                                </select>
                                <label for="quantity">Quantity (in Litres):</label>
                                <input type="number" id="quantity" name="quantity" min="1" required>
                                <button type="submit">Book</button>
                            </form>
                        </div>

  
        <a href="ViewFuelStations.jsp" class="back-link">Back to Fuel Stations</a>
    </div>
    
</body>
</html>

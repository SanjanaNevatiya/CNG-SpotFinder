<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dbconnection.ConnectDB1" %>
 <%@ page import="fuelstation.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fuel Station Management</title>
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<%@ page import="java.sql.*, dbconnection.ConnectDB1" %>
 <%@ page import="fuelstation.*" %>
<style>
/* Custom CSS styles */
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

</style>
</head>
<body>
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
              <li><a href="UpdateAvailability.html">Update Fuel Availability</a></li>
            <li><a href="UpdateFuelRate.html">Update Fuel Rate</a></li>
            <li><a href="AddDeliveryPerson.html">Add Delivery</a></li> 
             <li><a href="ViewDeliveryPerson1.jsp">View Delivery</a></li>
            <li><a href="ViewPendingBooking.jsp">View Pending Bookings</a></li>
            <li><a href="ViewAssignedBooking.jsp">View Assigned Bookings</a></li>
            <li><a href="ViewDelieveryBooking.jsp">View Delivered Bookings</a></li>
            <li><a href="ViewRejectedBookings.jsp">View Rejected Bookings</a></li>
               <li><a href="ChangePassword.html">Change Password</a></li>
                  <li><a href="index.html">Log out</a></li>
        </ul></div>
<div class="content">
    <h1>Delivered Bookings</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>UserId</th>
            <th>StationId</th>
            <th>Deliveryperson Id</th>
            <th>Fuel Type</th>
            <th>Quantity</th>
            <th>Status</th>
        </tr>
        <%
        try {
        	 Connection con =ConnectDB1.dbcon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE status=? AND stationid=?");
            ps.setString(1, "Delivered");
            ps.setInt(2, GetterSetterfuel.getSid());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>

        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
    </div>
</body>
</html>

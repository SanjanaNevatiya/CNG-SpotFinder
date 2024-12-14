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
        <li><a href="ViewPending.jsp">View Pending Fuel Station</a></li>
        <li><a href="ViewApproved.jsp">View Approved Fuel Station</a></li>
        <li><a href="ViewDisapproved.jsp">View Disapproved Fuel Station</a></li>
        <li><a href="ViewUserAdmin.jsp">View Users</a></li>
    </ul>
</div>
<div class="content">
    <h1>Disapproved Stations</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Open Time</th>
            <th>Close Time</th>
            <th>Address</th>
            <th>Area</th>
            <th>City</th>
            <th>pincode</th>
            <th>petrol qty</th>
            <th>petrol rate</th>
            <th>diesel qty</th>
            <th>petrol qty</th>
            <th>contact</th>
            <th>email</th>
            <th>password</th>
            <th>Approve</th> <!-- Add this line -->
        </tr>
        <%
        try {
            Connection con =ConnectDB1.dbcon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM fuelstation where status=?");
            ps.setString(1, "Disapproved");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
        %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><%= rs.getString(8) %></td>
            <td><%= rs.getString(9) %></td>
            <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(11) %></td>
            <td><%= rs.getString(12) %></td>
            <td><%= rs.getString(13) %></td>
            <td><%= rs.getString(14) %></td>
            <td><%= rs.getString(15) %></td>
             <td><%= rs.getString(16) %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</div>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>

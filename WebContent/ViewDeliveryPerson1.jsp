<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fuel Station Management</title>
   <title>Fuel Station Management</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> 
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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }

        .header h1 a {
            color: #fff;
            text-decoration: none;
        }

        .navbar-toggle {
            background-color: #333;
            border: none;
            margin-top: 5px;
        }

        .navbar-toggle .icon-bar {
            background-color: #fff;
        }

        .top-nav-text {
            float: right;
            margin-top: 10px;
            margin-right: 20px;
        }

        .top-nav-text p {
            margin-bottom: 0;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 80px;
            bottom: 0;
            width: 250px;
            background-color: #333;
            padding-top: 20px;
            overflow-y: auto;
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
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #555;
        }
        .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #333;
    }
    .form-group input[type="text"] {
      width: calc(100% - 20px);
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }
    .form-group button {
      width: 100%;
      padding: 10px;
      background-color: #d32f2f;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }
    .form-group button:hover {
      background-color: #b71c1c;
    }

       
    </style>
</head>

<body>
    <div class="header">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a href="#">IndeedFuel</a></h1>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="hvr-underline-from-center active" href="#">Home</a></li>
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
            </div>
        </nav>
    </div>

    <div class="sidebar">
        <h2>Fuel Management</h2>
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
        </ul>
    </div>
    <div class="content">
    <h1>Delivery Persons</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Station Id</th>
            <th>Name</th>
            <th>City</th>
             <th>Contact</th>
              <th>Address</th>
               <th>Pincode</th>
                 <th>email</th>
                 <th>Action</th>
        </tr>
        <%
        try {
        	 Connection con =ConnectDB1.dbcon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM deliveryperson WHERE stationid = ?");
            ps.setInt(1, GetterSetterfuel.getSid());
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
                           <td><%= rs.getString(8) %></td>
            <td><a href="DeleteDeliveryPerson.jsp?id=<%=rs.getInt(1) %>">Delete</a></td>
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
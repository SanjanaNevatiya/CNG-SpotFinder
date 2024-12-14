package fuelstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.ConnectDB1;

/**
 * Servlet implementation class FuelStationLogin
 */
public class FuelStationLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuelStationLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Fetching parameters from the login form


	    // Establish database connection
		 

         try {
        	 String email = request.getParameter("email");
             String password = request.getParameter("password");
             // Establish database connection
             Connection con = ConnectDB1.dbcon();
             
             // Prepare SQL statement
             PreparedStatement ps = con.prepareStatement(
                 "SELECT email, password, status FROM fuelstation WHERE email = ? AND password = ?"
             );
             ps.setString(1, email);
             ps.setString(2, password);
             
             // Execute query
             ResultSet rs = ps.executeQuery();
             
             // Process result
             if (rs.next()) {
                 String status = rs.getString("status");
                 if ("Approved".equalsIgnoreCase(status)) {
                     // Set session variables or context attributes
                     GetterSetterfuel.setEmail(email);
                     GetterSetterfuel.setSidByEmail(email); // Assuming sid is retrieved by email
                     GetterSetterfuel.setPassword(password);
                     response.sendRedirect("FuelStationMain.html"); // Redirect to main page after successful login
                 } else {
                     response.sendRedirect("notApproved.html"); // Redirect to not approved page
                 }
             } else {
                 response.sendRedirect("index.html"); // Redirect to login page with error message
             }
             

                          
         } catch (Exception e) {
             e.printStackTrace(); // Handle exceptions more gracefully in a production environment
         }  }
	}

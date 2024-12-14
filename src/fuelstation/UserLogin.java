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
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		   try {
	            // Fetching parameters from the login form
	            String uemail = request.getParameter("uemail");
	            String upassword = request.getParameter("upassword");

	            // Establish database connection
	            Connection con = ConnectDB1.dbcon();

	            // Prepare SQL statement to retrieve user details
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE uemail=? AND upassword=?");
	            ps.setString(1,uemail);
	            ps.setString(2,upassword);

	            // Execute the query
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	            	GetterSetterUser.setUemail(uemail);
	            	GetterSetterUser.setId();
	                // User authenticated, redirect to dashboard or home page
	                response.sendRedirect("UserMain.html"); // Replace with actual dashboard URL
	            } else {
	                // Authentication failed, redirect back to login page
	                response.sendRedirect("login.html?error=1"); // Add error parameter to handle errors in login.html
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Handle exception properly in a real application
	        }
	}

}

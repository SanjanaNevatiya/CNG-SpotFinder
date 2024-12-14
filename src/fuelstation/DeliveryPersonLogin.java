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
 * Servlet implementation class DeliveryPersonLogin
 */
public class DeliveryPersonLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryPersonLogin() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetching parameters from the login form
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Establish database connection
            Connection con = ConnectDB1.dbcon();

            // Prepare SQL statement to retrieve user details
            PreparedStatement ps = con.prepareStatement("SELECT * FROM deliveryperson WHERE email=? AND password=?");
            ps.setString(1,email);
            ps.setString(2,password);

            // Execute the query
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	GetterStterDp.setEmail(email);
            	GetterStterDp.setId();
                // User authenticated, redirect to dashboard or home page
                response.sendRedirect("DeliveryPersonMain.html"); // Replace with actual dashboard URL
            } else {
                // Authentication failed, redirect back to login page with error message
                response.sendRedirect("index.html"); // Add error parameter to handle errors in login.html
            }

            // Close resources
           
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
            response.sendRedirect("index.html?error=1"); // Redirect to error page on exception
        }
    }
}

package fuelstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.ConnectDB1;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		int id=0;
		  String uname = request.getParameter("uname");
	        String ucity = request.getParameter("ucity");
	        String ucontact = request.getParameter("ucontact");
	        String uaddress = request.getParameter("uaddress");
	        String upincode = request.getParameter("upincode");
	        String uemail = request.getParameter("uemail");
	        String upassword = request.getParameter("upassword");

	       

	        try {
	            // Establish database connection
	            Connection con = ConnectDB1.dbcon();
	            
	            // Prepare SQL query
	          
	            PreparedStatement ps = con.prepareStatement( "INSERT INTO user VALUES (?,?,?,?,?,?,?,?)");
	            
	            // Set parameters for the query
	            ps.setInt(1,id);
	            ps.setString(2,uname);
	            ps.setString(3,ucity);
	            ps.setString(4,ucontact);
	            ps.setString(5,uaddress);
	            ps.setString(6,upincode);
	            ps.setString(7,uemail);
	            ps.setString(8,upassword);

	            // Execute the update
	            int i = ps.executeUpdate();
	            if (i > 0) {
	                // Registration successful
	                response.sendRedirect("UserLogin.html");
	            } else {
	                // Registration failed
	                response.sendRedirect("Invalid.html");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle any errors - for simplicity, redirect to error page
	           
	        } 
	}

}

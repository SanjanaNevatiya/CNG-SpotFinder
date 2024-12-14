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
 * Servlet implementation class FuelStationRegister
 */
public class FuelStationRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuelStationRegister() {
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
            // Fetching parameters from the registration form
			int id=0;
            String name = request.getParameter("name");
            String openTime = request.getParameter("openTime");
            String closeTime = request.getParameter("closeTime");
            String address = request.getParameter("address");
            String area = request.getParameter("area");
            String City = request.getParameter("City");
            String pincode = request.getParameter("pincode");
            int petrolQty = Integer.parseInt(request.getParameter("petrolQty"));
            float petrolRate = Float.parseFloat(request.getParameter("petrolRate"));
            int dieselQty = Integer.parseInt(request.getParameter("dieselQty"));
            float dieselRate = Float.parseFloat(request.getParameter("dieselRate"));
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String password = request.getParameter("password");


            // Establish database connection
            Connection con = ConnectDB1.dbcon();

            // Prepare SQL statement for insertion
            PreparedStatement ps = con.prepareStatement("INSERT INTO fuelstation VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,id);
            ps.setString(2,name);
            ps.setString(3,openTime);
            ps.setString(4,closeTime);
            ps.setString(5,address);
            ps.setString(6,area);
            ps.setString(7,City);
            ps.setString(8,pincode);
            ps.setInt(9,petrolQty);
            ps.setFloat(10,petrolRate);
            ps.setInt(11,dieselQty);
            ps.setFloat(12,dieselRate);
            ps.setString(13,contact);
            ps.setString(14,email);
            ps.setString(15,password);
        	ps.setString(16,"Pending");



            // Execute the query
            int i = ps.executeUpdate();
            if (i > 0) {
                // Registration successful
                response.sendRedirect("loginfuel.html"); // Redirect to success page or login page
            } else {
                // Registration failed
                response.sendRedirect("exit.html"); // Redirect to error page
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exception properly in a real application
        }
	}

}

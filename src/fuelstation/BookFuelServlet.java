package fuelstation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookFuelServlet
 */
public class BookFuelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookFuelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		  int fuelStationId = Integer.parseInt(request.getParameter("fuelStationId"));
	        String fuelType = request.getParameter("fuelType");
	        int quantity = Integer.parseInt(request.getParameter("quantity"));

	        // Inserting data into the database
	      
	        out = null;
			try {
	            Connection con = dbconnection.ConnectDB1.dbcon(); // Assuming this is your database connection method
	            PreparedStatement ps = con.prepareStatement("INSERT INTO booking (fuel_station_id, fuel_type, quantity) VALUES (?, ?, ?)");
	            ps.setInt(1, fuelStationId);
	            ps.setString(2, fuelType);
	            ps.setInt(3, quantity);
	            
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                out.println("<script>alert('Fuel booked successfully!');</script>");
	                // Redirecting back to the view fuel stations page after successful booking
	                response.sendRedirect("ViewFuelStations.jsp");
	            } else {
	                out.println("<script>alert('Failed to book fuel. Please try again later.');</script>");
	            }
	        } catch (Exception e) {
	            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
	            e.printStackTrace();
	        }

	}
}

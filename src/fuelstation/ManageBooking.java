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
 * Servlet implementation class ManageBooking
 */
public class ManageBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageBooking() {
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
	            String action = request.getParameter("action");
	            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

	            Connection con =ConnectDB1.dbcon();
	            PreparedStatement ps;

	            if ("assign".equalsIgnoreCase(action)) {
	                String deliveryPersonId = request.getParameter("deliverypersonId");
	                ps = con.prepareStatement("UPDATE bookings SET deliveryPersonId = ?, status = 'assigned' WHERE id = ?");
	                ps.setString(1,deliveryPersonId);
	                ps.setInt(2,bookingId);
	            } else if ("reject".equalsIgnoreCase(action)) {
	                ps = con.prepareStatement("UPDATE bookings SET status = 'rejected' WHERE id = ?");
	                ps.setInt(1,bookingId);
	            } else {
	                throw new IllegalArgumentException("Invalid action: " + action);
	            }

	            ps.executeUpdate();
	            response.sendRedirect("ViewPendingBooking.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.html");
	        }
	}

}

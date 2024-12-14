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
 * Servlet implementation class AddDelieveryperson
 */
public class AddDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDeliveryPerson() {
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
		
		try{
			int id=0;
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String city=request.getParameter("city");
			String pincode=request.getParameter("pincode");
			String contact=request.getParameter("contact");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			Connection con=ConnectDB1.dbcon();
			PreparedStatement ps=con.prepareStatement("insert into deliveryperson values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setInt(2, GetterSetterfuel.getSid());
			ps.setString(3,name);
			ps.setString(4,city);
			ps.setString(5,contact);
			ps.setString(6,address);
			ps.setString(7,pincode);
			ps.setString(8,email);
			ps.setString(9,password);
			int i=ps.executeUpdate();
			if(i!=0)
			{
				response.sendRedirect("FuelStationMain.html");
			}
		}catch(Exception e)
			{
			System.out.println(e);
			}
	}

}

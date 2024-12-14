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
 * Servlet implementation class UpdateFuelRate1
 */
public class UpdateFuelRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFuelRate() {
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
			String newpet=request.getParameter("newPetrolRate");
			String newdie=request.getParameter("newDieselRate");
			Connection con =ConnectDB1.dbcon();
			 PreparedStatement ps=con.prepareStatement("update fuelstation set petrolRate=?,dieselRate=? where email=?");
			 ps.setString(1,newpet);
			 ps.setString(2,newdie);
			 ps.setString(3,GetterSetterfuel.getEmail());
			 int i=ps.executeUpdate();
			if(i!=0){
				response.sendRedirect("FuelStationMain.html");
			}else{
				response.sendRedirect("index.html");
			}
		}catch(Exception e)
			{
			System.out.println(e);
			 
			}

	}

}

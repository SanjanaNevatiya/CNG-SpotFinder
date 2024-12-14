package fuelstation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.ConnectDB1;

import java.sql.*
;/**
 * Servlet implementation class UpdateFuelAva
 */
public class UpdateFuelAva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFuelAva() {
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
	 String petrolQty=request.getParameter("PetrolQty");
		String dieselQty=request.getParameter("DieselQty");
		Connection con =ConnectDB1.dbcon();
		 PreparedStatement ps=con.prepareStatement("update fuelstation set petrolQty=?,dieselQty=? where email=?");
		 ps.setInt(1,Integer.parseInt(petrolQty));
		 ps.setInt(2,Integer.parseInt(dieselQty));
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

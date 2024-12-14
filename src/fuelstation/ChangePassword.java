package fuelstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.ConnectDB1;
import fuelstation.GetterSetterfuel;

import java.sql.*;
/**
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		String pass=request.getParameter("currentPassword");
		String newpass=request.getParameter("confirmPassword");
		if(pass.equals(GetterSetterfuel.getPassword())){
			 Connection con = ConnectDB1.dbcon();
	            PreparedStatement ps = con.prepareStatement( "update fuelstation set password=? WHERE email = ? AND password = ?");
	            ps.setString(1, newpass);
	            ps.setString(2, GetterSetterfuel.getEmail());
	            ps.setString(3, GetterSetterfuel.getPassword());
	            ps.executeUpdate();
	            response.sendRedirect("FuelStationHome.html");
		}
		else
			{
			response.sendRedirect("index.html");
			}
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}

package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB1 {
	public static Connection con=null;
	public static Connection dbcon()
	
	{
		try
		{
			if(con==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3307/indeedfuel","root","sanjana");
				System.out.println("connection Established--"+con);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	

}

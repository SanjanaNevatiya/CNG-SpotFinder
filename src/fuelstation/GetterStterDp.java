package fuelstation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.ConnectDB1;

public class GetterStterDp {
public static String email,password;
public static String getPass() {
	return password;
}

public static void setPass(String password) {
	GetterStterDp.password = password;
}

public static void setId(int id) {
	GetterStterDp.id = id;
}

public static int id;
public static int getId() {
	return id;
}

public static void setId() {
	try{
		  Connection con =ConnectDB1.dbcon();
	      PreparedStatement ps = con.prepareStatement("SELECT id FROM deliveryperson WHERE email = ?");
	      ps.setString(1,email);
	      ResultSet rs=ps.executeQuery();
	      if(rs.next())
		GetterStterDp.id = rs.getInt(1);
		}catch(Exception e)
		{
			e.printStackTrace();
}}

public static String getEmail() {
	return email;
}

public static void setEmail(String email) {
	GetterStterDp.email = email;
}

}

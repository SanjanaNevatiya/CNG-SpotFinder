package fuelstation;
import java.sql.*;

import dbconnection.ConnectDB1;
public class GetterSetterUser {
    public static int id;
    public static String uemail;
    public static String upassword;
	public static int getId() {
		return id;
	}
	public static void setId() {
		 Connection con =ConnectDB1.dbcon();
		 try{
         PreparedStatement ps = con.prepareStatement("SELECT id FRom user WHERE uemail=? ");
         ps.setString(1,uemail);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
        	 id=rs.getInt(1);
         }
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		System.out.println(id);
	}
	public static String getUemail() {
		return uemail;
	}
	public static void setUemail(String uemail) {
		GetterSetterUser.uemail = uemail;
	}
	public static String getUpassword() {
		return upassword;
	}
	public static void setUpassword(String upassword) {
		GetterSetterUser.upassword = upassword;
	}
}

   
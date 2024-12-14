package fuelstation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.ConnectDB1;

public class GetterSetterfuel {

    private static String email;
    private static String password;
    private static int sid;

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        GetterSetterfuel.password = password;
    }

    public static int getSid() {
        return sid;
    }

    public static void setSid(int sid) {
        GetterSetterfuel.sid = sid;
    }

    public static void setSidByEmail(String email) {
        try {
            Connection con = ConnectDB1.dbcon();
            PreparedStatement ps = con.prepareStatement("SELECT id FROM fuelstation WHERE email = ?");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sid = rs.getInt(1);
            }
           
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception properly, log or throw as needed
        }
    }

    public static String getEmail() {
        return email;
    }

    public static void setEmail(String email) {
        GetterSetterfuel.email = email;
    }
}

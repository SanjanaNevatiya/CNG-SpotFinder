<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, dbconnection.ConnectDB1" %>
 <%@ page import="fuelstation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	try{
			
		String id=request.getParameter("id");
		 Connection con =ConnectDB1.dbcon();
		PreparedStatement ps=con.prepareStatement("update fuelstation set status=? where id=?");
		ps.setString(1,"Disapproved");
		ps.setString(2,id);
		int i=ps.executeUpdate();
		response.sendRedirect("ViewPending.jsp");
	}catch(Exception e)
		{
		System.out.println(e);
		}
%>
</body>
</html>
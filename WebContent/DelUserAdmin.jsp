<%@ page import="java.sql.*" %>
<%@ page import="dbconnection.*" %>

<%
    // Get the id parameter from the request
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            // Convert the idParam to an integer (assuming it's an integer)
            int id = Integer.parseInt(idParam);

            // Establish database connection
            Connection con = ConnectDB1.dbcon();

            // Prepare SQL statement for deletion
            String deleteQuery = "DELETE FROM user WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(deleteQuery);
            ps.setInt(1,id);

            // Execute the delete statement
            int rowsDeleted = ps.executeUpdate();

            // Check if deletion was successful
            if (rowsDeleted > 0) {
                // Deletion successful, redirect to view all users page
                response.sendRedirect("ViewAllUser.jsp");
            } else {
                // No rows affected, show error message or handle accordingly
                out.println("Failed to delete user with ID: " + id);
            }

        } catch (NumberFormatException e) {
            // Handle case where idParam cannot be parsed as an integer
            e.printStackTrace();
            // Display an error message or redirect as needed
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
            // Display an error message or redirect as needed
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            // Display an error message or redirect as needed
        }
    } else {
        // Handle case where id parameter is missing or empty
        // Display an error message or redirect as needed
    }
%>

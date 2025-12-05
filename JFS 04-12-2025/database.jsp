<%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("com.mysql.jdbc.Driver");  // For MySQL 5.x  
    // For MySQL 8.x use: Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/user_portal",
        "root",
        "Rbabi@99"
    );
} catch(Exception e) {
    out.println("Database Connection Error: " + e);
}
%>

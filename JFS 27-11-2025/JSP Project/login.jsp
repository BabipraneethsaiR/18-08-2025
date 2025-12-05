<%@ page import ="java.sql.*" %>
<%
String userid = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String cnfpwd = request.getParameter("pass");  // Get confirm password

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/test","root","Rbabi@99");

Statement st = con.createStatement();

String query = "SELECT * FROM members WHERE uname='" + userid + 
               "' AND pass='" + pwd + 
               "' AND pass='" + cnfpwd + "'";

ResultSet rs = st.executeQuery(query);

if (rs.next()) {
    session.setAttribute("userid", userid);
    response.sendRedirect("success.jsp");
} else {
    out.println("Invalid password <a href='index.jsp'>try again</a>");
}
%>

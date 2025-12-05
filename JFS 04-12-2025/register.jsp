<%@ include file="database.jsp" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("password");
String sex = request.getParameter("sex");
String country = request.getParameter("country");

PreparedStatement ps = con.prepareStatement(
    "INSERT INTO users(name,email,password,sex,country) VALUES (?,?,?,?,?)"
);

ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, pass);
ps.setString(4, sex);
ps.setString(5, country);

int i = ps.executeUpdate();

if(i > 0){
    response.sendRedirect("login.jsp?msg=registered");
} else {
    out.print("Registration Failed!");
}
%>

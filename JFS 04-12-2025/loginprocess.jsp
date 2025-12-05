<%@ include file="database.jsp" %>

<%
String email = request.getParameter("email");
String pass = request.getParameter("password");

PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM users WHERE email=? AND password=?"
);

ps.setString(1, email);
ps.setString(2, pass);

ResultSet rs = ps.executeQuery();

if(rs.next()){
    session.setAttribute("email", email);
    response.sendRedirect("index.jsp");
} else {
    out.println("<h3>Invalid Email or Password</h3>");
}
%>

<%
if(session.getAttribute("email") == null){
    response.sendRedirect("login.jsp");
}
%>

<h2>Welcome, <%= session.getAttribute("email") %></h2>

<a href="viewusers.jsp">View Users</a><br><br>
<a href="adduserform.jsp">Add User</a><br><br>
<a href="logout.jsp">Logout</a>

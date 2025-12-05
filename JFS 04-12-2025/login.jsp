<%
if(session.getAttribute("email") != null){
    response.sendRedirect("index.jsp");
}
%>

<h2>Login</h2>

<form action="loginprocess.jsp" method="post">
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>

<% if(request.getParameter("msg") != null){ %>
    <p style="color:green;">Registration successful. Please login.</p>
<% } %>

<a href="registrationform.jsp">New user? Register here</a>

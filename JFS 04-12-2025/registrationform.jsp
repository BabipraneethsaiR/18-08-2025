<h2>User Registration</h2>

<form action="register.jsp" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>

    Sex:
    <input type="radio" name="sex" value="Male">Male
    <input type="radio" name="sex" value="Female">Female<br><br>

    Country:
    <select name="country">
        <option>India</option>
        <option>USA</option>
        <option>UK</option>
    </select><br><br>

    <input type="submit" value="Register">
</form>

<a href="login.jsp">Already have an account?</a>

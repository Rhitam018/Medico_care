<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>docsearch</title>
    <style>
        body {
            background-image: url("back1.jpg");
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(0, 123, 255, 0.7); /* Transparent blue */
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
        }

        .website-name {
            font-weight: bold;
            font-size: 24px;
            margin-left: 10px;
        }

        .tagline {
            font-size: 14px;
            margin-left: 10px;
        }

        .logo img {
            width: 50px;
            height: auto;
        }

        .buttons {
            display: flex;
        }

        .oval-button {
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .oval-button a {
            color: #fff;
            text-decoration: none;
        }

        .oval-button:hover {
            background-color: #0056b3;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px); /* Adjusted height */
            margin-top: 0px; /* Smaller gap */
            flex-direction: column; /* Adjusted to allow stacking of login box and results */
        }

        .login-box {
            background: rgba(255, 255, 255, 0.8); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 400px; /* Maximum width to ensure it doesn't get too large on big screens */
            margin-bottom: 20px; /* Added margin to separate from results */
        }

        .results-box {
            background: rgba(255, 255, 255, 0.8); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 600px; /* Maximum width to ensure it doesn't get too large on big screens */
        }

        .login-box h1,
        .results-box h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-box input[type="submit"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .login-box input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .login-links a {
            color: #007bff;
            text-decoration: none;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

        .result {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <div class="logo">
                <img src="logo.jpeg" alt="Logo">
            </div>
            <div class="website-name">Medico India</div>
            <div class="tagline">your life is our priority</div>
        </div>
        <div class="buttons">
            <div class="oval-button"><a href="login.jsp">Contact Us</a></div>
            <div class="oval-button"><a href="registration.jsp">Review</a></div>
        </div>
    </div>
    <div class="login-container">
        <div class="login-box">
            <h1>DOCTOR SEARCH</h1>
            <form method="post">
                <input type="text" name="dc" placeholder="Enter City" required />
                <input type="text" name="ds" placeholder="Enter specialization" required />
                <input type="submit" value="SEARCH" />
                <div class="login-links">
                </div>
            </form>
        </div>
        <div class="results-box">
            <h1>Search Results</h1>
            <%
                String city = request.getParameter("dc");
                String spec = request.getParameter("ds");
                if (city != null && spec != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "rhitam123");
                        String query = "select * from doctor where dcity=? and dspecialization=?";
                        PreparedStatement p = con.prepareStatement(query);
                        p.setString(1, city);
                        p.setString(2, spec);
                        ResultSet r = p.executeQuery();
                        while (r.next()) {
                            String name = r.getString("dname");
                            String contact = r.getString("dcontact");
                            String address = r.getString("daddr");
                            String city1 = r.getString("dcity");
                            String cham = r.getString("dchamber");
                            String spec1 = r.getString("dspecialization"); // Corrected from sepc1 to spec1
                            String deg = r.getString("ddgree");
                            String mail = r.getString("dmail");
            %>
                            <div class="result">
                                <p><strong>Name:</strong> <%= name %></p>
                                <p><strong>Contact:</strong> <%= contact %></p>
                                <p><strong>Address:</strong> <%= address %></p>
                                <p><strong>City:</strong> <%= city1 %></p>
                                <p><strong>Chamber:</strong> <%= cham %></p>
                                <p><strong>Specialization:</strong> <%= spec1 %></p>
                                <p><strong>Degree:</strong> <%= deg %></p>
                                <p><strong>Email:</strong> <%= mail %></p>
                            </div>
            <%
                        }
                        r.close();
                        p.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</body>
</html>

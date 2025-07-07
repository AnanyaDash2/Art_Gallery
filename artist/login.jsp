<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Login - Art Gallery Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: antiquewhite;
            color: #333;
            line-height: 1.6;
        }

        /* Navbar */
        nav {
            background-color: #444;
            padding: 1rem 0;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            margin: 0 1rem;
            border-radius: 5px;
        }

        nav a:hover {
            background-color: #ffa500;
        }

        /* Login Form */
        .container {
            max-width: 600px;
            margin: 5rem auto;
            padding: 2rem;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            color: #444;
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        .form-group label {
            font-size: 1.1rem;
            color: #444;
        }

        .form-group input {
            width: 100%;
            padding: 1rem;
            margin-top: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: #ffa500;
        }

        .form-group button {
            width: 100%;
            padding: 1rem;
            border: none;
            background-color: #444;
            color: #fff;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 1rem;
        }

        .form-group button:hover {
            background-color: #ffa500;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
            margin-top: 2rem;
        }

        footer p {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
  

    <!-- Login Form -->
    <div class="container">
        <h2>Artist Login</h2>
        <form method="post" action="">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
             <p>Doesn't have an account? <a href="signup.jsp">Signup</a>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Get form data
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                // JDBC logic to authenticate user
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                    String query = "SELECT * FROM artist WHERE username = ? AND password = ?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, username);
                    stmt.setString(2, password);

                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        // Set session attribute and redirect to dashboard.jsp
                         HttpSession session1 = request.getSession();
                session1.setAttribute("id", rs.getInt("id"));
                session1.setAttribute("name", rs.getString("name"));
                session1.setAttribute("username", rs.getString("username"));
                session1.setAttribute("password", rs.getString("password"));
                session1.setAttribute("phone_number", rs.getString("phone_number"));
                session1.setAttribute("email", rs.getString("email"));
                       
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        out.println("<p style='color: red;'>Invalid username or password.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p style='color: red;'>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>
</body>
</html>

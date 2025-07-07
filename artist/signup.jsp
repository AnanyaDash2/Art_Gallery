<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Signup - Art Gallery Management</title>
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

        /* Signup Form */
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
  

    <div class="container">
        <h2>Artist Signup</h2>
        <form method="post" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" required>
            </div>
            <div class="form-group">
                <button type="submit">Sign Up</button>
            </div>
            <p>Already have an account? <a href="login.jsp">Login</a>
        </form>
        
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Get form data
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String phone_number = request.getParameter("phone_number");

                // Validate phone number (must be 10 digits)
                if (!phone_number.matches("\\d{10}")) {
                    out.println("<p style='color: red;'>Phone number must be exactly 10 digits.</p>");
                } else {
                    // JDBC logic to check if username or email already exists
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                        // Check if username already exists
                        String checkUserQuery = "SELECT * FROM artist WHERE username = ? OR email = ?";
                        stmt = conn.prepareStatement(checkUserQuery);
                        stmt.setString(1, username);
                        stmt.setString(2, email);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            // Username or email already exists
                            out.println("<p style='color: red;'>Username or email is already taken. Please choose another one.</p>");
                        } else {
                            // Insert the data into the database
                            String query = "INSERT INTO artist (name, email, username, password, phone_number) VALUES (?, ?, ?, ?, ?)";
                            stmt = conn.prepareStatement(query);
                            stmt.setString(1, name);
                            stmt.setString(2, email);
                            stmt.setString(3, username);
                            stmt.setString(4, password);
                            stmt.setString(5, phone_number);

                            int rows = stmt.executeUpdate();
                            if (rows > 0) {
                                // Redirect to login.jsp after successful signup
                                response.sendRedirect("login.jsp");
                            } else {
                                out.println("<p style='color: red;'>Something went wrong. Please try again.</p>");
                            }
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
            }
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>
</body>
</html>
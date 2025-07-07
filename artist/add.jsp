<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Art - Art Gallery Management</title>
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
        }

        /* Navbar */
        nav {
            background-color: #444;
            padding: 1rem 0;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 1rem;
            font-size: 1.2rem;
            margin: 0 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #ffa500;
        }

        /* Signup Form */
        .container {
            max-width: 600px;
            margin: 6rem auto;
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
            margin-bottom: 1.5rem;
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
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <a href="dashboard.jsp">Home</a>
        <a href="add.jsp">Add Art</a>
        <a href="view.jsp">View Art</a>
        <a href="sold.jsp">Sold Art</a>
        <a href="../index.jsp">Logout</a>
    </nav>

    <!-- Add Art Form -->
    <div class="container">
        <h2>Add Art</h2>
        <form method="post" action="">
            <div class="form-group">
                <label for="art_name">Art Name:</label>
                <input type="text" id="art_name" name="art_name" required>
            </div>
            <div class="form-group">
                <label for="art_type">Art Type:</label>
                <input type="text" id="art_type" name="art_type" required>
            </div>
            <div class="form-group">
                <label for="cost">Cost:</label>
                <input type="number" id="cost" name="cost" required>
            </div>
            <div class="form-group">
                <button type="submit">Add Art</button>
            </div>
        </form>

        <% 
            HttpSession session1 = request.getSession(false);
            if (session1 != null) {
                String name = (String) session1.getAttribute("name");
               // String idString = (String) session1.getAttribute("id");
                int id = (Integer)session1.getAttribute("id"); // Convert to int



                if (request.getMethod().equalsIgnoreCase("POST")) {
                    // Get form data
                    String artName = request.getParameter("art_name");
                    String artType = request.getParameter("art_type");
                    String cost = request.getParameter("cost");

                    // Retrieve the customer id and name (assuming this is available)
                    

                    // Database connection logic
                    Connection conn = null;
                    PreparedStatement stmt = null;

                    try {
                        // JDBC connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                        String query = "INSERT INTO art (artist_name, artist_id,  art_name, art_type, cost) " +
                                       "VALUES (?, ?, ?, ?,?)";
                        stmt = conn.prepareStatement(query);
                        stmt.setString(1, name);
                        stmt.setInt(2, id);
                        stmt.setString(3, artName);
                        stmt.setString(4, artType);
                        stmt.setString(5, cost);

                        int rows = stmt.executeUpdate();
                        if (rows > 0) {
                            out.println("<p style='color: green;'>Art added successfully!</p>");
                        } else {
                            out.println("<p style='color: red;'>Error adding art. Please try again.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            out.println("<p style='color: red;'>Error closing resources: " + e.getMessage() + "</p>");
                        }
                    }
                }
            } else {
                out.println("<p style='color: red;'>Session expired. Please log in again.</p>");
            }
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>

</body>
</html>

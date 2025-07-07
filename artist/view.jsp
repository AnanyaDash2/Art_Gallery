<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Art - Art Gallery Management</title>
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

        .container {
            max-width: 800px;
            margin: 3rem auto;
            padding: 2rem;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            color: #444;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: lightblue;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 1.2rem;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 0.1rem;
        }

        td {
            color: #555;
        }

        tr:hover td {
            background-color: #ffe6cc;
            color: #000;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        td[colspan] {
            text-align: center;
            font-weight: bold;
            color: #888;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="add.jsp">Add Art</a>
         <a href="view.jsp">View Art</a>
        <a href="sold.jsp">Sold Art</a>
        <a href="../index.jsp">Logout</a>
    </nav>

    <!-- Art View Table -->
    <div class="container">
        <h2>Your Artworks</h2>

        <% 
        HttpSession session1 = request.getSession(false);
            // Fetch the artist's ID from the session
            int id = (Integer)session1.getAttribute("id"); // Convert to int


            if (session1 != null) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Establishing connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                    // Query to fetch the artist's artworks
                    String query = "SELECT art_name, art_type, cost, created_at FROM art WHERE artist_id = ? ORDER BY created_at DESC";
                    stmt = conn.prepareStatement(query);
                    stmt.setInt(1,id);
                    rs = stmt.executeQuery();
        %>

        <!-- Artworks Table -->
        <table>
            <thead>
                <tr>
                    <th>Date Uploaded</th>
                    <th>Art Name</th>
                    <th>Art Type</th>
                    <th>Cost</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) {
                        String artName = rs.getString("art_name");
                        String artType = rs.getString("art_type");
                        double cost = rs.getDouble("cost");
                        Timestamp createdAt = rs.getTimestamp("created_at");
                        String formattedDate = new java.text.SimpleDateFormat("dd/MM/yyyy").format(createdAt);
                %>
                <tr>
                    <td><%= formattedDate %></td>
                    <td><%= artName %></td>
                    <td><%= artType %></td>
                    <td>Rs.<%= cost %></td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <% 
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
            } else {
        %>
        <p style="color: red;">You must be logged in to view your artworks.</p>
        <% } %>
    </div>

    <!-- Footer -->
    
</body>
</html>

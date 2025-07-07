<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Gallery - Dashboard</title>
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

        /* Container */
        .container {
            max-width: 1000px;
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
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #444;
            color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .not-bought {
            color: #ff6347;
            font-weight: bold;
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
    <nav>
        <a href="das.jsp">Dashboard</a>
                <a href="../index.jsp">Logout</a>
    </nav>

    <!-- Art Gallery Table -->
    <div class="container">
        <h2>Art Gallery Dashboard</h2>

        <% 
            // Database connection
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establishing connection to database
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                // SQL query to fetch all the art pieces
                String query = "SELECT id, art_name, art_type, artist_id, artist_name, cost, customer_id, customer_name " +
                               "FROM art";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
        %>

        <!-- Artworks Table -->
        <table>
            <thead>
                <tr>
                    <th>Art ID</th>
                    <th>Art Name</th>
                    <th>Art Type</th>
                    <th>Artist ID</th>
                    <th>Artist Name</th>
                    <th>Cost</th>
                    <th>Customer Name</th>
                    <th>Customer ID</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) {
                        String artId = rs.getString("id");
                        String artName = rs.getString("art_name");
                        String artType = rs.getString("art_type");
                        double cost = rs.getDouble("cost");
                        String artistId = rs.getString("artist_id");
                        String artistName = rs.getString("artist_name");
                        String customerId = rs.getString("customer_id");
                        String customerName = rs.getString("customer_name");

                        // Display "Not Bought" if customer info is null
                        if (customerId == null || customerName == null) {
                            customerId = "Not Bought";
                            customerName = "Not Bought";
                        }
                %>
                <tr>
                    <td><%= artId %></td>
                    <td><%= artName %></td>
                    <td><%= artType %></td>
                    <td><%= artistId %></td>
                    <td><%= artistName %></td>
                    <td>Rs. <%= cost %></td>
                    <td class="<%= (customerId.equals("Not Bought") ? "not-bought" : "") %>"><%= customerName %></td>
                    <td class="<%= (customerId.equals("Not Bought") ? "not-bought" : "") %>"><%= customerId %></td>
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
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>
</body>
</html>

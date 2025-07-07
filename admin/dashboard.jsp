<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: antiquewhite;
            color: #333;
            font-size: 16px;
            line-height: 1.6;
        }

        /* Navbar */
        nav {
            background-color: #2d3436;
            padding: 1rem 2rem;
            text-align: left;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        nav .brand {
            color: #fff;
            font-size: 1.8rem;
            font-weight: bold;
        }

        nav .links {
            float: right;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 0.8rem 1.5rem;
            font-size: 1.1rem;
            margin: 0 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        nav a:hover {
            background-color: #ff6f61;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 6rem auto;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2.5rem;
            color: #444;
            font-weight: 600;
        }

        h3 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 1rem;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 2rem 0;
            text-align: left;
            background-color: lightblue;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        table th, table td {
            padding: 1.2rem;
            border: 1px solid #ddd;
            font-size: 1.1rem;
        }

        table th {
            background-color: #2d3436;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: lightblue;
        }

        table tr:hover {
            background-color: antiquewhite;
        }

        table td {
            color: #333;
        }

        /* Action Buttons */
        .form-actions {
            text-align: center;
            margin-top: 2rem;
        }

        .form-actions a {
            padding: 1rem 2rem;
            background-color: #2d3436;
            color: white;
            border-radius: 5px;
            font-size: 1.2rem;
            text-decoration: none;
            margin: 0 1rem;
            transition: background-color 0.3s ease;
        }

        .form-actions a:hover {
            background-color: #ff6f61;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                padding: 1rem;
            }

            nav .links {
                text-align: center;
                clear: both;
            }

            nav a {
                padding: 0.8rem 1rem;
                margin: 0.5rem;
            }

            .container {
                padding: 1.5rem;
                margin: 4rem auto;
            }

            table th, table td {
                padding: 0.8rem;
            }

            .form-actions a {
                padding: 0.8rem 1.5rem;
            }
        }
    </style>
</head>
<body>
<nav>

    <div class="links">
    <center>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="../index.jsp">Logout</a>
    </div></center>
</nav>

<div class="container">
    <h2>Admin Dashboard</h2>

    <% 
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

        // Fetching artists data
        String artistQuery = "SELECT * FROM artist";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(artistQuery);
    %>
    
    <h3>Artists</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Phone Number</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    
    <%
        // Fetching artworks data
        String artQuery = "SELECT * FROM art";
        rs = stmt.executeQuery(artQuery);
    %>

    <h3>Artworks</h3>
    <table>
        <thead>
            <tr>
                <th>Art Name</th>
                <th>Art Type</th>
                <th>Artist Name</th>
                <th>Cost</th>
                <th>Customer Name</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("art_name") %></td>
                    <td><%= rs.getString("art_type") %></td>
                    <td><%= rs.getString("artist_name") %></td>
                    <td>Rs. <%= rs.getBigDecimal("cost") %></td>
                    <td><%= rs.getString("customer_name") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    
    <%
        // Fetching customer data
        String customerQuery = "SELECT * FROM customer";
        rs = stmt.executeQuery(customerQuery);
    %>

    <h3>Customers</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Phone Number</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    
    <%
        } catch (Exception e) {
            out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    %>
</div>

</body>
</html>

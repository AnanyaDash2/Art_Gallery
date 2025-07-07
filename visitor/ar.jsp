<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Artworks</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #faf3e0;
            color: #333;
        }

        /* Navbar styling */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #343a40;
            padding: 0.8rem 2rem;
        }

        nav a {
            text-decoration: none;
            color: #fff;
            font-size: 1.1rem;
            margin: 0 1rem;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ffa500;
        }

        nav .brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #00d4ff;
        }

        nav .links {
            display: flex;
        }

        h1 {
            text-align: center;
            color: #444;
            margin: 1.5rem 0;
        }

        .message, .error {
            text-align: center;
            margin: 1rem 0;
            padding: 0.8rem;
            font-size: 1.1rem;
            border-radius: 5px;
        }

        .message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        table {
            width: 90%;
            margin: 2rem auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 1rem;
            text-align: center;
        }

        table th {
            background-color: lightblue;
            color: #fff;
            text-transform: uppercase;
            font-size: 1rem;
        }

        table tr {
            background-color: #fff;
            transition: background-color 0.3s ease;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f5f5f5;
        }

        table td {
            font-size: 0.95rem;
            color: #555;
        }

        .btn {
            padding: 0.5rem 1rem;
            color: #fff;
            background-color: #28a745;
            text-decoration: none;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<nav>
    <div class="brand">Art Gallery</div>
    <div class="links">
        <a href="dashboard.jsp">Home</a>
        <a href="ar.jsp">Art</a>
        <a href="bo.jsp">Bought Art</a>
        <a href="../index.jsp">Logout</a>
    </div>
</nav>
<h1>Available Artworks</h1>

<%
    String message = null;
    String error = null;
    HttpSession session1 = request.getSession();

    int customerId = (Integer) session1.getAttribute("id");
    String customerName = (String) session1.getAttribute("name");

    if (customerName == null) {
        error = "Customer details are not available in the session. Please log in.";
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

        String action = request.getParameter("action");
        String artId = request.getParameter("id");

        if ("accept".equals(action) && artId != null) {
            String updateQuery = "UPDATE art SET customer_id = ?, customer_name = ? WHERE id = ?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setInt(1, customerId);
            stmt.setString(2, customerName);
            stmt.setString(3, artId);
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                message = "Artwork accepted successfully!";
            } else {
                error = "Failed to accept the artwork. Please try again.";
            }
        }

        String selectQuery = "SELECT id, art_name, art_type, artist_name, cost FROM art WHERE customer_id IS NULL";
        stmt = conn.prepareStatement(selectQuery);
        rs = stmt.executeQuery();
%>

<% if (message != null) { %>
    <div class="message"><%= message %></div>
<% } %>

<% if (error != null) { %>
    <div class="error"><%= error %></div>
<% } %>

<table>
    <thead>
        <tr>
            <th>Art Name</th>
            <th>Art Type</th>
            <th>Artist Name</th>
            <th>Cost</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("art_name") %></td>
                <td><%= rs.getString("art_type") %></td>
                <td><%= rs.getString("artist_name") %></td>
                <td>Rs.<%= rs.getBigDecimal("cost") %></td>
                <td>
                    <a class="btn" href="ar.jsp?action=accept&id=<%= rs.getInt("id") %>">Accept</a>
                </td>
            </tr>
        <% } %>
    </tbody>
</table>

<%
    } catch (Exception e) {
        out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>
</body>
</html>

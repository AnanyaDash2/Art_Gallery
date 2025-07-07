<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sold Artworks</title>
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

    <div class="container">
        <h2>Sold Artworks</h2>
        <%
            String error = null;
            HttpSession session1 = request.getSession();
            // Retrieve artist details from session1
            int artistId = (Integer) session1.getAttribute("id");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establish a connection to the artgallery database
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "password");

                // Retrieve artworks sold by the current artist and bought by customers
                String selectQuery = "SELECT a.id, a.art_name, a.art_type, c.name AS customer_name, c.email AS customer_email, a.cost " +
                                     "FROM art a " +
                                     "JOIN customer c ON a.customer_id = c.id " +
                                     "WHERE a.artist_id = ?";
                stmt = conn.prepareStatement(selectQuery);
                stmt.setInt(1, artistId);
                rs = stmt.executeQuery();
        %>

        <table>
            <thead>
                <tr>
                    <th>Art Name</th>
                    <th>Art Type</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Cost</th>
                </tr>
            </thead>
            <tbody>
                <% 
                boolean hasData = false;
                while (rs.next()) { 
                    hasData = true;
                %>
                    <tr>
                        <td><%= rs.getString("art_name") %></td>
                        <td><%= rs.getString("art_type") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getString("customer_email") %></td>
                        <td>Rs. <%= rs.getBigDecimal("cost") %></td>
                    </tr>
                <% } %>
                <% if (!hasData) { %>
                    <tr>
                        <td colspan="5" style="text-align:center;">No artworks sold yet.</td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Dashboard</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
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

        /* Sidebar (Removed) - not needed based on new requirements */

        .content {
            margin-top: 100px;
            padding: 3rem 2rem;
        }

        .section-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: #444;
        }

        .dashboard-section {
            background-color: white;
            padding: 2rem;
            margin-bottom: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-section h4 {
            margin-bottom: 1.2rem;
            color: #444;
        }

        .dashboard-section p {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #666;
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

    <!-- Content -->
    <div class="content">
        <!-- Dashboard Section -->
        <div class="dashboard-section">
            <h1>Welcome to Your Artist Dashboard!</h1><br><br>
            <p>This is the dashboard where you can manage your artworks, view your collection, track your sold art, and keep an eye on your sales performance. You can easily add new artworks to your collection, update existing ones, or remove artworks no longer available. Use the links above to navigate to the relevant sections, such as viewing detailed reports, interacting with potential buyers, and managing your profile settings. Stay updated with important notifications and messages from your gallery, clients, or team. Additionally, you can access tools for pricing your artworks, setting up exhibitions, and monitoring the progress of your ongoing sales campaigns.</p>
            
        </div>

        <!-- Quick Info Section -->
        <div class="dashboard-section">
            <h1>Your Activities Under 1 roof!!</h1><br><br>
            <p>Here, you can see the latest activities related to your art collection, such as your recently added artworks, recent sales, and upcoming exhibitions. This section also keeps you informed about new messages from potential buyers, feedback from your gallery, and updates on your artwork's performance in the market. Stay on top of your most recent interactions, sales trends, and activities to ensure your collection is always up-to-date and optimized for success.</p>
            
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
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

        /* Dashboard section styling */
        .dashboard {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .dashboard h2 {
            font-size: 2.4rem;
            margin-bottom: 1rem;
            color: #444;
            text-align: center;
        }

        .dashboard p {
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 1rem;
            text-align: justify;
            color: #555;
        }

        .stats {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .stat {
            flex: 1;
            margin: 1rem;
            padding: 2rem;
            background-color: #e9ecef;
            text-align: center;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .stat h3 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: #444;
        }

        .stat h4 {
            font-size: 2.5rem;
            margin: 0;
            color: #444;
            font-weight: bold;
        }

        footer {
            text-align: center;
            margin-top: 2rem;
            padding: 1rem;
            background: #343a40;
            color: #fff;
            font-size: 0.9rem;
        }

        footer a {
            color: #ffa500;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <div class="brand">Art Gallery</div>
        <div class="links">
            <a href="dash.jsp">Home</a>
            <a href="ar.jsp">Art</a>
            <a href="bo.jsp">Bought Art</a>
            <a href="../index.jsp">Logout</a>
        </div>
    </nav>

    <!-- Dashboard Section -->
    <div class="dashboard">
        <h2>Welcome to Your Dashboard</h2>
        <p>
            Welcome to the Art Gallery Customer Dashboard, your one-stop destination for everything art-related! 
            Discover and purchase exquisite pieces from our vast collection curated by talented artists. Whether you are 
            a seasoned art collector or just beginning your journey into the art world, we have something for everyone. 
        </p>
        <p>
            On this dashboard, you can browse through your favorite artworks, explore the latest trends in art, and 
            manage your purchased items. Keep track of your wishlist and plan your next addition to your collection 
            seamlessly.
        </p>
        <p>
            We also bring you exclusive insights into the stories behind each artwork. Learn about the artists, their 
            inspiration, and the techniques they use. Dive deeper into the world of art and let your passion for creativity 
            flourish.
        </p>
        <div class="stats">
            <div class="stat">
                <h3>Total Artists Linked with Us:</h3>
                <h4 id="artistCount">0</h4>
            </div>
            <div class="stat">
                <h3>Total Arts on our Platform:</h3>
                <h4 id="artCount">0</h4>
            </div>
        </div>
        <p>
            Don’t forget to check out our “Art” section to view the latest arrivals and trending artworks. 
            Your "Bought Art" section keeps a record of your purchases for easy reference. Stay tuned for exclusive 
            offers and events curated just for our valued customers. 
        </p>
        <p>
            Thank you for being a part of our community. Let’s continue to celebrate and preserve the beauty of art together!
        </p>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Art Gallery Management. Crafted with ❤️. <a href="contact.jsp">Contact Us</a></p>
    </footer>

    <!-- JavaScript for Counters -->
    <script>
        function animateCounter(id, start, end, duration) {
            const counter = document.getElementById(id);
            const increment = Math.ceil(end / (duration / 50)); // Steps for smooth animation

            let current = start;
            const timer = setInterval(() => {
                current += increment;
                if (current >= end) {
                    current = end;
                    clearInterval(timer);
                }
                counter.innerText = current + "+";
            }, 50);
        }

        // Start the counters
        window.onload = () => {
            animateCounter("artistCount", 0, 200, 2000); // 2000ms animation
            animateCounter("artCount", 0, 500, 2000);   // 2000ms animation
        };
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Art Gallery Management</title>
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

        header {
            background: linear-gradient(90deg, #4b6cb7, #182848);
            color: #fff;
            padding: 2rem 0;
            text-align: center;
        }

        header h1 {
            font-size: 2.8rem;
        }

        header p {
            font-size: 1.2rem;
            margin-top: 0.5rem;
        }

        nav {
            display: flex;
            justify-content: center;
            background: #3c4b64;
            padding: 1rem 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 1.5rem;
            font-size: 1.1rem;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ffa500;
        }

        nav a.active {
            font-weight: bold;
            color: #00d4ff;
        }

        .container {
            max-width: 1100px;
            margin: 2rem auto;
            padding: 1.5rem;
           background: linear-gradient(to bottom, grey, white);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
        }

        .section {
            margin-bottom: 2.5rem;
        }

        .section h2 {
            font-size: 2.4rem;
            color: #444;
            text-align: center;
            margin-bottom: 1rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .section p {
            font-size: 1.1rem;
            text-align: justify;
            margin-bottom: 1rem;
        }

        .team {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }

        .team .member {
            flex: 1 1 calc(30% - 2rem);
            max-width: calc(30% - 2rem);
            text-align: center;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .team .member:hover {
            transform: translateY(-5px);
        }

        .team img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .team h3 {
            font-size: 1.3rem;
            margin-bottom: 0.2rem;
            color: #333;
        }

        .team p {
            font-size: 0.95rem;
            color: #666;
        }

        footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 1.2rem 0;
            margin-top: 2rem;
        }

        footer p {
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>
    <header>
        <h1>About Us</h1>
    </header>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="serv.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <div class="container">
        <!-- About Section -->
        <div class="section">
            <b><h2>About the Art Gallery Management System</h2></b>
            <p>
                The Art Gallery Management System brings innovation to art gallery management, simplifying the 
                organization and showcasing of art. This platform offers robust tools for managing collections, 
                planning exhibitions, and fostering connections between artists and art enthusiasts.
            </p>
            <p>
                By integrating technology with creativity, our system ensures seamless operations and an enhanced 
                experience for curators, artists, and visitors alike.
            </p>
        </div>

        <!-- Mission Section -->
        <div class="section">
           <b><h2>Our Mission</h2></b> 
            <p>
                Our mission is to revolutionize the way art galleries operate by providing an efficient, 
                technology-driven platform. We strive to bridge the gap between art and its audience, making 
                galleries more accessible and operationally streamlined.
            </p>
        </div>

        <!-- Team Section -->
        <div class="section">
            <b><h2>Meet the Best in Arts</h2></b> 
            <div class="team">
                <div class="member">
                    <img src="https://www.vancouverbiennale.com/wp-content/uploads/2014/08/09-11-OpenAir-reena-saini-kallat-photo.jpg" alt="Jane Doe">
                    <h3>Reena Saini Kallat</h3>
                   
                </div>
                <div class="member">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjoTOrG0E0z9imft-ideR1t3cn5NRpruawGA&s" alt="John Smith">
                    <h3>S. H. Raza</h3>
                   
                </div>
                <div class="member">
                    <img src="https://www.bulgarihotels.com/.imaging/bhr-wide-big-jpg/dam/arteit/98481---works-on-paper-by-anish-kapoor/format-2560x1600-98481/jcr%3Acontent" alt="Mary Johnson">
                    <h3>Anish Kapoor</h3>
                    <p>Marketing Specialist</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>
</body>
</html>

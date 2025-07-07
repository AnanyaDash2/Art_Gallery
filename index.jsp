<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Gallery Management</title>
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

        .hero {
            background: url('https://i.pinimg.com/originals/6e/bd/83/6ebd83af0134ccce13c7dd42c3b0ae55.jpg') no-repeat center center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }

        .hero h2 {
            font-size: 3.5rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .container {
            padding: 3rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section {
            margin: 3rem 0;
        }

        .section h2 {
            font-size: 2rem;
            color: #182848;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .section p, .section ul {
            margin: 0 auto;
            max-width: 800px;
            text-align: center;
        }

        .section ul {
            list-style-type: none;
            margin-top: 1rem;
        }

        .section ul li {
            padding: 0.5rem;
            background: #f4f4f4;
            margin: 0.5rem 0;
            border-radius: 5px;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .gallery img {
            width: 100%;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .gallery img:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
        }

        footer {
            background: linear-gradient(90deg, #182848, #4b6cb7);
            color: #fff;
            text-align: center;
            padding: 1.5rem 0;
        }

        footer p {
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <header>
        <h1>FrameWorks</h1>
        <p>Streamlining the art of gallery management, one masterpiece at a time.</p>
    </header>

    <nav>
        <a href="index.jsp' ">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="serv.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <section class="hero">
        <h2>Welcome to Our Art Gallery</h2>
    </section>

    <div class="container">
        <!-- Features Section -->
        <div class="section">
            <h2>Key Features</h2>
            <p>
                Our Art Gallery Management System offers comprehensive tools for:
            </p>
            <ul>
                <li>Effortless Art Inventory Management</li>
                <li>Streamlined Exhibition Planning</li>
                <li>Detailed Artist Profiles</li>
                <li>Enhanced Visitor Engagement</li>
                <li>Online Artwork Display</li>
            </ul>
        </div>

        <!-- Gallery Section -->
        <div class="section">
            <h2>Our Collections</h2>
            <div class="gallery">
                <img src="https://thumbs.dreamstime.com/b/comic-book-explosion-background-pop-art-style-graffiti-background-comic-book-explosion-background-pop-art-style-graffiti-320025893.jpg" alt="Art Piece 1">
                <img src="https://t3.ftcdn.net/jpg/02/73/22/74/360_F_273227473_N0WRQuX3uZCJJxlHKYZF44uaJAkh2xLG.jpg" alt="Art Piece 2">
                <img src="https://cdn.shopify.com/s/files/1/0625/3818/6989/files/1_165eca79-1b17-42c1-b328-3d64a1441f0c.jpg" alt="Art Piece 3">
                <img src="https://i.pinimg.com/originals/18/30/23/183023ac2e97a596753d41248352e42e.jpg" alt="Art Piece 4">
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Art Gallery Management System. Designed with care for art enthusiasts worldwide.</p>
    </footer>
</body>
</html>

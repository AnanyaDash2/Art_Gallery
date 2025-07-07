<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Art Gallery Management</title>
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
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1rem;
        }

        .section {
            margin: 2rem 0;
        }

        .section h2 {
            font-size: 2rem;
            color: #444;
            text-align: center;
            margin-bottom: 1rem;
        }

        .contact-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }

        .contact-form,
        .contact-info {
            flex: 1 1 45%;
            background: #fff;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-form h3,
        .contact-info h3 {
            margin-bottom: 1rem;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 0.8rem;
            margin: 0.5rem 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background: #444;
            color: #fff;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background: #ffa500;
        }

        .contact-info p {
            margin: 0.5rem 0;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 1rem;
        }

        .social-links a {
            text-decoration: none;
            color: #fff;
            background: #444;
            padding: 0.8rem;
            border-radius: 50%;
            font-size: 1.5rem;
        }

        .social-links a:hover {
            background: #ffa500;
        }

        .map {
            margin-top: 2rem;
            text-align: center;
        }

        .map iframe {
            width: 100%;
            height: 300px;
            border: 0;
            border-radius: 10px;
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
        <h1>Conatct Us</h1>
    </header>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="serv.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <div class="container">
        <!-- Contact Section -->
        <div class="section">
            <div class="contact-content">
                <!-- Contact Form -->
                <div class="contact-form">
                    
    <h3>Our Support Team</h3>
    <p>
        Need assistance or have questions? Our dedicated support team is here to help you. 
        Reach out to us during our working hours, and we'll ensure your experience is smooth and delightful.
    </p>
    <ul>
        <li><strong>Working Hours:</strong> Monday to Friday, 9 AM - 5 PM</li>
        <li><strong>Support Customer Care:</strong> +91-3451839979 </li>
        <li><strong>Email:</strong> support@artgallery.com</li>
    </ul>

                    
                </div>

                <!-- Contact Info -->
                <div class="contact-info">
                    <h3>Why Only Us?</h3>
                    <p>Best Price for arts by certified veterinarians.</p>
                    <p>24/7 gallery sale services available.</p>
                    <p>Routine adding up and updating the painting collections services.</p>
                    <p>All arts under 1 roof.</p>
                </div>
            </div>
        </div>

        <!-- Map Section -->
        <div class="section map">
            <h2>Find Us Here</h2>
           <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d31076.59310337274!2d74.9315002!3d13.1892296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1731937797189!5m2!1sen!2sin" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
             
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Art Gallery Management System. All rights reserved.</p>
    </footer>
</body>
</html>

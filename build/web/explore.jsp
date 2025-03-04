<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            background-image: url("back1.jpg");
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(0, 123, 255, 0.7); /* Transparent blue */
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
        }

        .website-name {
            font-weight: bold;
            font-size: 24px;
            margin-left: 10px;
        }

        .tagline {
            font-size: 14px;
            margin-left: 10px;
        }

        .logo img {
            width: 50px;
            height: auto;
        }

        .buttons {
            display: flex;
        }

        .oval-button {
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .oval-button a {
            color: #fff;
            text-decoration: none;
        }

        .oval-button:hover {
            background-color: #0056b3;
        }

        .services {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.7); /* Transparent white */
            border-radius: 10px;
        }

        .service {
            position: relative;
            flex: 1 1 calc(30% - 20px); /* Three services per row */
            margin: 10px;
            padding: 15px; /* Reduced padding */
            text-align: center;
            height: 200px; /* Fixed height for square shape */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, filter 0.3s;
            color: black; /* Change text color to black */
            overflow: hidden; /* Prevent overflow */
        }

        .service::before {
            content: '';
            position: absolute;
            inset: 0;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 0;
            border-radius: 10px;
            transition: filter 0.3s;
        }

        .service:hover::before {
            filter: blur(8px);
        }

        .service h3 {
            position: relative;
            z-index: 1;
            margin-bottom: 10px;
        }

        .service p,
        .service button {
            position: relative;
            z-index: 1;
        }

        .service button {
            border: 2px solid #007bff;
            background-color: rgba(0, 123, 255, 0.5);
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .service button:hover {
            background-color: rgba(0, 123, 255, 0.8);
            border-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
        }

        .service-doctor::before {
            background-image: url("doctor.jpg");
        }

        .service-ambulance::before {
            background-image: url("ambulance_1.jpg");
        }

        .service-medical-shop::before {
            background-image: url("medicalshop.jpeg");
        }

        .service-path-lab::before {
            background-image: url("pathology.jpg");
        }

        .service-blood-bank::before {
            background-image: url("download.jpeg");
        }

        .service-hospital::before {
            background-image: url("hospital.jpg");
        }

        footer {
            background-color: rgba(0, 123, 255, 0.7);
            color: #fff;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
            position: relative;
        }

        .back-to-top {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-brand">
            <div class="logo"><img src="logo.jpeg" alt="Logo"></div>
            <div>
                <div class="website-name">Medico India</div>
                <div class="tagline">your life is our priority</div>
            </div>
        </div>
        <div class="buttons">
            <button class="oval-button"><a href="login.jsp">Log in</a></button>
            <button class="oval-button"><a href="registration.jsp">Signup</a></button>
            <button class="oval-button">Explore</button>
            <button class="oval-button">Contact Us</button>
            <button class="oval-button">Review</button>
        </div>
    </nav>

    <div class="services">
        <div class="service service-doctor">
            <h3>Doctor Search & Appointment</h3>
            <p>Find and book appointments with doctors in your area.</p>
            <button onclick="window.location.href='docsearch.jsp'">Search</button>
        </div>
        <div class="service service-ambulance">
            <h3>Ambulance Search</h3>
            <p>Locate and book ambulance services quickly.</p>
            <button onclick="window.location.href='login.jsp'">Search</button>
        </div>
        <div class="service service-medical-shop">
            <h3>Medical Shop Search</h3>
            <p>Find medical shops near you.</p>
            <button onclick="window.location.href='login.jsp'">Search</button>
        </div>
        <div class="service service-path-lab">
            <h3>Pathological Lab Search</h3>
            <p>Search for pathological labs in your vicinity.</p>
            <button onclick="window.location.href='login.jsp'">Search</button>
        </div>
        <div class="service service-blood-bank">
            <h3>Blood Bank Search</h3>
            <p>Find nearby blood banks.</p>
            <button onclick="window.location.href='login.jsp'">Search</button>
        </div>
        <div class="service service-hospital">
            <h3>Hospital Search</h3>
            <p>Locate hospitals near you.</p>
            <button onclick="window.location.href='login.jsp'">Search</button>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Medico India. All rights reserved.</p>
        <p><a href="privacy.jsp" style="color: #fff;">Privacy Policy</a> | <a href="terms.jsp" style="color: #fff;">Terms of Service</a></p>
        <a href="#top" class="back-to-top">Back to Top</a>
    </footer>
</body>
</html>

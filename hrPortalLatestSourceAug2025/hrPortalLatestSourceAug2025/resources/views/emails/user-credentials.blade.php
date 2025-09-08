<!DOCTYPE html>
<html>
<head>
    <!-- Email styles -->
    <style>
        /* Define your styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .email-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header-logo {
            text-align: center;
        }
        .header-logo img {
            max-width: 200px;
            height: auto;
        }
        .email-content {
            padding: 20px;
        }
        /* Add more styles as needed */
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header-logo">
            <!--<img src="" alt="Your Logo">-->
            <img src="{{ asset('assets/img/parvam_logo.png') }}" alt="ParvaM Logo">
        </div>
        <div class="email-content">
            <p>Dear {{$username}},</p>
            <p>Your login credentials are as follows:</p>
            <p><strong>Email:</strong> {{$email}}</p>
            <p><strong>Password:</strong> {{$visible_password}}</p>
            <p><strong>URL:</strong>https://parvamconsultech.com/hrportal</p>
            <p>Please Update your details in the application.</p>
        </div>
    </div>
</body>
</html>

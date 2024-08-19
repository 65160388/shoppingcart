<?php
require 'config.php'; // เชื่อมต่อกับฐานข้อมูล

$error_message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // ตรวจสอบว่ามีอีเมลในระบบหรือไม่
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);

        // ตรวจสอบรหัสผ่าน
        if (password_verify($password, $row['password'])) {
            // เข้าสู่ระบบสำเร็จ
            session_start();
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['first_name'] = $row['first_name']; // เพิ่มตัวแปร session สำหรับชื่อผู้ใช้
            header("Location: index.php");
            exit;
        } else {
            $error_message = "เข้าสู่ระบบไม่สำเร็จ กรุณาลองอีกครั้ง";
        }
    } else {
        $error_message = "อีเมลนี้ไม่ได้ลงทะเบียน";
    }
}

// ปิดการเชื่อมต่อ
mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 30px 40px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            width: 400px;
            text-align: center;
            position: relative;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        .error-message {
            color: #d9534f;
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        .error-message svg {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }

        .login-container label {
            font-size: 16px;
            color: #555;
            display: block;
            text-align: left;
            margin-bottom: 8px;
        }

        .login-container input[type="email"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #FF5722;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #E64A19;
        }

        .login-container p {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }

        .login-container p a {
            color: #FF5722;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-container p a:hover {
            color: #E64A19;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>เข้าสู่ระบบ</h2>
        <?php if ($error_message != ''): ?>
            <div class="error-message">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
                <?php echo $error_message; ?>
            </div>
        <?php endif; ?>
        <form action="login.php" method="post">
            <label for="email">อีเมล:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">รหัสผ่าน:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="เข้าสู่ระบบ">
        </form>
        <p>ยังไม่ได้เป็นสมาชิก? <a href="register.php">สมัครสมาชิกที่นี่</a></p>
    </div>
</body>
</html>

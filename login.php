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
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ</title>
    <link rel="stylesheet" href="assets/css/login.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- เพิ่ม Font Awesome สำหรับไอคอน -->
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
            <div class="password-container">
                <input type="password" id="password" name="password" required>
                <i class="fas fa-eye toggle-password" style="display: none;"></i> <!-- ไอคอนแสดง/ซ่อนรหัสผ่าน -->
            </div>

            <input type="submit" value="เข้าสู่ระบบ">
        </form>
        <p>ยังไม่ได้เป็นสมาชิก? <a href="register.php">สมัครสมาชิกที่นี่</a></p>
    </div>
    
    <!-- Import jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/js/login.js"></script>
</body>
</html>

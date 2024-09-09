<?php
require 'config.php'; // เชื่อมต่อกับฐานข้อมูล

$error_message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = mysqli_real_escape_string($conn, $_POST['first_name']);
    $last_name = mysqli_real_escape_string($conn, $_POST['last_name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $phone = mysqli_real_escape_string($conn, $_POST['phone']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $confirm_password = mysqli_real_escape_string($conn, $_POST['confirm_password']);
    $registration_date = date('Y-m-d');
    $is_active = 1;

    // ตรวจสอบความถูกต้องของเบอร์โทรศัพท์
    if (!is_numeric($phone)) {
        $error_message = "เบอร์โทรศัพท์ต้องเป็นตัวเลขเท่านั้น";
    } elseif (strlen($password) < 8) {
        // ตรวจสอบความยาวของรหัสผ่าน
        $error_message = "รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร";
    } elseif ($password != $confirm_password) {
        // ตรวจสอบว่ารหัสผ่านและยืนยันรหัสผ่านตรงกันหรือไม่
        $error_message = "รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน";
    } else {
        // ตรวจสอบว่าอีเมลมีอยู่ในระบบหรือไม่
        $sql = "SELECT * FROM users WHERE email = '$email'";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            $error_message = "อีเมลนี้มีการใช้งานอยู่แล้ว โปรดใช้อีเมลอื่น";
        } else {
            // เข้ารหัสรหัสผ่าน
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // บันทึกข้อมูลในฐานข้อมูล
            $sql = "INSERT INTO users (first_name, last_name, email, phone, password, registration_date, is_active)
                    VALUES ('$first_name', '$last_name', '$email', '$phone', '$hashed_password', '$registration_date', '$is_active')";

            if (mysqli_query($conn, $sql)) {
                header("Location: welcome.php");
                exit;
            } else {
                $error_message = "เกิดข้อผิดพลาด: " . mysqli_error($conn);
            }
        }
    }

    // ปิดการเชื่อมต่อ
    mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สมัครสมาชิก</title>
    <link rel="stylesheet" href="assets/css/register.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="register-container">
        <h2>สมัครสมาชิก</h2>
        <div class="error-message" style="display: none;"><?php echo htmlspecialchars($error_message); ?></div>
        <form action="register.php" method="post">
            <label for="first_name">ชื่อจริง:</label>
            <input type="text" id="first_name" name="first_name" value="<?php echo isset($_POST['first_name']) ? htmlspecialchars($_POST['first_name']) : ''; ?>" required>

            <label for="last_name">นามสกุล:</label>
            <input type="text" id="last_name" name="last_name" value="<?php echo isset($_POST['last_name']) ? htmlspecialchars($_POST['last_name']) : ''; ?>" required>

            <label for="email">อีเมล:</label>
            <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>

            <label for="phone">เบอร์โทรศัพท์:</label>
            <input type="text" id="phone" name="phone" value="<?php echo isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : ''; ?>">

            <label for="password">รหัสผ่าน:</label>
            <div class="password-container">
                <input type="password" id="password" name="password" required>
                <i class="fas fa-eye toggle-password" style="display: none;"></i> <!-- ไอคอนแสดง/ซ่อนรหัสผ่าน -->
            </div>

            <label for="confirm_password">ยืนยันรหัสผ่าน:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <input type="submit" value="สมัครสมาชิก">
        </form>
        <p>มีบัญชีอยู่แล้ว? <a href="login.php">เข้าสู่ระบบที่นี่</a></p>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/js/register.js"></script>
    <script> var errorMessage = "<?php echo addslashes($error_message); ?>"; </script>

</body>
</html>

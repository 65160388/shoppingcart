<?php
$base_url = 'http://localhost/shoppingcart/';

$db_host = 'localhost';
$db_user = 'root';       // ใช้ชื่อผู้ใช้ที่ถูกต้อง
$db_pass = '';           // ใช้รหัสผ่านที่ถูกต้อง หากมี
$db_name = 'database-shop';

$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>

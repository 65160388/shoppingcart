<?php
session_start();
include 'config.php'; // ตรวจสอบให้แน่ใจว่า config.php มี ;

$product_name = trim($_POST['product_name']);
$price = trim($_POST['price']);
$detail = trim($_POST['detail']);
$image_name = $_FILES['profile_image']['name'];

$image_temp = $_FILES['profile_image']['tmp_name']; // ใช้ตัวแปรที่ถูกต้อง
$folder = 'upload_image/'; // เพิ่ม ; หลังการประกาศตัวแปร
$image_location = $folder . $image_name;

$query = mysqli_query($conn, "INSERT INTO products (product_name, price, profile_image, detail) VALUES ('{$product_name}', '{$price}', '{$image_name}', '{$detail}')") or die('Query failed: ' . mysqli_error($conn)); // เพิ่มข้อความข้อผิดพลาด

if ($query) {
    move_uploaded_file($image_temp, $image_location);

    $_SESSION['message'] = 'Product Saved';
    header('Location: ' . $base_url . '/index.php'); // เพิ่ม ; ท้ายบรรทัด
    exit(); // เพิ่ม exit() หลัง header()
} else {
    $_SESSION['message'] = 'Product Save failed';
    header('Location: ' . $base_url . '/index.php'); // เพิ่ม ; ท้ายบรรทัด
    exit(); // เพิ่ม exit() หลัง header()
}
?>

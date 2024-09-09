<?php
session_start();
include 'config.php';

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// รับคำค้นหาจากฟอร์ม
$searchQuery = isset($_GET['search']) ? mysqli_real_escape_string($conn, $_GET['search']) : '';

// สร้างคำสั่ง SQL สำหรับค้นหาเพื่อดึงข้อมูลจากตาราง products
$sql = "SELECT * FROM products";
if ($searchQuery) {
    $sql .= " WHERE product_name LIKE '%$searchQuery%'";
}

$hand = mysqli_query($conn, $sql);

if (!$hand) {
    die("Query failed: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="icon" href="https://i.pinimg.com/236x/08/1d/a0/081da03b1d9ee7c8eb31b7470b84faff.jpg" type="image/x-icon"> <!--รูปบน Tab browser-->

    <title>หนัาหลัก</title>
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/fontbrands.min.css" rel="stylesheet">
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/solid.min.css" rel="stylesheet">


</head>
<body>
    <?php include 'include/menu.php'; ?>
    <div class="container mt-4">
        <div class="daily-products">
            <h2>สินค้าประจำวัน</h2>
            <div class="product-list">
                <?php while ($row = mysqli_fetch_array($hand)) {
                    $imageSrc = "/shoppingcart/upload_image/" . htmlspecialchars($row['profile_image']);
                    $productId = htmlspecialchars($row['id']);
                    $productName = htmlspecialchars($row['product_name']);
                    $productPrice = htmlspecialchars($row['price']);
                    $productUrl = "product-details.php?id=" . $productId;
                ?>
                    <a href="<?php echo $productUrl; ?>" class="daily-product-card">
                        <img src="<?php echo $imageSrc; ?>" class="product-image" alt="profile_image">
                        <div class="daily-product-info">
                            <div class="daily-product-title"><?php echo $productName; ?></div>
                            <div class="daily-product-price">ราคา <?php echo $productPrice; ?> บาท</div>
                        </div>
                    </a>
                <?php } ?>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <div>
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Terms of Service</a>
            <a href="#">Privacy Policy</a>
        </div>
        <p>&copy; 2024 Your Website. All Rights Reserved.</p>
    </footer>

</body>
</html>

<?php mysqli_close($conn); ?>

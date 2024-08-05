<?php
session_start();
include 'config.php';

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// รับคำค้นหาจากฟอร์ม
$searchQuery = isset($_GET['search']) ? mysqli_real_escape_string($conn, $_GET['search']) : '';

// สร้างคำสั่ง SQL สำหรับค้นหา
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
  
    <link rel="stylesheet" href="assets/css/style.css">  
    <title>Document</title>
    <link href="<?php echo $base_url; ?>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/fontbrands.min.css" rel="stylesheet">
    <link href="<?php echo $base_url; ?>/assets/fontawesome/css/solid.min.css" rel="stylesheet">

    <style>
        .product-card {
            display: flex;
            flex-direction: column;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            margin: 20px;
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-image {
            width: 100%;
            height: auto;
            max-height: 200px;
            object-fit: cover;
        }
        .product-info {
            padding: 15px;
            text-align: center;
        }
        .product-title {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .product-price {
            color: #007bff;
            font-weight: bold;
        }
        .search-form {
            margin: 20px 0;
            text-align: center;
        }
        .daily-products {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .daily-products h2 {
            margin-bottom: 20px;
            text-align: center;
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: #fff;
            z-index: 1000;
            padding: 10px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .daily-product-card {
            width: calc(100% / 5 - 20px);
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .daily-product-card:hover {
            transform: scale(1.05);
        }
        .daily-product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        .daily-product-info {
            padding: 15px;
            text-align: center;
        }
        .daily-product-title {
            font-size: 1em;
            margin-bottom: 10px;
        }
        .daily-product-price {
            color: #007bff;
            font-weight: bold;
        }
    </style>
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
</body>
</html>

<?php mysqli_close($conn); ?>

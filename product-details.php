<?php
include 'config.php'; // ตรวจสอบให้แน่ใจว่าเส้นทางถูกต้อง

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// รับ ID จาก URL
$productId = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($productId > 0) {
    // ดึงข้อมูลสินค้าจากฐานข้อมูล
    $sql = "SELECT * FROM products WHERE id = $productId";
    $result = mysqli_query($conn, $sql);

    if (!$result) {
        die("Query failed: " . mysqli_error($conn));
    }

    $product = mysqli_fetch_assoc($result);

    if (!$product) {
        die("Product not found.");
    }
} else {
    die("Invalid product ID.");
}

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-details {
            margin: 30px auto;
            max-width: 900px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            width: 100%;
            max-height: 500px;
            object-fit: cover;
            border-radius: 8px;
        }
        .product-title {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .product-price {
            color: #007bff;
            font-weight: bold;
            font-size: 1.8em;
            margin-bottom: 20px;
            text-align: center;
        }
        .product-detail {
            font-size: 1.2em;
            line-height: 1.6;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container product-details">
        <h1 class="product-title"><?php echo htmlspecialchars($product['product_name']); ?></h1>
        <img src="upload_image/<?php echo htmlspecialchars($product['profile_image']); ?>" class="product-image" alt="Product Image">
        <p class="product-price">ราคา <?php echo htmlspecialchars($product['price']); ?> บาท</p>
        <p class="product-detail"><?php echo nl2br(htmlspecialchars($product['detail'])); ?></p>
    </div>
</body>
</html>

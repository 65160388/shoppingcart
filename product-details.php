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
    <title>รายละเอียดสินค้า</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .custom-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #96642a80;
            color: white;
        }

        .custom-logo img {
            height: 80px; /* ปรับขนาดโลโก้ให้ใหญ่ขึ้น */
            width: 80px;
            border-radius: 50%; /* ทำให้เป็นวงกลม */
            background-color: white; /* พื้นหลังสีขาว */
            padding: 10px; /* เพิ่ม padding เพื่อให้มีพื้นที่รอบๆ โลโก้ */
        }

        .custom-user-info {
            display: flex;
            align-items: center;
        }

        .custom-user-info img {
            height: 30px;
            margin-right: 10px;
        }

        .custom-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            gap: 20px;
        }

        .custom-product-image {
            flex: 1;
            max-width: 600px; /* ปรับขนาดรูปสินค้าให้ใหญ่ขึ้น */
        }

        .custom-product-image img {
            width: 100%;
            max-height: 600px; /* ปรับขนาดรูปสินค้าให้ใหญ่ขึ้น */
            object-fit: cover;
            border-radius: 8px;
        }

        .custom-product-details {
            flex: 2;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .custom-product-title {
            font-size: 2em;
            color: #333;
        }

        .custom-product-price {
            color: #ff5722;
            font-weight: bold;
            font-size: 1.8em;
            margin: 20px 0;
        }

        .custom-product-detail {
            font-size: 1.2em;
            line-height: 1.6;
            color: #555;
            margin-bottom: 20px;
        }

        .custom-buttons {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .custom-buttons form {
            flex: 1;
            display: flex;
            gap: 10px;
        }

        .custom-buttons button {
            flex: 1;
            padding: 15px 0; /* เพิ่มขนาด padding เพื่อให้ปุ่มใหญ่ขึ้น */
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center; /* เพิ่มการจัดกึ่งกลางข้อความ */
        }

        .custom-buttons .custom-buy-btn {
            background-color: #96642a;
            color: white;
        }

        .custom-buttons .custom-cart-btn {
            background-color: #ffc107;
            color: black;
        }

        .custom-buttons button:hover {
            opacity: 0.9;
        }

        .custom-details-box {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .custom-details-box h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <div class="custom-header">
        <a href="/shoppingcart/index.php" class="custom-logo">
            <img src="img/default-a-stylized-logo-featuring-two-human-hands-with-palms-f-1-1.png" alt="Logo">
        </a>
        <div class="custom-user-info">
            <img src="img/user-fill.svg" alt="User Fill">
            <div>คุณลำใย</div>
        </div>
    </div>
    <div class="custom-container">
        <div class="custom-product-image">
            <img src="upload_image/<?php echo htmlspecialchars($product['profile_image']); ?>" alt="Product Image">
        </div>
        <div class="custom-product-details">
            <h1 class="custom-product-title"><?php echo htmlspecialchars($product['product_name']); ?></h1>
            <p class="custom-product-price">ราคา <?php echo htmlspecialchars($product['price']); ?> บาท</p>
            <div class="custom-buttons">
                <form action="payment.php" method="get">
                    <input type="hidden" name="id" value="<?php echo $productId; ?>">
                    <button type="submit" class="custom-buy-btn">ซื้อ</button>
                </form>
                <button class="custom-cart-btn">เพิ่มลงตะกร้า</button>
            </div>
        </div>
    </div>
    <div class="custom-details-box">
        <h2>รายละเอียดสินค้า</h2>
        <p><?php echo nl2br(htmlspecialchars($product['detail'])); ?></p>
    </div>
</body>
</html>

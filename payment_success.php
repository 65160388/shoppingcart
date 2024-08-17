<?php
include 'config.php'; // ตรวจสอบให้แน่ใจว่าเส้นทางถูกต้อง

// รับ order_id จาก URL
$orderId = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;

if ($orderId > 0) {
    // ดึงข้อมูลคำสั่งซื้อจากฐานข้อมูล
    $sql = "SELECT orders.*, CONCAT(users.first_name, ' ', users.last_name) AS username 
            FROM orders 
            JOIN users ON orders.user_id = users.user_id 
            WHERE orders.order_id = $orderId";
    $result = mysqli_query($conn, $sql);

    if (!$result) {
        die("Query failed: " . mysqli_error($conn));
    }

    $order = mysqli_fetch_assoc($result);

    if (!$order) {
        die("Order not found.");
    }

    // ดึงข้อมูลสินค้าที่ผู้ใช้ซื้อ
    $productSql = "SELECT products.product_name, products.profile_image, order_items.quantity 
                   FROM order_items 
                   JOIN products ON order_items.product_id = products.id 
                   WHERE order_items.order_id = $orderId";
    $productResult = mysqli_query($conn, $productSql);

    if (!$productResult) {
        die("Query failed: " . mysqli_error($conn));
    }

    $products = mysqli_fetch_all($productResult, MYSQLI_ASSOC);

} else {
    die("Invalid order ID.");
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>การชำระเงินสำเร็จ</title>
    <link rel="stylesheet" href="assets/css/payment_success.css">
</head>
<body>
    <div class="success-container">
        <h1>การชำระเงินสำเร็จ!</h1>
        <p>ขอบคุณที่สั่งซื้อสินค้ากับเรา การชำระเงินของคุณสำเร็จเรียบร้อยแล้ว</p>

        <div class="receipt">
            <h4>ใบเสร็จการสั่งซื้อ</h4>
            <p><strong>เลขอ้างอิงคำสั่งซื้อ:</strong> <?php echo htmlspecialchars($order['order_id']); ?></p>
            <p><strong>ผู้ใช้:</strong> <?php echo htmlspecialchars($order['username']); ?></p>
            <p><strong>วันที่สั่งซื้อ:</strong> <?php echo htmlspecialchars($order['order_date']); ?></p>
            <p><strong>ยอดรวม:</strong> <?php echo htmlspecialchars($order['total_amount']); ?> บาท</p>
            <p><strong>สถานะการชำระเงิน:</strong> ชำระแล้ว</p>

            <p><strong>สินค้าที่ซื้อ:</strong></p>
            <?php foreach ($products as $product): ?>
                <div class="product-details">
                    <img src="upload_image/<?php echo htmlspecialchars($product['profile_image']); ?>" alt="Product Image">
                    <p><?php echo htmlspecialchars($product['product_name']); ?> - จำนวน: <?php echo htmlspecialchars($product['quantity']); ?> ชิ้น</p>
                </div>
            <?php endforeach; ?>
        </div>

        <a href="index.php">กลับไปหน้าหลัก</a>
    </div>
</body>
</html>

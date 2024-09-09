<?php
session_start();
include 'config.php';

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// รับข้อมูล order_id จาก URL หรือฟอร์ม
$orderId = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;

if ($orderId > 0) {
    // ดึงข้อมูลคำสั่งซื้อและรายการสินค้า
    $sql = "SELECT orders.*, order_items.*, products.product_name, products.profile_image, products.price, products.id as product_id 
            FROM orders 
            JOIN order_items ON orders.order_id = order_items.order_id 
            JOIN products ON order_items.product_id = products.id 
            WHERE orders.order_id = $orderId";
    $result = mysqli_query($conn, $sql);

    if (!$result) {
        die("Query failed: " . mysqli_error($conn));
    }

    // ตรวจสอบว่ามีคำสั่งซื้อหรือไม่
    if (mysqli_num_rows($result) > 0) {
        $orderItems = mysqli_fetch_all($result, MYSQLI_ASSOC);
    } else {
        die("Order not found.");
    }
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
    <title>สรุปคำสั่งซื้อ</title>
    <link rel="stylesheet" href="assets/css/Payment.css">
</head>
<body>
    <!-- หัวเว็บเพจ -->
    <div class="custom-header">
        <a href="/shoppingcart/index.php">
            <div class="logo-container">
                <img class="default-a-stylized" src="img/default-a-stylized-logo-featuring-two-human-hands-with-palms-f-1-1.png" alt="Logo">
            </div>
        </a>
        <div class="header-title">
            <span>ทำการสั่งซื้อ</span>
        </div>
    </div>

    <div class="container mt-5">
        <!-- <h2 class="text-center mb-4">สรุปคำสั่งซื้อ</h2> -->
        <div class="card">
            <div class="card-header">
                ข้อมูลสินค้า
            </div>
            <div class="card-body">
                <?php foreach ($orderItems as $item): ?>
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <img src="upload_image/<?php echo htmlspecialchars($item['profile_image']); ?>" class="img-fluid" alt="Product Image">
                        </div>
                        <div class="col-md-8">
                            <h4><?php echo htmlspecialchars($item['product_name']); ?></h4>
                            <p class="text-muted">ราคา: <?php echo htmlspecialchars($item['price']); ?> บาท</p>
                            <p class="text-muted">จำนวน: <?php echo htmlspecialchars($item['quantity']); ?> ชิ้น</p>
                            <p class="font-weight-bold">ราคารวม: <?php echo htmlspecialchars($item['price'] * $item['quantity']); ?> บาท</p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="payment-container">
            <form action="process_payment.php" method="post" class="d-inline">
                <input type="hidden" name="order_id" value="<?php echo $orderId; ?>">
                <div class="form-group">
                    <label for="payment_method">วิธีการชำระเงิน</label>
                    <select class="form-control" id="payment_method" name="payment_method">
                        <option value="credit_card">บัตรเครดิต</option>
                        <option value="bank_transfer">โอนผ่านธนาคาร</option>
                        <option value="paypal">PayPal</option>
                    </select>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-success">ไปหน้าชำระเงิน</button>
                    <a href="product-details.php?id=<?php echo htmlspecialchars($orderItems[0]['product_id']); ?>" class="btn btn-danger btn-lg">ยกเลิก</a>
                </div>
            </form>
        </div>
    </div>

    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

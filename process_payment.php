<?php
session_start();
include 'config.php';

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// รับข้อมูล order_id จากฟอร์ม
$orderId = isset($_POST['order_id']) ? intval($_POST['order_id']) : 0;

if ($orderId > 0) {
    // ดึงข้อมูลคำสั่งซื้อจากฐานข้อมูล
    $sql = "SELECT orders.*, order_items.*, products.product_name, products.profile_image 
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
        $orderDetails = mysqli_fetch_all($result, MYSQLI_ASSOC);
    } else {
        die("Order not found.");
    }
} else {
    die("Invalid order ID.");
}

// หากยืนยันการจ่ายเงินเสร็จสิ้น ให้บันทึกสถานะการจ่ายเงิน
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['confirm_payment'])) {
    $updateSql = "UPDATE orders SET status = 'paid' WHERE order_id = $orderId";
    if (mysqli_query($conn, $updateSql)) {
        // นำผู้ใช้ไปยังหน้า payment_success.php พร้อมส่ง order_id ไปด้วย
        header('Location: payment_success.php?order_id=' . $orderId);
        exit();
    } else {
        die("Failed to update payment status: " . mysqli_error($conn));
    }
}

mysqli_close($conn);

// สร้าง URL สำหรับ QR Code
$qrData = "ธนาคาร: กสิกรไทย\nชื่อบัญชี: บจก. ช้อปปิ้งออนไลน์\nเลขที่บัญชี: 123-456-789\nจำนวนเงินที่ต้องชำระ: " . htmlspecialchars($orderDetails[0]['total_amount']) . " บาท";
$qrUrl = 'https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=' . urlencode($qrData) . '&choe=UTF-8';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายละเอียดการชำระเงิน</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
/* process_payment.css */

/* พื้นหลัง */
body {
    background-color: #eef2f5;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
}

/* คอนเทนเนอร์หลัก */
.custom-container {
    max-width: 800px;
    margin: auto;
    padding: 30px 15px;
}

/* การ์ด */
.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    margin-bottom: 30px;
    overflow: hidden;
    background-color: #fff;
}

/* ส่วนหัวของการ์ด */
.card-header {
    background-color: #007bff;
    color: #fff;
    font-weight: 600;
    font-size: 1.2rem;
    padding: 15px 20px;
}

/* เนื้อหาภายในของการ์ด */
.card-body {
    padding: 25px;
}

/* ข้อมูลสินค้า */
.product-details {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
    background-color: #f8f9fa;
    border-radius: 5px;
}

/* รูปภาพสินค้า */
.product-image {
    max-width: 120px;
    margin-right: 20px;
    border-radius: 10px;
}

/* ข้อมูลสินค้า */
.product-info h5 {
    margin-bottom: 5px;
    font-size: 18px;
    color: #333;
}

.product-info p {
    margin: 0;
    color: #555;
    font-size: 14px;
}

/* เน้นราคาสินค้า */
.product-info .price {
    font-weight: bold;
    color: #007bff;
    font-size: 16px;
}

/* สไตล์ของข้อความในส่วนการชำระเงิน */
.payment-info p {
    margin: 0;
    font-size: 1rem;
    margin-bottom: 10px;
    color: #333;
}

.payment-info strong {
    color: #007bff;
}

/* สไตล์ของรูป QR Code */
.payment-info img {
    display: block;
    margin: 20px auto;
    max-width: 250px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* ปุ่มกลับไปหน้าหลัก */
.btn-primary {
    background-color: #007bff;
    border: none;
    padding: 12px 25px;
    font-size: 1.1rem;
    border-radius: 8px;
    transition: background-color 0.3s ease;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

/* เปลี่ยนสีปุ่มเมื่อ hover */
.btn-primary:hover {
    background-color: #0056b3;
}

/* จัดการกับระยะห่างในส่วนต่างๆ */
.mt-4 {
    margin-top: 2rem !important;
}

/* จัดวางปุ่มให้อยู่ตรงกลาง */
.text-center {
    text-align: center !important;
}

/* Media Query สำหรับหน้าจอขนาดเล็ก */
@media (max-width: 768px) {
    .card-body {
        padding: 15px;
    }
    .btn-primary {
        width: 100%;
        margin-top: 20px;
    }
    .product-details {
        flex-direction: column;
        align-items: flex-start;
    }
    .product-image {
        max-width: 100px;
        margin-right: 0;
        margin-bottom: 15px;
    }
}

</style>
</head>
<body>
    <div class="custom-container mt-5">
        <h2 class="text-center mb-4">รายละเอียดการชำระเงินผ่านธนาคาร</h2>
        
        <div class="card mb-4">
            <div class="card-header">
                รายละเอียดคำสั่งซื้อ
            </div>
            <div class="card-body">
                <?php foreach ($orderDetails as $detail): ?>
                    <div class="product-details">
                        <img src="upload_image/<?php echo htmlspecialchars($detail['profile_image']); ?>" alt="Product Image" class="product-image img-fluid">
                        <div class="product-info">
                            <h5><?php echo htmlspecialchars($detail['product_name']); ?></h5>
                            <p>จำนวน: <?php echo htmlspecialchars($detail['quantity']); ?> ชิ้น</p>
                            <p>ราคารวม: <?php echo htmlspecialchars($detail['price'] * $detail['quantity']); ?> บาท</p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                ข้อมูลการโอนเงิน
            </div>
            <div class="card-body payment-info">
                <p><strong>ธนาคาร:</strong> กสิกรไทย</p>
                <p><strong>ชื่อบัญชี:</strong> บจก. ช้อปปิ้งออนไลน์</p>
                <p><strong>เลขที่บัญชี:</strong> 123-456-789</p>
                <p><strong>จำนวนเงินที่ต้องชำระ:</strong> <?php echo htmlspecialchars($orderDetails[0]['total_amount']); ?> บาท</p>

                <p class="mt-4">หลังจากโอนเงินสำเร็จ กรุณาส่งหลักฐานการโอนมาที่ <a href="mailto:payment@example.com">payment@example.com</a></p>
                <hr>
                <p>หรือสามารถสแกน QR Code ด้านล่างเพื่อทำการชำระเงิน:</p>
                <img src="<?php echo $qrUrl; ?>" alt="QR Code" class="img-fluid">
            </div>
        </div>

        <div class="mt-4 text-center">
            <form method="POST" action="process_payment.php">
                <input type="hidden" name="order_id" value="<?php echo $orderId; ?>">
                <button type="submit" name="confirm_payment" class="btn btn-primary btn-lg">ยืนยันการชำระเงิน</button>
            </form>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

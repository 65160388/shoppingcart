<?php
session_start();
include 'config.php';

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// ตรวจสอบว่าผู้ใช้เข้าสู่ระบบหรือไม่
if (!isset($_SESSION['user_id'])) {
    // ถ้ายังไม่ได้เข้าสู่ระบบ ให้เปลี่ยนเส้นทางไปที่หน้า login.php
    header('Location: login.php');
    exit(); // หยุดการทำงานของสคริปต์
}

// รับข้อมูลที่ส่งมาจาก product-details.php
$productId = isset($_POST['product_id']) ? intval($_POST['product_id']) : 0;
$price = isset($_POST['price']) ? floatval($_POST['price']) : 0.0;
$quantity = isset($_POST['quantity']) ? intval($_POST['quantity']) : 1;

if ($productId == 0 || $price == 0) {
    die("Invalid product or price.");
}

// ตรวจสอบว่า user มีที่อยู่หรือไม่
$userId = $_SESSION['user_id']; // ดึง user_id จาก session
$userAddress = "";

// ดึงข้อมูลที่อยู่ของผู้ใช้จากฐานข้อมูล
$addressSql = "SELECT * FROM user_addresses WHERE user_id = $userId LIMIT 1";
$addressResult = mysqli_query($conn, $addressSql);

if ($addressResult && mysqli_num_rows($addressResult) > 0) {
    $addressData = mysqli_fetch_assoc($addressResult);
    $userAddress = $addressData['address_line1'] . ' ' . $addressData['address_line2'] . ', ' .
                   $addressData['district'] . ', ' . $addressData['province'] . ' ' .
                   $addressData['postal_code'] . ', ' . $addressData['country'];
} else {
    // หากไม่มีที่อยู่ในฐานข้อมูล ให้แนะนำผู้ใช้ไปที่หน้าเพิ่มที่อยู่
    echo '<!DOCTYPE html>
          <html lang="en">
          <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>ยังไม่มีที่อยู่ในระบบ</title>
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
              <style>
            body {
                  display: flex;
                  justify-content: center;
                  align-items: center;
                  height: 100vh;
                  background-color: #f8f9fa;
              }
              .card {
                  max-width: 500px;
                  padding: 30px;
                  border-radius: 8px;
                  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                  background-color: #ffffff;
                  text-align: center;
              }
              .card h3 {
                  font-size: 1.75rem;
                  color: #333;
                  margin-bottom: 20px;
              }
              .card p {
                  font-size: 1rem;
                  color: #666;
                  margin-bottom: 20px;
              }
              .card a {
                  text-decoration: none;
                  color: #007bff;
                  font-weight: bold;
                  font-size: 1rem;
              }
              .card a:hover {
                  text-decoration: underline;
              }
              .btn {
                  display: block;
                  width: 100%;
                  margin-top: 20px;
              }
              </style>
          </head>
          <body>
              <div class="card text-center">
                  <h3 class="mb-3">ยังไม่มีที่อยู่ในระบบ</h3>
                  <p>โปรดไปเพิ่มที่อยู่ใน <a href="address.php">หน้าที่อยู่</a> ก่อนดำเนินการต่อ</p>
              </div>
          </body>
          </html>';
    exit();
}

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

// คำนวณราคารวม
$totalAmount = $price * $quantity;

// สร้างวันที่และเวลาปัจจุบัน
$orderDate = date('Y-m-d H:i:s');

// สร้างคำสั่งซื้อในฐานข้อมูล พร้อมบันทึกวันที่และเวลา
$orderSql = "INSERT INTO orders (user_id, total_amount, order_date) VALUES ($userId, $totalAmount, '$orderDate')";
if (mysqli_query($conn, $orderSql)) {
    $orderId = mysqli_insert_id($conn); // รับ order_id ที่เพิ่งสร้าง
    $orderItemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($orderId, $productId, $quantity, $price)";
    mysqli_query($conn, $orderItemSql);
} else {
    die("Failed to create order: " . mysqli_error($conn));
}

mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สรุปคำสั่งซื้อ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/checkout.css">
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
        <!-- ที่อยู่ผู้ใช้ -->
        <div class="card mb-4">
            <div class="card-header">
                ที่อยู่ในการจัดส่ง
            </div>
            <div class="card-body">
                <p><strong>ที่อยู่:</strong> <?php echo htmlspecialchars($userAddress); ?></p>
                <a href="address.php" class="btn btn-link">เปลี่ยนที่อยู่</a>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                ข้อมูลสินค้า
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 d-flex justify-content-center align-items-center">
                        <img src="upload_image/<?php echo htmlspecialchars($product['profile_image']); ?>" class="img-fluid" alt="Product Image">
                    </div>
                    <div class="col-md-6">
                        <h4><?php echo htmlspecialchars($product['product_name']); ?></h4>
                        <p class="text-muted">ราคา: <?php echo htmlspecialchars($price); ?> บาท</p>
                        <p class="text-muted">จำนวน: <?php echo htmlspecialchars($quantity); ?> ชิ้น</p>
                        <p class="font-weight-bold">ราคารวม: <?php echo htmlspecialchars($totalAmount); ?> บาท</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-4 text-right">
            <form action="payment.php" method="get" style="display: inline;">
                <input type="hidden" name="order_id" value="<?php echo $orderId; ?>">
                <button type="submit" class="btn btn-success btn-lg">ไปหน้าชำระเงิน</button>
            </form>
            <a href="product-details.php?id=<?php echo $productId; ?>" class="btn btn-danger btn-lg">ยกเลิก</a>
        </div>
    </div>

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

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
    <title>ชำระเงิน</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/payment.css">
    
</head>
<body>
    <div class="container">
      <div class="header">
        <div class="text-wrapper">2 Hand Market Online</div>
        <div class="text-wrapper-2">วิธีการชำระเงิน</div>
      </div>
      <div class="payment-methods">
        <div class="payment-method">QR พร้อมเพย์</div>
        <div class="payment-method">เก็บเงินปลายทาง</div>
        <div class="payment-method">บัตรเครดิต/บัตรเดบิต</div>
        <div class="payment-method">Mobile Banking</div>
      </div>
      <form action="process_payment.php" method="post">
        <div class="form-group">
          <label for="card-number">CARD NUMBER</label>
          <input type="text" id="card-number" name="card-number" value="4654-2260-5463-6189" />
        </div>
        <div class="form-group">
          <label for="expiry-date">EXPIRY DATE</label>
          <input type="text" id="expiry-date" name="expiry-date" value="08/28" />
        </div>
        <div class="form-group">
          <label for="cvv">CVV</label>
          <input type="text" id="cvv" name="cvv" value="555" />
        </div>
        <div class="form-group">
          <label for="cardholder-name">CARDHOLDER NAME</label>
          <input type="text" id="cardholder-name" name="cardholder-name" value="คุณลำไย" />
        </div>
        <div class="form-group">
          <label for="email">EMAIL ADDRESS</label>
          <input type="email" id="email" name="email" value="khunlamyai123@gmail.com" />
        </div>
        <input type="hidden" id="id" name="id" value="<?php echo $productId; ?>" />
        <div class="actions">
          <a href="index.php" class="btn cancel">ยกเลิก</a>
          <a href="payment_success.php" class="btn confirm">ดำเนินการชำระเงิน</a>
        </div>
      </form>
    </div>
  </body>
</html>

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
    <link rel="stylesheet" href="assets/css/product-details.css">
    <style>
        .custom-product-stock {
            font-size: 1.2em;
            color: <?php echo ($product['stock_quantity'] > 0) ? '#28a745' : '#dc3545'; ?>;
            margin-bottom: 10px;
        }

        .quantity-wrapper {
            margin-bottom: 20px;
        }

        .quantity-wrapper label {
            font-weight: bold;
        }

        .quantity-wrapper input[type="number"] {
            width: 60px;
            padding: 5px;
            margin-left: 10px;
            text-align: center;
        }

        .quantity-wrapper button {
            padding: 5px 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="custom-header">
        <a href="/shoppingcart/index.php" class="custom-logo">
            <img src="img/default-a-stylized-logo-featuring-two-human-hands-with-palms-f-1-1.png" alt="Logo">
        </a>
        <div class="custom-search">
            <form method="GET" action="index.php">
                <input type="text" name="search" placeholder="ค้นหาสินค้า...">
                <button type="submit">ค้นหา</button>
            </form>
        </div>
    </div>
    <div class="custom-container">
        <div class="custom-product-image">
            <img src="upload_image/<?php echo htmlspecialchars($product['profile_image']); ?>" alt="Product Image">
        </div>
        <div class="custom-product-details">
            <h1 class="custom-product-title"><?php echo htmlspecialchars($product['product_name']); ?></h1>
            <p class="custom-product-price">ราคา <?php echo htmlspecialchars($product['price']); ?> บาท</p>
            <?php if ($product['stock_quantity'] > 0): ?> <!--จะถูกซ่อนเมื่อสินค้าหมด -->
                <div class="quantity-wrapper">
                    <label for="quantity">จำนวน:</label>
                    <button type="button" id="decrease-quantity">-</button>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="<?php echo $product['stock_quantity']; ?>">
                    <button type="button" id="increase-quantity">+</button>
                </div>
            <?php endif; ?>
            <p class="custom-product-stock"><?php echo ($product['stock_quantity'] > 0) ? "จำนวนสินค้าคงเหลือ: " . htmlspecialchars($product['stock_quantity']) . " ชิ้น" : "สินค้าหมด"; ?></p>
            
            <div class="custom-buttons">
                <form action="checkout.php" method="post">
                    <input type="hidden" name="product_id" value="<?php echo $productId; ?>">
                    <input type="hidden" name="price" value="<?php echo $product['price']; ?>">
                    <?php if ($product['stock_quantity'] > 0): ?>
                        <input type="hidden" name="quantity" id="form-quantity" value="1"> <!-- ใช้ JavaScript ปรับค่านี้ -->
                    <?php endif; ?>
                    <button type="submit" class="custom-buy-btn" <?php echo ($product['stock_quantity'] == 0) ? 'disabled' : ''; ?>>ซื้อ</button>
                </form>
                <button class="custom-cart-btn" <?php echo ($product['stock_quantity'] == 0) ? 'disabled' : ''; ?>>เพิ่มลงตะกร้า</button>
            </div>
        </div>
    </div>
    <div class="custom-details-box">
        <h2>รายละเอียดสินค้า</h2>
        <p><?php echo nl2br(htmlspecialchars($product['detail'])); ?></p>
    </div>

    <?php if ($product['stock_quantity'] > 0): ?> <!-- เมื่อมีสินค้าคงเหลือ -->
        <script>
            document.getElementById('quantity').addEventListener('input', function() {
                document.getElementById('form-quantity').value = this.value;
            });

            document.getElementById('decrease-quantity').addEventListener('click', function() {
                var quantity = document.getElementById('quantity');
                if (quantity.value > 1) {
                    quantity.value--;
                    document.getElementById('form-quantity').value = quantity.value; // อัปเดตค่าในฟอร์ม
                }
            });

            document.getElementById('increase-quantity').addEventListener('click', function() {
                var quantity = document.getElementById('quantity');
                if (quantity.value < <?php echo $product['stock_quantity']; ?>) {
                    quantity.value++;
                    document.getElementById('form-quantity').value = quantity.value; // อัปเดตค่าในฟอร์ม
                }
            });
        </script>
    <?php endif; ?>
</body>
</html>


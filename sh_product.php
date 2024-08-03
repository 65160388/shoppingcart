<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Product</title>
    <link href="/shoppingcart/assets/css/bootstrap.min.css" rel="stylesheet">
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
            text-decoration: none; /* ลบขีดเส้นใต้จากลิงก์ */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* เพิ่มเงาให้กับการ์ด */
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-image {
            width: 100%;
            height: auto;
            max-height: 200px; /* ปรับขนาดสูงสุดของรูปภาพ */
            object-fit: cover; /* ปรับการจัดวางรูปภาพให้พอดี */
        }
        .product-info {
            padding: 15px; /* ช่องว่างภายในการ์ด */
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
    </style>
</head>
<body>
    <?php include 'include/menu.php'; ?>
    <div class="container mt-4">

        <div class="d-flex flex-wrap">
            <?php
            include 'config.php';  // ตรวจสอบให้แน่ใจว่าเส้นทางถูกต้อง
            
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

            while ($row = mysqli_fetch_array($hand)) {
                // สร้างเส้นทางของภาพและลิงก์
                $imageSrc = "/shoppingcart/include/upload_image/" . htmlspecialchars($row['profile_image']);
                $imageSrc = "upload_image/" . htmlspecialchars($row['profile_image']);
                $productId = htmlspecialchars($row['id']);
                $productName = htmlspecialchars($row['product_name']);
                $productPrice = htmlspecialchars($row['price']);
                $productUrl = "product-details.php?id=" . $productId;
            ?>
                <a href="<?php echo $productUrl; ?>" class="product-card">
                    <img src="<?php echo $imageSrc; ?>" class="product-image" alt="profile_image">
                    <div class="product-info">
                        <div class="product-title"><?php echo $productName; ?></div>
                        <div>ID: <?php echo $productId; ?></div>
                        <div class="product-price">ราคา <?php echo $productPrice; ?> บาท</div>
                    </div>
                </a>
            <?php
            }
            mysqli_close($conn);
            ?>
        </div>
    </div>
</body>
</html>

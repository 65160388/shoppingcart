<?php
session_start();
include 'config.php'; // ไฟล์เชื่อมต่อฐานข้อมูล
include 'functions.php'; // ฟังก์ชัน upgradeUserToSeller

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $userId = $_SESSION['user_id'];
    $storeName = isset($_POST['store_name']) ? mysqli_real_escape_string($conn, $_POST['store_name']) : '';
    $storeDescription = isset($_POST['store_description']) ? mysqli_real_escape_string($conn, $_POST['store_description']) : '';

    if ($storeName && $storeDescription) {
        upgradeUserToSeller($userId, $storeName, $storeDescription);
        $_SESSION['is_seller'] = true; // ตั้งค่าสถานะผู้ขายในเซสชัน
        header('Location: add_product.php');
        exit();
    } else {
        echo "กรุณากรอกข้อมูลให้ครบถ้วน";
    }
    mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>อัปเกรดเป็นผู้ขาย</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        /* หัวเว็บเพจ */
        .custom-header {
            background-color: #ff5722;
            padding: 15px 1%;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            width: 100%;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            /* position: fixed; */
            top: 0;
            z-index: 1000;
        }

        .logo-container {
            width: 80px;
            height: 80px;
            background-color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 25px; /* เพิ่มระยะห่างจากขอบซ้าย */
        }

        .logo-container img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .header-title {
            flex-grow: 1;
            margin-left: 30px; /* เพิ่ม margin-left เพื่อขยับข้อความไปทางขวา */
            margin-right: 50px; /* เพิ่ม margin-right เพื่อสร้างสมดุล */
        }

        .header-title span {
            font-size: 1.7rem;
            color: #ffffff;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            margin-top: 160px; /* ปรับให้ห่างจาก header ที่ fixed */
            transition: transform 0.3s ease;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 1.8rem;
        }

        form div {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
            font-weight: 600;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #4CAF50;
            outline: none;
            background-color: #fff;
        }

        textarea {
            height: 140px;
            resize: vertical;
        }

        button[type="submit"] {
            width: 100%;
            padding: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin-top: 140px;
            }

            .header-title span {
                font-size: 1.6rem;
            }

            button[type="submit"] {
                padding: 12px;
                font-size: 1rem;
            }
        }
    </style>
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
            <span>สมัครเป็นผู้ขาย</span>
        </div>
    </div>

    <div class="container">
        <h2>สมัครเป็นผู้ขาย</h2>
        <form method="POST" action="upgrade_to_seller.php">
            <div>
                <label for="store_name">ชื่อร้านค้า:</label>
                <input type="text" id="store_name" name="store_name" required>
            </div>
            <div>
                <label for="store_description">รายละเอียดร้านค้า:</label>
                <textarea id="store_description" name="store_description" required></textarea>
            </div>
            <button type="submit">สมัครเป็นผู้ขาย</button>
        </form>
    </div>
</body>

</html>

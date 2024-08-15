<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$firstName = isset($_SESSION['first_name']) ? $_SESSION['first_name'] : null;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/menu.css">

    <title>Menu</title>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a href="/shoppingcart/index.php">
            <div class="logo-container">
                <img class="default-a-stylized" src="img/default-a-stylized-logo-featuring-two-human-hands-with-palms-f-1-1.png" alt="Logo">
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">

            <!-- Search Bar -->
            <div class="search-bar-container">
                <form method="GET" action="index.php">
                    <input type="text" name="search" placeholder="ค้นหาสินค้า...">
                    <button type="submit">ค้นหา</button>
                </form>
            </div>
            
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">ผลิตภัณฑ์</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">บริการ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add_product.php">ลงขาย</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">โปรโมชั่น</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ติดต่อ</a>
                </li>
                <?php if ($firstName): ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo htmlspecialchars($firstName); ?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="accountDropdown">
                        <a class="dropdown-item" href="profile.php">ข้อมูลของฉัน</a>
                        <a class="dropdown-item" href="address.php">ที่อยู่</a>
                        <a class="dropdown-item" href="bank.php">บัญชีธนาคาร</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.php">ออกจากระบบ</a>
                    </div>
                </li>
                <?php else: ?>
                <li class="nav-item">
                    <a class="nav-link" href="login.php">เข้าสู่ระบบ</a>
                </li>
                <?php endif; ?>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    <div class="banner" style="position: relative; overflow: hidden;">
        <video autoplay muted loop playsinline style="width: 1264px; height: 416px; border-radius: 0px;">
            <source src="video/video_2.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #333; text-align: center;"></div>
    </div>

    <!-- Search Bar -->
    <div class="search-bar-container">
        <form method="GET" action="index.php">
            <input type="text" name="search" placeholder="ค้นหาสินค้า...">
            <button type="submit">ค้นหา</button>
        </form>
    </div>

    <!-- Category Section -->
    <section class="category-section container">
        <h2>หมวดหมู่</h2>
        <div class="category-grid">
            <div class="category-item">
                <a href="#">
                    <img src="img/รถเก๋ง.png" alt="รถยนต์">
                    <p>รถยนต์</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="img/cpx.png" alt="มอเตอร์ไซต์">
                    <p>มอเตอร์ไซต์</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="img/เดรส.png" alt="เสื้อผ้า">
                    <p>เสื้อผ้า</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="img/ไอโฟน.png" alt="มือถือ / แท็บเล็ต">
                    <p>มือถือ / แท็บเล็ต</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="img/ไมโคร.png" alt="เครื่องใช้ไฟฟ้า">
                    <p>เครื่องใช้ไฟฟ้า</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="img/นากา.png" alt="นาฬิกา">
                    <p>นาฬิกา</p>
                </a>
            </div>
            <!-- Add more categories as needed -->
        </div>
    </section>

    <!-- Bootstrap JS -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script> -->
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>


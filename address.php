<?php
session_start();
include 'config.php';

// ตรวจสอบว่าผู้ใช้เข้าสู่ระบบหรือยัง
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// รับข้อมูลที่อยู่จากฐานข้อมูล
$sql = "SELECT * FROM user_addresses WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

// เพิ่มที่อยู่ใหม่
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $address_line1 = $_POST['address_line1'];
    $address_line2 = $_POST['address_line2'];
    $district = $_POST['district'];
    $province = $_POST['province'];
    $postal_code = $_POST['postal_code'];
    $country = $_POST['country'];

    $sql = "INSERT INTO user_addresses (user_id, address_line1, address_line2, district, province, postal_code, country) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issssss", $user_id, $address_line1, $address_line2, $district, $province, $postal_code, $country);

    if ($stmt->execute()) {
        header("Location: address.php");
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ที่อยู่ของฉัน</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2>ที่อยู่ของฉัน</h2>

    <?php if ($result->num_rows > 0): ?>
        <ul class="list-group mb-4">
            <?php while ($row = $result->fetch_assoc()): ?>
                <li class="list-group-item">
                    <strong>ที่อยู่:</strong> <?php echo htmlspecialchars($row['address_line1']); ?><br>
                    <?php if ($row['address_line2']): ?>
                        <strong>ตำบล/แขวง:</strong> <?php echo htmlspecialchars($row['address_line2']); ?><br>
                    <?php endif; ?>
                    <strong>อำเภอ/เขต:</strong> <?php echo htmlspecialchars($row['district']); ?><br>
                    <strong>จังหวัด:</strong> <?php echo htmlspecialchars($row['province']); ?><br>
                    <strong>รหัสไปรษณีย์:</strong> <?php echo htmlspecialchars($row['postal_code']); ?><br>
                    <strong>ประเทศ:</strong> <?php echo htmlspecialchars($row['country']); ?><br>
                </li>
            <?php endwhile; ?>
        </ul>
    <?php else: ?>
        <p>คุณยังไม่ได้เพิ่มที่อยู่.</p>
    <?php endif; ?>

    <h3>เพิ่มที่อยู่ใหม่</h3>
    <form action="address.php" method="post">
        <div class="form-group">
            <label for="address_line1">บ้านเลขที่, หมู่บ้าน, ถนน:</label>
            <input type="text" class="form-control" id="address_line1" name="address_line1" required>
        </div>
        <div class="form-group">
            <label for="address_line2">ตำบล/แขวง:</label>
            <input type="text" class="form-control" id="address_line2" name="address_line2">
        </div>
        <div class="form-group">
            <label for="district">อำเภอ/เขต:</label>
            <input type="text" class="form-control" id="district" name="district" required>
        </div>
        <div class="form-group">
            <label for="province">จังหวัด:</label>
            <input type="text" class="form-control" id="province" name="province" required>
        </div>
        <div class="form-group">
            <label for="postal_code">รหัสไปรษณีย์:</label>
            <input type="text" class="form-control" id="postal_code" name="postal_code" required>
        </div>
        <div class="form-group">
            <label for="country">ประเทศ:</label>
            <input type="text" class="form-control" id="country" name="country" value="ประเทศไทย" required>
        </div>
        <button type="submit" class="btn btn-primary">เพิ่มที่อยู่</button>
    </form>
</div>

</body>
</html>

<?php
$stmt->close();
$conn->close();
?>

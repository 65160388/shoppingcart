<?php
function upgradeUserToSeller($userId, $storeName, $storeDescription) {
    include 'config.php'; // เชื่อมต่อฐานข้อมูล

    $sql = "INSERT INTO stores (user_id, store_name, store_description) VALUES (?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "iss", $userId, $storeName, $storeDescription);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);

        // อัปเดตสถานะผู้ใช้เป็นผู้ขาย
        $updateUserSql = "UPDATE users SET is_seller = 1 WHERE user_id = ?";
        $updateStmt = mysqli_prepare($conn, $updateUserSql);
        
        if ($updateStmt) {
            mysqli_stmt_bind_param($updateStmt, "i", $userId);
            mysqli_stmt_execute($updateStmt);
            mysqli_stmt_close($updateStmt);
        }
    }

    mysqli_close($conn);
}
?>

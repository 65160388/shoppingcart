<?php
session_start();
include 'config.php';  // เพิ่ม ; หลัง include
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="<?php echo $base_url; ?>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/add_product.css">
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function(){
                var output = document.getElementById('imagePreview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
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
            <span>เพิ่มสินค้า</span>
        </div>
    </div>
    
    <!-- Container -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">
                        <h2 class="mb-0">Add Product</h2>
                    </div>
                    <div class="card-body">
                        <form action="add_product_process.php" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="form-label">Product ID</label>
                                <input type="text" id="product_id" name="product_id" class="form-control" value="">
                            </div>

                            <div class="form-group mt-3">
                                <label class="form-label">Product Name</label>
                                <input type="text" id="product_name" name="product_name" class="form-control" value="">
                            </div>

                            <div class="form-group mt-3">
                                <label class="form-label">Product Price</label>
                                <input type="number" id="price" name="price" class="form-control" step="0.01" value="">
                            </div>
                            <div class="form-group mt-3">
                                <label class="form-label">Stock Quantity</label>
                                <input type="number" id="stock_quantity" name="stock_quantity" class="form-control" value="" min="0">
                            </div>

                            <div class="form-group mt-3">
                                <label for="formFile" class="form-label">Product Image</label>
                                <input type="file" id="profile_image" name="profile_image" class="form-control" accept="image/png, image/jpg, image/jpeg" onchange="previewImage(event)" required>
                                <img id="imagePreview" src="#" alt="Product Image" style="display: none; margin-top: 10px; max-width: 100%; border-radius: 8px;">
                            </div>

                            <div class="form-group mt-3">
                                <label class="form-label">Product Description</label>
                                <textarea name="detail" class="form-control" rows="4"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<?php echo $base_url; ?>/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>

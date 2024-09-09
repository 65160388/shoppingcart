$(document).ready(function () {
    // แสดงข้อความข้อผิดพลาดถ้ามี
    if (errorMessage) {
        $('.error-message').show();
    }

    // แสดงไอคอนแสดง/ซ่อนรหัสผ่านเมื่อเริ่มพิมพ์ในฟิลด์รหัสผ่าน
    $('#password').on('input', function () {
        if ($(this).val().length > 0) {
            $(this).siblings('.toggle-password').addClass('active').show();
        } else {
            $(this).siblings('.toggle-password').removeClass('active').hide();
        }
    });

    // แสดงและซ่อนรหัสผ่านเมื่อกดที่ไอคอนตา
    $('.toggle-password').off('click').on('click', function () {
        let input = $(this).siblings('input');
        if (input.attr('type') === 'password') {
            input.attr('type', 'text');
            $(this).removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            input.attr('type', 'password');
            $(this).removeClass('fa-eye-slash').addClass('fa-eye');
        }
    });
});

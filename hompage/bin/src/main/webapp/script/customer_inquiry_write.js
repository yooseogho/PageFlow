$(document).ready(function() {
    $('#submitInquiry').on('click', function() {
        $('form[action="/customer_inquiry_write_page"]').submit();
    });
});

$(document).on('turbolinks:load', function() {

  $(function() {
    $('.slick-image').slick({
      prevArrow: '<i class="fas fa-chevron-left"></i>',
      nextArrow: '<i class="fas fa-chevron-right"></i>'
    });
  });
});
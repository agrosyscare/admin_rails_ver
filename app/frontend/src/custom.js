document.addEventListener("turbolinks:load", function() {
  $(".nav a").on("click", function() {
    debugger
    $(".nav").find(".active").removeClass("active");
    $(this).parent().addClass("active");
  });
});

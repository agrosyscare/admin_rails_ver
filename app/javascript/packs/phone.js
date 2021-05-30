document.addEventListener("turbolinks:load", function () {
  $(function () {
    window.format_phone = function (value) {
      let phone, newPhone;

      phone = value.replace(/[()]|\s+|^0+/g, "").match(/^([+]?[0-9]{8,12})()/);

      if (phone == null) {
        newPhone = "";
      } else if (phone[0].length == 8) {
        newPhone = "+569" + phone[0];
      } else if (phone[0].length == 9) {
        newPhone = "+56" + phone[0];
      } else if (phone[0].length == 11) {
        newPhone = "+" + phone[0];
      } else {
        newPhone = phone[0];
      }

      return newPhone.toUpperCase();
    };

    $("body").on("blur", ".phone", function (event) {
      event.target.value = format_phone(event.target.value);
    });

    if( !$(".phone").val() ) {
      $(this).trigger("blur");
    }
  });
});

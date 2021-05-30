document.addEventListener("turbolinks:load", function () {
  $(function () {
    window.format_run = function (value) {
      var aRut, i, j, nPos, sInvertido, sRut, sRut1;
      nPos = 0;
      sRut1 = value;
      aRut = sRut1.split("-");
      sRut1 = aRut.join("");
      aRut = sRut1.split(".");
      sRut1 = aRut.join("");
      sInvertido = "";

      i = sRut1.length - 1;
      while (i >= 0) {
        sInvertido += sRut1.charAt(i);
        if (i === sRut1.length - 1) {
          sInvertido += "-";
        } else if (nPos === 3) {
          sInvertido += ".";
          nPos = 0;
        }
        nPos++;
        i--;
      }

      sRut = "";

      j = sInvertido.length - 1;
      while (j >= 0) {
        if (sInvertido.charAt(sInvertido.length - 1) !== ".") {
          sRut += sInvertido.charAt(j);
        } else {
          if (j !== sInvertido.length - 1) {
            sRut += sInvertido.charAt(j);
          }
        }
        j--;
      }

      return sRut.toUpperCase();
    };

    window.unformat_run = function (value) {
      var aRut, sRut;
      sRut = value;
      aRut = sRut.split("-");
      sRut = aRut.join("");
      aRut = sRut.split(".");
      sRut = aRut.join("");

      return sRut.toUpperCase();
    };

    $("body").on("blur", ".rut", function (event) {
      event.target.value = format_run(event.target.value);
    });

    $("body").on("focus", ".rut", function (event) {
      event.target.value = unformat_run(event.target.value);
    });

    if( !$(".rut").val() ) {
      $(this).trigger("blur");
    }
  });
});

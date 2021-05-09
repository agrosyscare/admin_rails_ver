// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// CSS
import 'scss/application'

// Datatables
require("datatables.net-bs4")(window, $);
require("datatables.net-responsive-bs4")(window, $);
require("datatables.net-buttons-bs4")(window, $);
require("datatables.net-select-bs4")(window, $);

// JS
require("packs/navbar")

// Bootstrap
import 'bootstrap'

// Fontawesome
import "@fortawesome/fontawesome-free/css/all"

// Another files
require("scss/application.scss")

// Chartkick
require("chartkick/chart.js")

$(document).on('turbolinks:load', () => {
  // placeholder example for datatable with checkboxes
  $('#dttb').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $('#dttb').data('source')
    },
    pagingType: "full_numbers",
    columns: [
      {data: "name"},
      {data: "description"}
    ]
  });
})
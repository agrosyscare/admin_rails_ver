// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'packs/application'
import 'bootstrap'
import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Datatables
require("datatables.net-bs4")(window, $);
require("datatables.net-buttons-bs4")(window, $);
require("datatables.net-responsive-bs4")(window, $);
require("datatables.net-select-bs4")(window, $);

// // Chartkick
require("chartkick/chart.js")

// // Custom JS
require('../src/phone')
require('../src/run_cl')
require('../src/datatables')
require('../src/datatables.init')
require('../src/custom')

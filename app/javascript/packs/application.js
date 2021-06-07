// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'stylesheets/application'
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

// Chartkick
require("chartkick/chart.js")

// Bootstrap-select
require('bootstrap-select/js/bootstrap-select')

// Custom JS
require('packs/custom/phone')
require('packs/custom/run_cl')
require('packs/custom/datatables')
require('packs/custom/custom')

// Themes
require('packs/material-dashboard')

// require('packs/core/bootstrap-material-design.min')
// require('packs/core/jquery.min')
// require('packs/core/popper.min')

require('packs/plugins/arrive.min')
require('packs/plugins/bootstrap-datetimepicker.min')
require('script-loader!packs/plugins/bootstrap-notify')
require('packs/plugins/bootstrap-tagsinput')
require('packs/plugins/fullcalendar.min')
require('packs/plugins/jasny-bootstrap.min')
require('packs/plugins/jquery-jvectormap')
require('packs/plugins/jquery.bootstrap-wizard')
require('packs/plugins/jquery.tagsinput')
require('packs/plugins/jquery.validate.min')
require('script-loader!packs/plugins/moment.min')
require('packs/plugins/nouislider.min')
require('packs/plugins/perfect-scrollbar.jquery.min')
require('packs/plugins/sweetalert2')

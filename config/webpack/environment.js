const { environment } = require('@rails/webpacker')
const datatables = require('./loaders/datatables')
const webpack = require('webpack')

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default'],
    Selectpicker: 'bootstrap-select'
  })
)
environment.loaders.append('datatables', datatables)

module.exports = environment

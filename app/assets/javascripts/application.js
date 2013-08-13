// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//
// VENDOR
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap

//
// LIBRARIES
//
//= require ./path_helper
//= require ./diff_match_patch.js
//= require ./path_predictor
//= require ./selector

//
// PAGES
//
//= require ./pages/proxy

window.create_selector = function () {
  window.selector = new MySelectorGadget();
  window.selector.initialize();
}

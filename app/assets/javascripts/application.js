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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.raty
//= require lightbox-2.6.min
//= require_tree .

$(document).ready(function () {
    $('.rating').raty({
        number: 6,
        readOnly: true,
        half: true,
        width: 150,
        starHalf: '/assets/star-half.png',
        starOn: '/assets/star-on.png',
        starOff: '/assets/star-off.png',
        score: function () {
            return $(this).attr('data-score');
        }
    });
    $('.rating-tv').raty({
        number: 4,
        readOnly: true,
        half: true,
        width: 100,
        starHalf: '/assets/star-half.png',
        starOn: '/assets/star-on.png',
        starOff: '/assets/star-off.png',
        score: function () {
            return $(this).attr('data-score');
        }
    });
});
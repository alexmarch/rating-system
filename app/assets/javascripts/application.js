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
//= require jquery.raty
//= require lightbox-2.6.min
//= require turbolinks
//= require_tree .

$(document).ready(function () {

    $.fn.raty.defaults.path = "/assets";

    $('.rating').raty({
        number: 6,
        round: { down: .26, full: .6, up: .76 },
        readOnly: function () {
            return $(this).data("readonly");
        },
        click: function (score, evt) {
            evt.preventDefault();
            var self = this;
            var id = $(this).data("id");
            $.post("/ratings/score", {score: score, id: id})
                .done(function (data) {
                    if (data.vote_average) {
                        $(self).raty({readOnly: true, number: 6, half: true, width: 150, score: data.vote_average});
                        $(self).attr("data-readonly", "true");
                        $(self).prev().text("Rate: " + data.vote_average);
                    }
                });
            return false;
        },
        half: true,
        width: 150,
        score: function () {
            return $(this).attr('data-score');
        }
    });
    $('.rating-tv').raty({
        number: 4,
        round: { down: .26, full: .6, up: .76 },
        readOnly: function () {
            return $(this).data("readonly");
        },
        click: function (score, evt) {
            evt.preventDefault();
            var self = this;
            var id = $(this).data("id");
            $.post("/ratings/score", {score: score, id: id})
                .done(function (data) {
                    if (data.vote_average) {
                        $(self).raty({readOnly: true, number: 4, half: true, width: 100, score: data.vote_average});
                        $(self).attr("data-readonly", "true");
                        $(self).prev().text("Rate: " + data.vote_average);
                    }
                });
            return false;
        },
        score: function () {
            return $(this).attr('data-score');
        },
        half: true,
        width: 100
    });
});
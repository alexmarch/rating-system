# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
        $.fn.raty.defaults.path = "/assets";

        $('.rating').raty
                        number: 6
                        round: {down: .26, full: .6, up: .76}
                        readOnly: -> 
                            $(this).data "readonly"
                        click: (score, evt) -> 
                                evt.preventDefault()
                                self = this
                                id = $(this).data "id"
                                console.log {score: score, id: id}
                                $.post "/ratings/score", {score: score, id: id} 
                                .done (data) ->
                                        console.log data
                                        if data.vote_average
                                                $(self).raty {readOnly: true, number: 6, half: true, width: 150, score: data.vote_average}
                                                $(self).attr "data-readonly", "true"
                                                $(self).prev().text "Rate: " + data.vote_average
                                                return
                                false
                        half: true
                        width: 150
                        score: () ->
                                $(this).attr 'data-score'
        $('.rating-tv').raty
            number: 4
            round: { down: .26, full: .6, up: .76 }
            readOnly: () ->
                    $(this).data "readonly"
            click: (score, evt) ->
                evt.preventDefault()
                self = this
                id = $(this).data "id"
                $.post "/ratings/score", {score: score, id: id}
                .done (data) ->
                        if data.vote_average
                                $(self).raty {readOnly: true, number: 4, half: true, width: 100, score: data.vote_average}
                                $(self).attr "data-readonly", "true"
                                $(self).prev().text "Rate: " + data.vote_average
                                return
                false
            score: () ->
                $(this).attr 'data-score'
            half: true
            width: 100
            
$(document).ready ready
$(document).on "page:load", ready
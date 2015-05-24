View = require "teacup-view"

markdown = new View (md) ->
  @raw marked md

module.exports = new View (articles) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content: "IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      #<!--Import materialize.css-->
      @link
        type: "text/css"
        rel:"stylesheet"
        href:"/materialize/dist/css/materialize.css"
        media:"screen,projection"
      @link rel: "stylesheet", href: "css/index.css"
      @title "Projekt Powiśle"
    @body =>
      @div class: 'container', id: "body", =>
        @img src: "title.png"
        @div class: "row", =>
          # @div class: "col s12 title", =>
          #   @div class: "card-panel light-green", id: "project", =>
          #     # @img src: "title.png"
          #     # @alt: "PROJEKT POWISLE"
        @div class: "row", =>

          @div class: "col s12 m6 l8 calendar", =>
            @div class: "card-panel light-green", =>
              @h5 class: "white-text", =>
                @span "KALENDARZ 30 maja 2015"
              @ul class:"collection", =>
                @a href:"#{}", class: "collection-item", =>
                  @text "BAZAR ROWEROWY"
                  @span class: "badge", "1 234"
                @a href:"#{}", class: "collection-item", =>
                  @text "CZYTANIE BAJEK"
                  @span class: "badge", "500"
                @a href:"#{}", class: "collection-item", =>
                  @text "REKORD GUINESA W KLASKANIU USZAMI"
                  @span class: "badge", "50"

          @div class: "col s12 m6 l4 app", =>
            @div class: "card-panel light-green center-align", =>
              @h5 class: "white-text", =>
                @span "GLOSUJ!"
              @ul class: "collection", =>
                @li class: "collection-item", =>
                  @text "CO: NAZWA WYDARZENIA"
                  @p class: "opis", "Tutaj mamy piękny opis"
                @li class: "collection-item", =>
                  @text "KTO: ORGANIZATOR"
                @li class: "collection-item", =>
                  @text "KIEDY: 30 maja 2015"


#
# <ul class="collection">
#       <li class="collection-item">Alvin</li>
#       <li class="collection-item">Alvin</li>
#       <li class="collection-item">Alvin</li>
#       <li class="collection-item">Alvin</li>
#
# @ul =>
#   @li =>
#     @h6 id: "title-name", "CO: NAZWA WYDARZENIA"
#     @h6 id: "who", "KTO: ORGANIZATOR"
#     @h6 id: "when", "KIEDY: 30 maja 2015"

              # @div class: "container", =>
              #   @div class: "row", =>
              #     @div class: "s12", =>
              #       @div id: "what", =>
              #         @h5 "CO: NAZWA WYDARZENIA"
              #         @p class: "opis", "Tutaj mamy piękny opis"
              #


              #
              # @ul =>
              #   @li =>
              #     @h6 id: "title-name", "CO: NAZWA WYDARZENIA"
              #     @h6 id: "who", "KTO: ORGANIZACJA"
              #     @h6 id: "when", "KIEDY: 30 maja 2015"


    # include jQuery necessary for materialize
      @script src:"https://code.jquery.com/jquery-2.1.1.min.js"
      @script src:"/materialize/dist/js/materialize.min.js"

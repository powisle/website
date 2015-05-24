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
      @div class: 'container', =>
        @div class: "row", =>
          @div class: "col s12 title", =>
            @div class: "card-panel light-green", id: "project", "PROJEKT POWISLE"
        @div class: "row", =>

          @div class: "col s12 m6 l8 calendar", =>
            @div class: "card-panel light-green", =>
              @h5 class: "white-text", =>
                @span "KALENDARZ WYDARZEŃ"
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


                # @li =>
                #   @h5 class:"title-name", "NAZWA WYDARZENIA"
                #   @span "data"

          @div class: "col s12 m6 l4 app", =>
            @div class: "card-panel light-green", =>
              @h5 class: "white-text", =>
                @span "GLOSUJ!"
              @ul =>
                @li =>
                  @h6 class: "title-name", "NAZWA WYDARZENIA"


    # include jQuery necessary for materialize
      @script src:"https://code.jquery.com/jquery-2.1.1.min.js"
      @script src:"/materialize/dist/js/materialize.min.js"

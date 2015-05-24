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
            # @div class: 'row', =>
              # @div class: 'col s12 m12 l8', =>
            @div class: "card-panel light-green", "HERE IS CALENDAR"
          @div class: "col s12 m6 l4 app", =>
            @div class: "card-panel light-green", "HERE IS OUR APP"




    # include jQuery necessary for materialize
      @script src:"https://code.jquery.com/jquery-2.1.1.min.js"
      @script src:"/materialize/dist/js/materialize.min.js"

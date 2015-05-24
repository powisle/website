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
            @img src: "title.png", alt: "PROJEKT POWISLE", id: 'logo'

        @div class: 'row', =>
          @tag 'main', class: 'col s12', id: "main"

      @script src:"/jquery/dist/jquery.min.js"
      @script src:"/materialize/dist/js/materialize.min.js"
      @script src:"/js/bundle.js"

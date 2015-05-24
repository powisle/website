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
      @title "Zgłaszanie projektu"
    @body =>
      @div class: "container form", =>
        @img src: "title.png"
        @div class: "row", =>
          @form class: "col s12"
        @div class: "row", =>
          @div class: "input-field col s6", =>
            @input placeholder: "Nazwa wydarzenia", id: "nazwa", type: "text", class: "validate"
            @label for:"nazwa", classs: "active", "Nazwa wydarzenia"
          @div class: "input-field col s6", =>
            @input placeholder: "Data wydarzenia", id: "data", type: "text", class: "validate"
            @label for:"data", classs: "active", "Data wydarzenia"
        @div class: "row", =>
          @div class: "input-field col s12", =>
            @input placeholder: "Opis wydarzenia", id: "opis_wydarzenia", type: "text", class: "validate"
            @label for:"opis_wydarzenia", classs: "active", "Opis wydarzenia"
        @div class: "row", =>
          @div class: "input-field col s4", =>
            @input placeholder: "Imię i nazwisko", id: "name", type: "text", class: "validate"
            @label for:"name", classs: "active", "Imię i nazwisko"
          @div class: "input-field col s4", =>
            @input placeholder: "Email", id: "email", type: "text", class: "validate"
            @label for:"email", classs: "active", "Email"
          @div class: "input-field col s4", =>
            @input placeholder: "Telefon", id: "phone", type: "text", class: "validate"
            @label for:"phone", classs: "active", "Telefon"
      @div class: "row", =>
        @div class:"col12", =>
          @button class: "btn waves-effect waves-light", type:"submit", name:"action", =>
            @text "WYSLIJ"
            @i class: "mdi-content-send right"


        @script src:"https://code.jquery.com/jquery-2.1.1.min.js"
        @script src:"/materialize/dist/js/materialize.min.js"

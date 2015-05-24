React            = require 'react'

{
  div
  p
  span
  h1, h2, h3, h4, h5, h6
  img
  a
} = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'EventsList'
  render: ->
    div className: "card-panel", [
      h5 {}, "KALENDARZ 30 maja 2015"
    ]
      # ul class:"collection", [
      #
      # ]
      #   for name, votes of {
      #     "Bazar rowerowy": 1234
      #     "Czytanie bajek": 423
      #     "REKORD GUINESA W KLASKANIU USZAMI": 2
      #   }
      #     a href:"/event.html", class: "collection-item", [
      #       name
      #       span class: "badge", votes
      #     ]

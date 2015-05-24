backbone    = require 'backbone'
React       = require 'react'
components  = require './components'

module.exports = class MainRouter extends backbone.Router
  initialize: ->
    container = document.getElementById 'main'

    @route '(/)', =>
      @navigate 'events', trigger: yes

    @route 'events(/)', =>
      React.render new components.List, container

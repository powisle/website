backbone = require 'backbone'
React    = require 'react'

module.exports = class MainRouter extends backbone.Router
  initialize: ->

    @route '(/)', =>
      @navigate 'events', trigger: yes

    @route 'events(/)', =>
      console.log 'TODO: Display events list view'

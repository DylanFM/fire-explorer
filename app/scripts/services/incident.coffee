'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.Incident
 # @description
 # # Incident
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'Incident', ->
    class Incident
      constructor: (data) ->
        angular.extend @, data

      getColour: ->
        switch @properties.alertLevel
          when 'Advice' then '#2472e5'
          when 'Watch and Act' then '#f88225'
          when 'Emergency Warning' then '#d30910'
          else '#cccccc' # 'Not Applicable'

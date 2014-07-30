'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.UserLocation
 # @description
 # # UserLocation
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'userLocation', (geolocation) ->
    new class UserLocation
      constructor: ->
        @getLocation()

      getLocation: ->
        geolocation.getLocation().then (loc) =>
          # Pull location data into this object
          angular.extend @, loc

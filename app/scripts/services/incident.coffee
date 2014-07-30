'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.Incident
 # @description
 # # Incident
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'Incident', ($window, rx, userLocation) ->
    class Incident
      constructor: (data) ->
        angular.extend @, data
        @setPoints()

      getColour: ->
        switch @properties.alertLevel
          when 'Advice' then '#2472e5'
          when 'Watch and Act' then '#f88225'
          when 'Emergency Warning' then '#d30910'
          else '#cccccc' # 'Not Applicable'

      # Look in @geometry.geometries for Points
      setPoints: ->
        rx.Observable
          .fromArray @geometry.geometries
          .filter (g) -> g.type is 'Point'
          .map (p) -> p.coordinates
          .toArray()
          .subscribe (points) =>
            @points = points
            @lat    = points[0][1]
            @lng    = points[0][0]
            @setDistanceFromUser()

      # Sets the distance from the user in metres
      setDistanceFromUser: ->
        @distanceFromUser = null
        return unless @lat and @lng and userLocation?.coords?

        @distanceFromUser = $window.geolib.getDistance userLocation.coords, latitude: @lat, longitude: @lng

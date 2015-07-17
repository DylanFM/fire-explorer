'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.Incident
 # @description
 # # Incident
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'Incident', ($window, userLocation) ->
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
        # If we're working on a geometry collection
        if @geometry.geometries? and _.isArray(@geometry.geometries)
          $window.Rx.Observable.fromArray(@geometry.geometries)
            .filter (g) -> g.type is 'Point'
            .map (p) -> p.coordinates
            .toArray()
            .subscribe (points) => @addPoints(points)
        else
          # There's just a point - no collection here
          if @geometry.type is 'Point'
            @addPoints [@geometry.coordinates]

      addPoints: (points) ->
        @points = points
        @lat    = points[0][1]
        @lng    = points[0][0]
        @setDistanceFromUser()

      # Returns any (multi)polygon geometries
      getPolygons: ->
        $window.Rx.Observable
          .fromArray @geometry.geometries
          .filter (g) -> g.type is 'MultiPolygon'
          .toArray()

      # Sets the distance from the user in metres
      setDistanceFromUser: ->
        return unless @lat and @lng and userLocation?.coords?

        @distanceFromUser = $window.geolib.getDistance userLocation.coords, latitude: @lat, longitude: @lng

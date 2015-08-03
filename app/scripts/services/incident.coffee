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

      # Avoid issues where sometimes we have a collection and sometimes a single geometry
      getGeometries: ->
        switch @geometry.type
          when 'GeometryCollection'
            $window.Rx.Observable.fromArray @geometry.geometries
          else
            $window.Rx.Observable.fromArray [@geometry]

      # Look in @geometry.geometries for Points
      setPoints: ->
        @getGeometries()
          .filter (g) -> g.type is 'Point'
          .map (p) -> p.coordinates
          .toArray()
          .subscribe (points) =>
            return unless points?.length
            @points = points
            @lat    = points[0][1]
            @lng    = points[0][0]
            @setDistanceFromUser()

      # Returns any (multi)polygon geometries
      getPolygons: ->
        @getGeometries()
          .filter (g) -> g.type is 'MultiPolygon' or g.type is 'Polygon'
          .toArray()

      # Sets the distance from the user in metres
      setDistanceFromUser: ->
        return unless @lat and @lng and userLocation?.coords?

        @distanceFromUser = $window.geolib.getDistance userLocation.coords, latitude: @lat, longitude: @lng

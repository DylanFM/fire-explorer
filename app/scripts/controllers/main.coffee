'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, $http, leafletData, leafletBoundsHelpers) ->
    # Config leaflet for mapbox
    angular.extend $scope,
      defaults:
        tileLayer: 'https://{s}.tiles.mapbox.com/v3/fires.id6de826/{z}/{x}/{y}.png'
      center: {}
      bounds: leafletBoundsHelpers.createBoundsFromArray([
        [-37.50505999800001, 140.999474528]
        [-28.157019914000017, 159.109219008]
      ])

    getColour = (level) ->
      switch level
        when 'Advice' then '#2472e5'
        when 'Watch and Act' then '#f88225'
        when 'Emergency Warning' then '#d30910'
        else '#cccccc' # 'Not Applicable'

    # Get the map so we can work on it rather than through the directive
    # NOTE Maybe it's better to just ditch the leaflet directive?
    leafletData.getMap().then (map) ->
      # Load data
      $http.get('http://localhost:3000/1.0/incidents').success (data, status) ->
        incidents = L.geoJson data,
          pointToLayer: (incident, latlng) ->
            L.marker latlng,
              title: incident.properties.title
              alt: incident.properties.title
              icon: L.mapbox.marker.icon
                'marker-size': 'large'
                'marker-symbol': 'fire-station'
                'marker-color': getColour(incident.properties.alertLevel)

        incidents.addTo map

'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, $http, leafletBoundsHelpers) ->
    # Config leaflet for mapbox
    angular.extend $scope,
      defaults:
        tileLayer: 'https://{s}.tiles.mapbox.com/v3/fires.id6de826/{z}/{x}/{y}.png'
        attributionControl: false
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

    # Load data
    $http.get('http://api.bushfir.es/1.0/incidents').success (data, status) ->
      angular.extend $scope,
        geojson:
          data: data
          pointToLayer: (incident, latlng) ->
            L.marker latlng,
              title: incident.properties.title
              alt: incident.properties.title
              icon: L.MakiMarkers.icon
                'size': 'large'
                'icon': 'fire-station'
                'color': getColour(incident.properties.alertLevel)

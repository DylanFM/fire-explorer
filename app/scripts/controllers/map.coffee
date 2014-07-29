'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MapCtrl
 # @description
 # # MapCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MapCtrl', ($scope, $compile, leafletBoundsHelpers) ->

    # Setup the map
    angular.extend $scope,

      defaults:
        tileLayer: 'https://{s}.tiles.mapbox.com/v3/fires.id6de826/{z}/{x}/{y}.png'
        attributionControl: false
      center: {}
      bounds: leafletBoundsHelpers.createBoundsFromArray([
        [-37.50505999800001, 140.999474528]
        [-28.157019914000017, 159.109219008]
      ])

      geojson:
        data: $scope.incidents
        style: (incident) ->
          color: incident.getColour()
        pointToLayer: (incident, latlng) ->
          L.marker latlng,
            title: incident.properties.title
            alt: incident.properties.title
            icon: L.MakiMarkers.icon
              'size': 'large'
              'icon': 'fire-station'
              'color': incident.getColour()
        onEachFeature: (incident, layer) ->
          pu = '<div popup/>'
          layer.bindPopup pu,
            incident: incident
            minWidth: 320
            closeButton: false
            className: 'incidentPopup'

    # When a popup opens
    $scope.$on 'leafletDirectiveMap.popupopen', (event, leafletEvent) ->
      incident = leafletEvent.leafletEvent.popup.options.incident

      newScope = $scope.$new()
      newScope.incident = incident

      $compile(leafletEvent.leafletEvent.popup._contentNode)(newScope)

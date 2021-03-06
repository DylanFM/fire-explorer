'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MapCtrl
 # @description
 # # MapCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MapCtrl', ($scope, $compile, leafletData, leafletBoundsHelpers) ->

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

    # Work with layers manually rather than through directive
    leafletData.getMap().then (map) ->

      # Iterate through the incidents
      for incident in $scope.incidents
        # We may have a point to add a marker to
        if incident.points?.length
          point = incident.points[0] # NOTE just using first point, assuming it is there too
          latlng = L.latLng point[1], point[0]

          # Add the incident marker with popup
          marker = L.marker latlng,
            title: incident.properties.title
            alt: incident.properties.title
            icon: L.MakiMarkers.icon
              'size': 'large'
              'icon': 'fire-station'
              'color': incident.getColour()

        # Add any multi-polygons
        polyLayer = L.geoJson()
        incident.getPolygons().subscribe (polygons) ->
          return unless polygons.length
          polyLayer.addData(polygon) for polygon in polygons

        # Create a group for these items
        group = L.featureGroup []
        group.addLayer marker if marker
        group.addLayer polyLayer if polyLayer.getLayers().length

        # Setup popup
        pu = '<div popup/>'
        group.bindPopup pu,
          incident: incident
          minWidth: 320
          closeButton: false
          className: 'incidentPopup'

        # Add group to map
        group.addTo map

    # When a popup opens
    $scope.$on 'leafletDirectiveMap.popupopen', (event, leafletEvent) ->
      incident = leafletEvent.leafletEvent.popup.options.incident

      newScope = $scope.$new()
      newScope.incident = incident

      $compile(leafletEvent.leafletEvent.popup._contentNode)(newScope)

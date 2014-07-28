'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, $http, $compile, leafletBoundsHelpers, geolocation, FireApi) ->
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

    # Returns a style hash for a given incident
    # http://leafletjs.com/reference.html#path-stroke
    styleForIncident = (incident) ->
      # Stroke and fill colours
      { color: getColour(incident.properties.alertLevel) }

    # Attempt to fetch the user's location
    geolocation.getLocation().then (loc) ->
      $scope.location = loc

    # Work with current incidents
    FireApi.getCurrentIncidents().then (result) ->
      incidents = result.data
      angular.extend $scope,
        geojson:
          data: incidents
          style: styleForIncident
          pointToLayer: (incident, latlng) ->
            L.marker latlng,
              title: incident.properties.title
              alt: incident.properties.title
              icon: L.MakiMarkers.icon
                'size': 'large'
                'icon': 'fire-station'
                'color': getColour(incident.properties.alertLevel)
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

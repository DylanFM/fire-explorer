'use strict'

###*
 # @ngdoc directive
 # @name fireExplorerApp.directive:popup
 # @description
 # # popup
###
angular.module('fireExplorerApp')
  .directive 'popup', ($window) ->
    templateUrl: '/views/popup.html'
    link: (scope) ->
      # Get the incident's (first) point
      points = _.where scope.incident.geometry.geometries, type: 'Point'
      if points.length
        scope.point =
          latitude:  points[0].coordinates[1]
          longitude: points[0].coordinates[0]

'use strict'

###*
 # @ngdoc directive
 # @name fireExplorerApp.directive:distanceFrom
 # @description
 # # distanceFrom
###
angular.module('fireExplorerApp')
  .directive 'distanceFrom', ($window) ->
    template: '<span class="distanceFrom"></span>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.$watch 'point', (point) ->
        return unless scope.location?
        distance = $window.geolib.getDistance scope.location.coords, point
        element.text "#{distance/1000}km"

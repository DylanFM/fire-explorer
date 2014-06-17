'use strict'

###*
 # @ngdoc directive
 # @name fireExplorerApp.directive:distanceFrom
 # @description
 # # distanceFrom
###
angular.module('fireExplorerApp')
  .directive 'distanceFrom', ->
    template: '<span class="distanceFrom"></span>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.$watch 'location', (val) ->
        element.text "#{val.coords.latitude},#{val.coords.longitude}"

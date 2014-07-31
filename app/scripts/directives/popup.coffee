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
      scope.point = latitude:  scope.incident.lat, longitude: scope.incident.lng

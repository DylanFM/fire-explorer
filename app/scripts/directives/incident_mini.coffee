'use strict'

###*
 # @ngdoc directive
 # @name fireExplorerApp.directive:incidentMini
 # @description
 # # incidentMini
###
angular.module('fireExplorerApp')
  .directive 'incidentMini', ->
    templateUrl: '/views/incident_mini.html'
    restrict: 'E'

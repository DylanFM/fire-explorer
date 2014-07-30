'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:DetailCtrl
 # @description
 # # DetailCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'DetailCtrl', ($scope, $routeParams, rx) ->
    rx.Observable
      .fromArray($scope.incidents)
      .find (incident) -> incident.id is $routeParams.incidentId
      .subscribe (incident) ->
        $scope.incident = incident

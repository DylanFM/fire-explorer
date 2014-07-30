'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:DetailCtrl
 # @description
 # # DetailCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'DetailCtrl', ($scope, $routeParams) ->
    # Use the incidents stream
    $scope.fireApi.incidents
      # Find by matching id
      .find (incident) -> incident.id is $routeParams.incidentId
      .subscribe (incident) ->
        # Store match on scope
        $scope.incident = incident

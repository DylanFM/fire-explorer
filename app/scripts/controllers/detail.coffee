'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:DetailCtrl
 # @description
 # # DetailCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'DetailCtrl', ($scope, $routeParams, $timeout) ->
    # Use the incidents stream
    $scope.fireApi.incidents
      # Find by matching id
      .find (incident) -> incident.id is $routeParams.incidentId
      .subscribe (incident) ->
        # Store match on scope
        $scope.incident = incident
        # Fetch incident's reports
        $scope.reports = []
        $scope.fireApi.fetchReportsForIncident(incident.id)
          .subscribe (report) ->
            # Add to scope
            $timeout -> $scope.reports.unshift(report)

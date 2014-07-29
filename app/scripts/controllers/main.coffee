'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, geolocation, FireApi) ->

    # Attempt to fetch the user's location
    geolocation.getLocation().then (loc) ->
      $scope.location = loc

    # Initialise the incidents collection
    $scope.incidents = []

    fireApi = new FireApi
    # Subscribe to the incidents stream
    fireApi.incidents.subscribe (incident) ->
      # When there's a new incident, append it to the list
      $scope.incidents.push incident

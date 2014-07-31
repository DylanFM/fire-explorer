'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, $filter, $route, userLocation, FireApi) ->

    # Object handling the user's location
    $scope.location = userLocation

    # Used for navigation
    $scope.$route = $route

    # Initialise the incidents collection
    $scope.incidents = []

    # Object handling access to the fire API
    $scope.fireApi = new FireApi

    # Subscribe to the incidents stream
    $scope.fireApi.incidents
      # Transform into a collection
      .toArray()
      .subscribe (incidents) ->
        # Sort them and store on scope
        $scope.incidents = $filter('orderBy') incidents, 'distanceFromUser'

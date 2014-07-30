'use strict'

###*
 # @ngdoc function
 # @name fireExplorerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the fireExplorerApp
###
angular.module('fireExplorerApp')
  .controller 'MainCtrl', ($scope, $filter, userLocation, FireApi) ->

    $scope.location = userLocation

    # Initialise the incidents collection
    $scope.incidents = []

    $scope.fireApi = new FireApi
    # Subscribe to the incidents stream
    $scope.fireApi.incidents
      # Transform into a collection
      .toArray()
      .subscribe (incidents) ->
        # Sort them and store on scope
        $scope.incidents = $filter('orderBy') incidents, 'distanceFromUser'

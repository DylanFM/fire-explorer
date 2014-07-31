'use strict'

###*
 # @ngdoc overview
 # @name fireExplorerApp
 # @description
 # # fireExplorerApp
 #
 # Main module of the application.
###
angular
  .module('fireExplorerApp', [
    'ngCookies'
    'ngRoute'
    'ngSanitize'
    'leaflet-directive'
    'angularMoment'
    'geolocation'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/map',
        templateUrl: '/views/map.html'
        controller: 'MapCtrl'
      .when '/incidents/:incidentId',
        templateUrl: '/views/detail.html'
        controller: 'DetailCtrl'
      .otherwise
        templateUrl: '/views/list.html'
        controller: 'ListCtrl'
    $locationProvider.html5Mode(true)

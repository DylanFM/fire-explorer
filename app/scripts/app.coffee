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
    'rx'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/map',
        templateUrl: 'views/map.html'
        controller: 'MapCtrl'
      .otherwise
        templateUrl: 'views/list.html'
        controller: 'ListCtrl'
    $locationProvider.html5Mode(true)

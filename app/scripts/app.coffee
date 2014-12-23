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
        activetab: 'map'
      .when '/incidents/:incidentId',
        templateUrl: '/views/detail.html'
        controller: 'DetailCtrl'
        activetab: 'detail'
      .otherwise
        templateUrl: '/views/list.html'
        controller: 'ListCtrl'
        activetab: 'list'

'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.fireApi
 # @description
 # # fireApi
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'FireApi', ($http) ->
    class FireApi
      @getCurrentIncidents: -> $http.get('http://api.bushfir.es/1.0/incidents')

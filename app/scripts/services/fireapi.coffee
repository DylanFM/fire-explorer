'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.fireApi
 # @description
 # # fireApi
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'FireApi', ($http, rx) ->
    class FireApi
      constructor: ->
        @fetchIncidents()

      fetchIncidents: ->
        @incidents = rx.Observable
          .fromPromise $http.get('http://api.bushfir.es/1.0/incidents')
          .map (response) -> response.data

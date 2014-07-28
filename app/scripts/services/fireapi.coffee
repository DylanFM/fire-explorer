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
      @getCurrentIncidents: ->
        deferred = $http.get('http://api.bushfir.es/1.0/incidents')

        rx.Observable
          .fromPromise(deferred)
          .map (response) -> response.data

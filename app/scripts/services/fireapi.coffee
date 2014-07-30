'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.fireApi
 # @description
 # # fireApi
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'FireApi', ($http, rx, Incident) ->
    class FireApi
      constructor: ->
        @fetchIncidents()

      fetchIncidents: ->
        # Make a stream for this API request
        @incidents = rx.Observable
          .fromPromise $http.get('http://api.bushfir.es/1.0/incidents')
          .flatMap (response) ->
            # Construct a stream consisting of the array of incidents
            rx.Observable
              .fromArray(response.data.features)
              # Make each an instance of Incident
              .map (data) -> new Incident(data)

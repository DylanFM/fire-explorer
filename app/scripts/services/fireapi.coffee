'use strict'

###*
 # @ngdoc service
 # @name fireExplorerApp.fireApi
 # @description
 # # fireApi
 # Service in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .service 'FireApi', ($http, $window, Incident) ->
    class FireApi
      constructor: ->
        @fetchIncidents()

      fetchIncidents: ->
        # Make a stream for this API request
        @incidents = $window.Rx.Observable
          .fromPromise $http.get('http://api.bushfir.es/1.0/incidents')
          .flatMap (response) ->
            # Construct a stream consisting of the array of incidents
            $window.Rx.Observable
              .fromArray(response.data.features)
              # Make each an instance of Incident
              .map (data) -> new Incident(data)

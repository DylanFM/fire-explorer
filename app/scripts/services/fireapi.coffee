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
      baseUrl: 'http://api.bushfir.es/1.0'
      # baseUrl: 'http://localhost:8000'

      constructor: ->
        @fetchIncidents()

      fetchIncidents: ->
        # Make a stream for this API request
        @incidents = $window.Rx.Observable
          .fromPromise $http.get("#{@baseUrl}/incidents/current")
          .flatMap (response) ->
            # Construct a stream consisting of the array of incidents
            $window.Rx.Observable
              .fromArray(response.data.features)
              # Make each an instance of Incident
              .map (data) -> new Incident(data)

      fetchReportsForIncident: (incidentUuid) ->
        # Wrap in stream
        $window.Rx.Observable
          .fromPromise $http.get("#{@baseUrl}/incidents/#{incidentUuid}/reports")
          .flatMap (response) ->
            # Construct a stream consisting of the array of reports
            $window.Rx.Observable
              .fromArray(response.data.features)
              # Make each an instance of Incident
              # TODO really Incident is the same as a Report class would be at this time
              #      Maybe create an inheritance arrangement here with Report and Incident
              #      For now just reusing the incident class.
              .map (data) -> new Incident(data)

'use strict'

###*
 # @ngdoc filter
 # @name fireExplorerApp.filter:km
 # @function
 # @description
 # # km
 # Filter in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .filter 'km', ->
    (metres) ->
      km = metres/1000
      "#{km.toFixed(2)}km"

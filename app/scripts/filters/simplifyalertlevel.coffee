'use strict'

###*
 # @ngdoc filter
 # @name fireExplorerApp.filter:simplifyAlertLevel
 # @function
 # @description
 # # simplifyAlertLevel
 # Filter in the fireExplorerApp.
###
angular.module('fireExplorerApp')
  .filter 'simplifyAlertLevel', ->
    (input) ->
      switch input
        when 'Advice' then '!'
        when 'Watch and Act' then '!!'
        when 'Emergency Warning' then '!!!'
        else '' # 'Not Applicable'

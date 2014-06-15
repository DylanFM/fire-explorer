'use strict'

###*
 # @ngdoc directive
 # @name fireExplorerApp.directive:popup
 # @description
 # # popup
###
angular.module('fireExplorerApp')
  .directive 'popup', ->
    template: '<div></div>'
    link: (scope, element, attrs) ->
      console.log scope.incident
      element.text scope.incident.title.toUpperCase()

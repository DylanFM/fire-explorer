'use strict';

/**
 * @ngdoc function
 * @name fireExplorerApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the fireExplorerApp
 */
angular.module('fireExplorerApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });

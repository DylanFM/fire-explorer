'use strict';

/**
 * @ngdoc function
 * @name fireExplorerApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the fireExplorerApp
 */
angular.module('fireExplorerApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });

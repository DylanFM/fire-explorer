'use strict'

describe 'Directive: distanceFrom', ->

  # load the directive's module
  beforeEach module 'fireExplorerApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<distance-from></distance-from>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the distanceFrom directive'

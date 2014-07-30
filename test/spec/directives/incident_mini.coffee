'use strict'

describe 'Directive: incidentMini', ->

  # load the directive's module
  beforeEach module 'fireExplorerApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<incident-mini></incident-mini>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the incidentMini directive'

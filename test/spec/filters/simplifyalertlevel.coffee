'use strict'

describe 'Filter: simplifyAlertLevel', ->

  # load the filter's module
  beforeEach module 'fireExplorerApp'

  # initialize a new instance of the filter before each test
  simplifyAlertLevel = {}
  beforeEach inject ($filter) ->
    simplifyAlertLevel = $filter 'simplifyAlertLevel'

  it 'should return the input prefixed with "simplifyAlertLevel filter:"', ->
    text = 'angularjs'
    expect(simplifyAlertLevel text).toBe ('simplifyAlertLevel filter: ' + text)

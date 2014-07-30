'use strict'

describe 'Filter: km', ->

  # load the filter's module
  beforeEach module 'fireExplorerApp'

  # initialize a new instance of the filter before each test
  km = {}
  beforeEach inject ($filter) ->
    km = $filter 'km'

  it 'should return the input prefixed with "km filter:"', ->
    text = 'angularjs'
    expect(km text).toBe ('km filter: ' + text)

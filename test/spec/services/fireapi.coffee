'use strict'

describe 'Service: fireApi', ->

  # load the service's module
  beforeEach module 'fireExplorerApp'

  # instantiate service
  fireApi = {}
  beforeEach inject (_fireApi_) ->
    fireApi = _fireApi_

  it 'should do something', ->
    expect(!!fireApi).toBe true

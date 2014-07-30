'use strict'

describe 'Service: UserLocation', ->

  # load the service's module
  beforeEach module 'fireExplorerApp'

  # instantiate service
  UserLocation = {}
  beforeEach inject (_UserLocation_) ->
    UserLocation = _UserLocation_

  it 'should do something', ->
    expect(!!UserLocation).toBe true

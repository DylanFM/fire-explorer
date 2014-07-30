'use strict'

describe 'Service: Incident', ->

  # load the service's module
  beforeEach module 'fireExplorerApp'

  # instantiate service
  Incident = {}
  beforeEach inject (_Incident_) ->
    Incident = _Incident_

  it 'should do something', ->
    expect(!!Incident).toBe true

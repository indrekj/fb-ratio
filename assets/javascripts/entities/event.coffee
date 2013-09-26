window.Event = class
  @coerce: (rawEvents) ->
    new Event(rawEvent) for rawEvent in rawEvents

  constructor: (rawEvent) ->
    @id   = rawEvent.eid
    @name = rawEvent.name

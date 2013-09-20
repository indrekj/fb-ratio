window.Event = class
  @findByIds: (ids, cb) ->
    FB.api
      method: "fql.query"
      query: "SELECT eid, name FROM event WHERE eid IN (#{ids.join()})"
    , (rawEvents) -> cb(Event.coerce(rawEvents))

  @coerce: (rawEvents) ->
    new Event(rawEvent) for rawEvent in rawEvents

  constructor: (rawEvent) ->
    @id   = rawEvent.eid
    @name = rawEvent.name

  attendees: (cb) ->
    EventMembersCollection.fetchAttending(@id, cb)

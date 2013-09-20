window.EventMembersCollection = class
  @fetchAttending: (eventId, cb) ->
    FB.api
      method: "fql.query"
      query: "SELECT eid, uid FROM event_member WHERE eid = #{eventId} AND rsvp_status = 'attending'"
    , (rawEventMembers) -> cb(new EventMembersCollection(rawEventMembers))

  @upcoming: (cb) ->
    FB.api
      method: "fql.query"
      query: "SELECT eid FROM event_member WHERE uid = me() AND start_time > now()"
    , (rawEventMembers) -> cb(new EventMembersCollection(rawEventMembers))

  constructor: (members) ->
    @members = members

  ids: ->
    ids = []
    for member in @members
      ids.push member.uid
    ids

  eventIds: ->
    ids = []

    for member in @members
      eventId = member.eid
      ids.push(eventId) if $.inArray(eventId, ids) == -1

    ids

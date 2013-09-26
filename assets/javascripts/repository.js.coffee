window.Repository = class
  @upcomingEventsForMe: (cb) ->
    FB.api
      method: "fql.multiquery"
      queries: {
        query1: "SELECT eid FROM event_member WHERE uid = me() AND start_time > now()"
        query2: "SELECT eid, name from event WHERE eid IN (SELECT eid FROM #query1)"
      }
    , (response) -> cb(Event.coerce(response[1].fql_result_set))

  @attendingEventMembers: (eventId, cb) ->
    FB.api
      method: "fql.multiquery"
      queries: {
        query1: "SELECT uid FROM event_member WHERE eid = #{eventId} AND rsvp_status = 'attending'"
        query2: "SELECT uid, sex FROM user WHERE uid IN (SELECT uid FROM #query1)"
      }
    , (response) -> cb(new EventMembersCollection(response[1].fql_result_set))

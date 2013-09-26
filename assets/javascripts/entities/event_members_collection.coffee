window.EventMembersCollection = class
  constructor: (members) ->
    @members = members

  menCount: ->
    count = 0
    for member in @members
      count += 1 if member.sex == "male"
    count

  womenCount: ->
    count = 0
    for member in @members
      count += 1 if member.sex == "female"
    count

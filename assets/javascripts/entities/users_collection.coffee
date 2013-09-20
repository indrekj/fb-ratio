window.UsersCollection = class
  @findByIds: (ids, cb) ->
    FB.api
      method: "fql.query"
      query: "SELECT sex FROM user WHERE uid IN (#{ids.join()})"
    , (rawUsersArray) -> cb(new UsersCollection(rawUsersArray))

  constructor: (users) ->
    @users = users

  menCount: ->
    count = 0
    for user in @users
      count += 1 if user.sex == "male"
    count

  womenCount: ->
    count = 0
    for user in @users
      count += 1 if user.sex == "female"
    count

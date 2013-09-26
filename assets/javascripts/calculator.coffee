jQuery ->
  if window.location.host is "fb-ratio.dev"
    appId = "435168976597606"
  else
    appId = "528278610586005"

  $.ajaxSetup
    cache: true

  $.getScript "//connect.facebook.net/en_UK/all.js", ->
    FB.init
      appId: appId
      channelUrl: "//#{window.location.host}/channel.html"
      status: true

    FB.getLoginStatus (response) ->
      if response.status is "connected"
        initializeLoggedInPage()
      else
        uri = encodeURI(window.location.href)
        window.location = encodeURI("https://www.facebook.com/dialog/oauth?client_id=#{appId}&redirect_uri=#{uri}&response_type=token&scope=user_events")

initializeLoggedInPage = ->
  showEvents()

showEvents = ->
  Repository.upcomingEventsForMe (events) ->
    renderEvent(event) for event in events

renderEvent = (event) ->
  container = $(".dummy.event").clone().removeClass("dummy")
  container.find("h2").html(event.name)
  container.appendTo("#events")

  Repository.attendingEventMembers event.id, (attendees) ->
    container.find(".menCount").html(attendees.menCount())
    container.find(".womenCount").html(attendees.womenCount())

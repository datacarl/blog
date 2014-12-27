ifLoggedIn = (userId, doc) ->
  true  if userId

Posts.allow
  remove: ifLoggedIn

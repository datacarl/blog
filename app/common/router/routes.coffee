Router.map ->
  @route "home",
    path: "/"
    template: "posts"
    waitOn: ->
      Meteor.subscribe "posts"

  @route "post",
    path: "posts/:slug"
    waitOn: ->
      Meteor.subscribe "post", @params.slug

    data: ->
      slug: @params.slug

  @route "new",
    template: "post"
    onBeforeAction: ->
      Session.set "edit", true
      @next()

Router.map ->
  @route "home",
    path: "/"
    template: "posts"
    waitOn: ->
      Meteor.subscribe "posts"

  @route "post",
    path: "posts/:slug"

    #TODO: subscribe to comments here, or have the comments template do that
    #for itself when that feature is released.
    waitOn: ->
      Meteor.subscribe "post", @params.slug

    data: ->
      slug: @params.slug

  @route "new",
    template: "post"

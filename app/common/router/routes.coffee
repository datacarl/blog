Router.map ->
  @route "home",
    path: "/"
    template: "posts"
    waitOn: ->
      Meteor.subscribe "posts"

  @route "post",
    path: "posts/:slug"

    template: "postWrapper"

    #TODO: subscribe to comments here, or have the comments template do that
    #for itself when that feature is released.
    waitOn: ->
      Meteor.subscribe "post", @params.slug

    data: ->
      slug: @params.slug

  @route "editPost",
    path: "posts/:slug/edit"

    template: "postWrapper"

    waitOn: ->
      Meteor.subscribe "post", @params.slug

    data: ->
      slug: @params.slug
      edit: true

  @route "new",
    template: "postWrapper"
    data: ->
      edit: true

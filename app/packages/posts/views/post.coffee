Template.post.events "click #edit": (e, tmpl) ->
  e.preventDefault()
  Session.set "edit", true  if Meteor.userId()
  false

Template.post.helpers
  post: ->
    Posts.findOne slug: @slug

  edit: ->
    Session.get "edit"

Template.editPost.events "click #save": (e, tmpl) ->
  e.preventDefault()
  content = tmpl.find("#content").value
  title = tmpl.find("#title").value
  blogPost =
    title: title
    content: content

  cb = (err, res) ->
    unless err
      Router.go "post",
        slug: res.slug

    return

  if @_id
    Meteor.call "/update/blogPost", @_id, blogPost, cb
  else
    Meteor.call "/insert/blogPost", blogPost, cb
  Session.set "edit", false
  false


Template.post.created = ->
  @edit = new ReactiveVar

  if Router.current().route.getName() is "new"
    @edit.set true

Template.post.events "click #edit": (e, tmpl) ->
  e.preventDefault()
  tmpl.edit.set true

Template.post.helpers
  post: ->
    Posts.findOne slug: @slug

  edit: ->
    Template.instance().edit.get()

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

  # yeah... maybe use a qs for state instead.
  tmpl.view.parentView.parentView.parentView.templateInstance().edit.set false


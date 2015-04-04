Template.postWrapper.helpers
  post: ->
    Posts.findOne slug: @slug

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

Template.postContent.helpers
  width: ->
    "half" if @edit
  showEdit: ->
    parentData = Template.parentData 1
    Meteor.userId() and not parentData.edit

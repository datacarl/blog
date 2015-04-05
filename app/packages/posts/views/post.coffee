Template.postWrapper.onCreated ->
  if @data.edit
    @preview = new ReactiveVar

    this.autorun (c) =>
      slug = @data.slug
      count = Posts.find({slug: slug}).count()

      if count
        @preview.set Posts.findOne(slug:slug)
        c.stop()


Template.postWrapper.helpers
  post: ->
    if @edit
      Template.instance().preview.get()
    else
      Posts.findOne slug: @slug

getPost = (tmpl) ->
  content = tmpl.find("#content").value
  title = tmpl.find("#title").value

  post =
    title: title
    content: content

Template.editPost.events
  "keyup input,textarea": (e, tmpl) ->
    e.stopPropagation()

    post = getPost(tmpl)

    Utils.getParentTemplateByName(tmpl, "Template.postWrapper").preview.set post

  "click #save": (e, tmpl) ->
    e.preventDefault()

    post = getPost(tmpl)

    cb = (err, res) ->
      unless err
        Router.go "post",
          slug: res.slug

      return

    if @_id
      Meteor.call "/update/blogPost", @_id, post, cb
    else
      Meteor.call "/insert/blogPost", post, cb

    Utils.getParentTemplateByName(tmpl, "Template.postWrapper").edit.set false

Template.postContent.helpers
  width: ->
    "half" if @edit
  showEdit: ->
    parentData = Template.parentData 1
    Meteor.userId() and not parentData.edit

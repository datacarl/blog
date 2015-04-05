Template.postWrapper.onCreated ->
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

# Take the current post object and replace values using
# the user's input.
getPost = (post, tmpl) ->
  content = tmpl.find("#content").value
  title = tmpl.find("#title").value

  _.extend post,
    title: title
    content: content

updatePost = _.throttle (_id, draft) ->
    Meteor.call "/update/blogPostDraft", _id, draft
  , 5000

Template.editPost.events
  "keyup input,textarea": (e, tmpl) ->
    e.stopPropagation()

    post = getPost @, tmpl

    Utils.getParentTemplateByName(tmpl, "Template.postWrapper").preview.set post

    updatePost @_id, post.content

  "click #save": (e, tmpl) ->
    e.preventDefault()

    post = getPost @, tmpl

    cb = (err, res) ->
      unless err
        Router.go "post",
          slug: res.slug

      return

    if @_id
      Meteor.call "/update/blogPost", @_id, _.pick(post, 'title', 'content'), cb
    else
      Meteor.call "/insert/blogPost", post, cb

    Utils.getParentTemplateByName(tmpl, "Template.postWrapper").edit.set false

Template.postContent.helpers
  width: ->
    if @edit then "half" else "full"
  showEdit: ->
    parentData = Template.parentData 1
    Meteor.userId() and not parentData.edit

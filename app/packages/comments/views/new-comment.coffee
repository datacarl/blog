Template.newComment.rendered = ->
  # http://www.jacklmoore.com/autosize/
  this.$('textarea').autosize()

Template.newComment.events
  "submit [data-form]": (e, tmpl)->
    e.preventDefault()

    newComment =
      name: tmpl.find('input[type="text"]').value
      text: tmpl.find('textarea').value
      articleId: @articleId

    if @parentId
      newComment.parentId=@parentId

    cb = (err) ->
      # Dont try to clear children's inputs.
      # They will be gone from the DOM already.
      if not err and not @parentId
          tmpl.find('input[type="text"]').value = ''
          tmpl.find('textarea').value = ''

    CommentUtils.getParentTemplateByName(tmpl, 'Template.comments').Comments.insert(newComment, cb)

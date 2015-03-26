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

    CommentUtils.getParentTemplateByName(tmpl, 'Template.comments').Comments.insert newComment

Template.newComment.events
  "submit [data-form]": (e, tmpl)->
    e.preventDefault()

    newComment =
      email: tmpl.find('input[type="email"]').value
      name: tmpl.find('input[type="text"]').value
      text: tmpl.find('textarea').value
      articleId: @articleId

    if @parentId
      newComment.parentId=@parentId

    cb = (err) ->
      unless err
        tmpl.find('input[type="email"]').value = ''
        tmpl.find('input[type="text"]').value = ''
        tmpl.find('textarea').value = ''

    Comments.insert newComment, cb

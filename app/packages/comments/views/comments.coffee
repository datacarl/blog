Template.comments.onCreated ->
  unless @data.child
    name = @data.name or 'comments'
    console.log(CommentsConstructor)
    #@Comments = CommentsConstructor name: name

Template.comments.helpers
  comments: ->
    #Template.instance().Comments.getComments @articleId, @parentId

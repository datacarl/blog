Template.comments.helpers
  comments: ->
    Comments.getComments @articleId, @parentId

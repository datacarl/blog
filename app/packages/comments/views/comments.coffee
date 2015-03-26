Template.comments.onCreated ->
  if @data.child
    parentCommentsView = CommentUtils.getParentViewByName @, 'Template.comments'
    @Comments = parentCommentsView.templateInstance().Comments
  else
    collectionName = @data.collectionName or 'comments'
    @Comments = window.CommentsConstructor collectionName: collectionName
    this.subscribe collectionName, @data.articleId

Template.comments.helpers
  comments: ->
    Template.instance().Comments.getComments @articleId, @parentId

Template.comments.onCreated ->
  if @data.child
    parentCommentsTmpl = CommentUtils.getParentTemplateByName @, 'Template.comments'
    @Comments = parentCommentsTmpl.Comments
  else
    collectionName = @data.collectionName or 'comments'
    @Comments = window.CommentsConstructor collectionName: collectionName
    this.subscribe collectionName, @data.articleId

Template.comments.helpers
  comments: ->
    Template.instance().Comments.getComments @articleId, @parentId

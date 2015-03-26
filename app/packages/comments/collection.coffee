@CommentsConstructor = (options)->
  options = options or {}

  publicationName = collectionName = options.collectionName or 'comments'

  # private
  collection = new Mongo.Collection collectionName

  if Meteor.isServer
    Publish collection, publicationName

  # public
  methods = CommentMethodsConstructor
    collection: collection

  methods

# Defines all the methods for the comments.
CommentMethodsConstructor = (options) ->
  collection = options.collection

  insert = (params, cb) ->
    check params,
      text: Match.Where CommentUtils.nonBlankString
      name: Match.Where CommentUtils.nonBlankString
      articleId: String
      parentId: Match.Optional String

    _.extend params,
      createdAt: new Date

    collection.insert params, cb

  getComments = (articleId, parentId) ->
    if parentId
      collection.find
        articleId:articleId, parentId:parentId
    else
      collection.find
        articleId: articleId
        parentId:
          $exists: false

  insert: insert
  getComments: getComments

@CommentsConstructor = (options)->
  publicationName = collectionName = options.collectionName

  # private
  collection = new Mongo.Collection collectionName

  if Meteor.isServer
    Publish collection, publicationName

  # public
  methods = CommentMethodsConstructor
    collection: collection
    publicationName: publicationName

  methods

# Defines all the methods for the comments.
CommentMethodsConstructor = (options) ->
  collection = options.collection
  publicationName = options.publicationName

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

  subscribe = (articleId) ->
    return Meteor.subscribe publicationName, articleId

  insert: insert
  getComments: getComments
  subscribe: subscribe

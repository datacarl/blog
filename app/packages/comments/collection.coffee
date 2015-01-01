@CommentsConstructor = (options)->
  collectionName = options.collectionName

  # private
  collection = new Meteor.Collection collectionName

  # public
  methods = CommentMethodsConstructor collection: collection

  methods

# Defines all the methods for the comments.
CommentMethodsConstructor = (options) ->
  collection = options.collection

  insert = (params) ->
    check params,
      email: Match.Where(Utils.validateEmail)
      text: Match.Where(Utils.nonBlankString)
      name: Match.Where(Utils.nonBlankString)
      articleId: String
      parentId: Match.Optional(String)

    _.extend params,
      createdAt: new Date

    collection.insert params

  insert: insert

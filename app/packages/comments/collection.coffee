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
    validates = Match.test params,
      email: Match.Where(Utils.validateEmail)
      text: Match.Where(Utils.nonBlankString)

    if validates
      _.extend params,
        createdAt: new Date

      collection.insert params
    else
      throw new Meteor.Error 500, 'invalid params'

  insert: insert

@CommentsConstructor = (options)->
  collectionName = options.collectionName

  # private
  collection = new Meteor.Collection collectionName

  # public
  methods = CommentMethodsConstructor collection: collection

  methods

CommentMethodsConstructor = (options) ->
  collection = options.collection

  insert = (params) ->
    validEmail = Utils.validateEmail params.email
    hasText = Utils.nonBlankString params.text

    if validEmail and hasText
      collection.insert params
    else
      throw new Meteor.Error 500, 'invalid params'

  insert: insert

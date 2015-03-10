@Publish = (collection, publicationName) ->
  #TODO: Add whatever package implements publish
  Meteor.publish publicationName, (articleId) ->
    collection.find articleId: articleId

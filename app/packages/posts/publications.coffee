Meteor.publish "posts", ->
  Posts.find()

Meteor.publish "post", (slug) ->
  check slug, String
  Posts.find slug: slug

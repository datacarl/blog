Meteor.publish "posts", ->
  fields =
    title:1
    summary:1
    slug: 1
    createdAt:1
  Posts.find {},
    fields: fields


Meteor.publish "post", (slug) ->
  check slug, String

  fields =
    title:1
    summary:1
    slug:1
    createdAt:1
    content:1
    draft:1

  Posts.find
    slug: slug
  ,
    fields:fields

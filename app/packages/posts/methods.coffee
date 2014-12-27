Meteor.methods
  "/insert/blogPost": Utils.requireLoggedIn((blogPost) ->
    check blogPost,
      title: String
      content: String

    id = Posts.insert(blogPost)
    slug: Posts.findOne(id).slug
  )
  "/update/blogPost": Utils.requireLoggedIn((id, blogPost) ->
    check id, String
    check blogPost,
      title: String
      content: String

    Posts.update id,
      $set: blogPost

    slug: Posts.findOne(id).slug
  )

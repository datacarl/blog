Meteor.methods({
  '/insert/blogPost': Utils.requireLoggedIn(function(blogPost) {
    check(blogPost, {
      title: String,
      content: String,
    });

    var id = Posts.insert(blogPost);

    return {
      slug: Posts.findOne(id).slug
    }
  }),
  '/update/blogPost': Utils.requireLoggedIn(function(id, blogPost) {
    check(id, String)
    check(blogPost, {
      title: String,
      content: String
    });

    Posts.update(id, {$set: blogPost});

    return {
      slug: Posts.findOne(id).slug
    }
  }),
})

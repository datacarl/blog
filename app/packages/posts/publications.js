Meteor.publish('posts', function() {
  return Posts.find();
});

Meteor.publish('post', function(slug) {
  check(slug, String)
  return Posts.find({slug: slug});
});
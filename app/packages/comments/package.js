Package.describe({
  summary: "Comments",
  version: "0.0.1"
});

Npm.depends({
  sinon: "1.9.0"
})

var both = ["client", "server"];

Package.onUse(function(api) {
  // shared
  api.use("coffeescript", both);
  api.use("livedata", both);
  api.use("mongo", both);
  api.use("minimongo", both);
  api.use("underscore", both);

  api.addFiles([
    'utils.coffee',
    'collection.coffee',
  ], both)

  api.export('CommentsConstructor', both)

  // client
  api.use("ui", "client");
  api.use("templating", "client");

  api.addFiles([
    'views/comment.html',
    'views/comment.coffee',
    'views/comments.html',
    'views/comments.coffee',
    'views/new-comment.html',
    'views/new-comment.coffee',
  ], 'client')

  // server
  api.export('CommentMethodsConstructor', both, {testOnly: true})
});

Package.onTest(function(api) {
  api.use("tinytest", both);
  api.use("coffeescript", both);
  api.use("comments", both);

   api.addFiles([
     'tests/insert.coffee'
   ], both)
});

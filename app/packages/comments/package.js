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
  api.use("fourseven:scss@1.0.0", both);

  api.addFiles([
    'utils.coffee',
    'collection.coffee',
    'publish.coffee',
  ], both)

  api.export('CommentsConstructor', both)

  // client
  api.use("ui", "client");
  api.use("templating", "client");
  api.use("mrt:moment@2.8.1", "client");
  api.use("copleykj:jquery-autosize", "client");
  api.use("reactive-var", "client");

  api.addFiles([
    'collection.coffee',
    'views/comment.html',
    'views/comment.coffee',
    'views/comments.html',
    'views/comments.coffee',
    'views/comments.scss',
    'views/new-comment.html',
    'views/new-comment.coffee',
    'template-helpers.coffee',
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

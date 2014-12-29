Package.describe({
  summary: "Comments",
  version: "0.0.1"
});

Npm.depends({
  sinon: "1.9.0"
})

var both = ["client", "server"];

Package.onUse(function(api) {
  api.use("ui", "client");
  api.use("templating", "client");
  api.use("coffeescript", both);
  api.use("livedata", both);
  api.use("mongo", both);
  api.use("minimongo", 'server');
  api.use("underscore", both);

  api.export('CommentMethodsConstructor', 'server', {testOnly: true})

  api.addFiles([
    'utils.coffee',
    'collection.coffee',
  ], both)
});

Package.onTest(function(api) {
  api.use("tinytest", 'server');
  api.use("coffeescript", 'server');
  api.use("comments", 'server');

   api.addFiles([
     'tests/insert.coffee'
   ], 'server')
});

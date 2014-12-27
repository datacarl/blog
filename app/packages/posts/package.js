Package.describe({
  summary: "Simple posts system, e.g. for a blog."
});

Package.on_use(function(api) {
  var both;
  both = ["client", "server"];

  api.add_files("utils.coffee", both);

  api.use("ui", "client");
  api.use("coffeescript", both);
  api.use("templating", "client");
  api.use("underscore", both);

  api.add_files([
    "views/post.html",
    "views/post.coffee",
    "views/posts.html",
    "views/posts.coffee",
    "views/post-list-item.html"
  ], "client");

  api.add_files("collection.coffee", both);
  api.add_files("schema.coffee", "server");
  api.add_files("methods.coffee", both);
  api.add_files("allow-deny.coffee", "server");
  api.add_files("publications.coffee", "server");
});


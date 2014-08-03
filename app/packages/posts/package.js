Package.describe({
  summary: 'Simple posts system, e.g. for a blog.'
})


Package.on_use(function(api) {
  var both = ['client', 'server'];

  // utils
  api.add_files('utils.js', both)

  api.use('ui', 'client')
  api.use('templating', 'client')

  // views
  api.add_files([
    'views/post.html',
    'views/post.js',
    'views/posts.html',
    'views/posts.js',
    'views/post-list-item.html',

  ], 'client');

  api.add_files('collection.js', both)
  api.add_files('schema.js', 'server')

  api.add_files('methods.js', both)
  api.add_files('allow-deny.js', 'server')

  api.add_files('publications.js', 'server')

  api.use('underscore', both)
});

Package.describe({
  name: 'spinkit',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'Wrapper around a Spinkit spinner by Tobias Ahlin',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.4.2');
  api.use("templating", "client");
  api.addFiles('spinner.html');
  api.addFiles('spinner.css');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('spinner');
});

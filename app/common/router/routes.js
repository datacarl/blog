Router.map(function() {
  this.route('home', {
    path: '/',

    template: 'posts',

    waitOn: function() {
      return Meteor.subscribe('posts');
    },
  })

  this.route('post', {
    path: 'posts/:slug',

    waitOn: function() {
      return Meteor.subscribe('post', this.params.slug);
    },

    data: function() {
      return {
        slug: this.params.slug
      }
    }
  })

  this.route('new', {
    template: 'post',

    onBeforeAction: function() {
      Session.set('edit', true)
    }
  });
})

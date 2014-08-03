Template.post.events({
  'click #edit': function(e, tmpl) {
    e.preventDefault();
    if (Meteor.userId()) {
      Session.set('edit', true);
    }
    return false;
  },
});

Template.post.helpers({
  post: function() {
    return Posts.findOne({slug: this.slug})
  },
  edit: function() {
    return Session.get('edit');
  }
});

Template.editPost.events({
  'click #save': function(e, tmpl) {
    e.preventDefault();
    var content = tmpl.find('#content').value,
        title = tmpl.find('#title').value;

    var blogPost = {title: title, content: content};

    var cb = function(err, res) {
      if (!err) {
        Router.go('post', {slug: res.slug})
      }
    }

    if (this._id) {
      Meteor.call('/update/blogPost', this._id, blogPost, cb)
    } else {
      Meteor.call('/insert/blogPost', blogPost, cb)
    }

    Session.set('edit', false);
    return false;
  }
})


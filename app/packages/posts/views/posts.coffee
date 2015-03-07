Template.posts.helpers posts: ->
  Posts.find {}, {sort: {createdAt: -1}}


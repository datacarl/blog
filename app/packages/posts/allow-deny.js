var ifLoggedIn = function(userId, doc) {
  if (userId) return true;
}

Posts.allow({
  remove: ifLoggedIn
});

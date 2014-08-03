Utils = {
  requireLoggedIn: function(cb) {
    return function() {
      if (!this.userId) {
        if (this.stop)
          this.stop();
        else
          throw new Meteor.Error('403');
      } else {
        return cb.apply(this, arguments)
      }
    }
  },
  // From http://dense13.com/blog/2009/05/03/converting-string-to-slug-javascript/
  stringToSlug: function(str) {
    str = str.replace(/^\s+|\s+$/g, ''); // trim
    str = str.toLowerCase();

    // remove accents, swap ñ for n, etc
    var from = "àáäâèéëêìíïîòóöôùúüûñç·/_,:;";
    var to   = "aaaaeeeeiiiioooouuuunc------";
    for (var i=0, l=from.length ; i<l ; i++) {
      str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
    }

    str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
      .replace(/\s+/g, '-') // collapse whitespace and replace by -
      .replace(/-+/g, '-'); // collapse dashes

    return str;
  }
}

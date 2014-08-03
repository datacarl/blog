var schema = {
  title: {
    type: String,
  },
  summary: {
    type: String,
    autoValue: function() {
      var content = this.field('content');
      if (content.isSet) {
        return content.value.substring(0, 1200)
      }
    }
  },
  slug: {
    type: String,
    unique: true,
    autoValue: function() {
      var title = this.field('title');
      if (title.isSet) {
        return Utils.stringToSlug(title.value);
      }
    }
  },
  createdAt: {
    type: Date,
    autoValue: function() {
     if (this.isInsert) {
        return new Date;
      } else if (this.isUpsert) {
        return {$setOnInsert: new Date};
      }
    }
  },
  content: {
    type: String,
  },
}

Posts.attachSchema(schema);

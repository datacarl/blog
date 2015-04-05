schema =
  title:
    type: String

  summary:
    type: String
    autoValue: ->
      content = @field("content")
      content.value.substring 0, 1200  if content.isSet

  slug:
    type: String
    unique: true
    autoValue: ->
      title = @field("title")
      Utils.stringToSlug title.value  if title.isSet

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date
      else $setOnInsert: new Date  if @isUpsert

  content:
    type: String

  draft:
    type: String

Posts.attachSchema schema

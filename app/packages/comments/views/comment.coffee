Template.comment.created = ->
  this.showReplyField = new ReactiveVar

Template.comment.events
  "click [data-reply]": (e, tmpl) ->
    e.stopPropagation()
    currentState = tmpl.showReplyField.get()
    tmpl.showReplyField.set !currentState

  # Hide reply form when it's submitted (event propagates from
  # the newComment template). If the form # validation fails
  # it will throw an error and not propagate.
  #
  # TODO: This only work for validation errors, improve to handle
  # connection errors etc.
  "submit [data-form]": (e, tmpl)->
    tmpl.showReplyField.set false

Template.comment.helpers
  reply: ->
    Template.instance().showReplyField.get()

@CommentUtils =
  validateEmail: (email) ->
    # http://stackoverflow.com/a/46181/11236
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    _.isString(email) and re.test email

  nonEmptyString: (x) ->
    _.isString(x) and x.length > 0

  # Ensure the string isn't entirely made up of whitespace.
  nonBlankString: (x) ->
    CommentUtils.nonEmptyString(x) and !/^\s*$/.test(x)

  getParentViewByName: (childTmpl, parentViewName) ->
    currentView = childTmpl.view.parentView

    unless currentView?
      return undefined

    while currentView.name isnt parentViewName
      parent = currentView.parentView
      if parent
        currentView = parent
      else
        return

    currentView

  getParentTemplateByName: (childTmpl, parentViewName) ->
    view = CommentUtils.getParentViewByName childTmpl, parentViewName

    view.templateInstance() if view?

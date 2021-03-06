@Utils =
  requireLoggedIn: (cb) ->
    ->
      unless @userId
        if @stop
          @stop()
        else
          throw new Meteor.Error("403")
      else
        cb.apply this, arguments


  # From http://dense13.com/blog/2009/05/03/converting-string-to-slug-javascript/
  stringToSlug: (str) ->
    str = str.replace(/^\s+|\s+$/g, "") # trim
    str = str.toLowerCase()

    # remove accents, swap ñ for n, etc
    from = "àáäâèéëêìíïîòóöôùúüûñç·/_,:;"
    to = "aaaaeeeeiiiioooouuuunc------"
    i = 0
    l = from.length

    while i < l
      str = str.replace(new RegExp(from.charAt(i), "g"), to.charAt(i))
      i++
    # remove invalid chars
    # collapse whitespace and replace by -
    str = str.replace(/[^a-z0-9 -]/g, "").replace(/\s+/g, "-").replace(/-+/g, "-") # collapse dashes
    str

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
    view = Utils.getParentViewByName childTmpl, parentViewName

    view.templateInstance() if view?

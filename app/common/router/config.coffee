Router.configure
  layoutTemplate: "layout"
  onBeforeAction: [
    "loading"
    "dataNotFound"
  ]
  loadingTemplate: "spinner"
  notFoundTemplate: "notFound"


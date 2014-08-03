Router.configure({
  layoutTemplate: 'layout',

  onBeforeAction: ['loading', 'dataNotFound'],

  loadingTemplate: 'loading',

  notFoundTemplate: 'notFound',
});

sinon = Npm.require 'sinon'

Tinytest.add 'Should accept email, text and name', (test) ->
  collectionMock =
    insert: sinon.spy()

  methods = CommentMethodsConstructor
    collection: collectionMock

  params =
    email: "carl@littke.io"
    text: 'Some text'
    name: 'Carl Littke'

  methods.insert params

  test.isTrue collectionMock.insert.calledWith(params)

Tinytest.add 'should throw if missing param', (test) ->
  collectionMock =
    insert: sinon.spy()

  methods = CommentMethodsConstructor
    collection: collectionMock

  params =
    text: 'Some text'
    name: 'Carl Littke'

  # test.throws can take a function that takes arguments, so wrap the
  # function we want to test in another function and pass it to the test.
  test.throws ->
    methods.insert(params)

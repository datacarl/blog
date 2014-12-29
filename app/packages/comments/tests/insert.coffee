sinon = Npm.require 'sinon'

Tinytest.add 'should have author email', (test) ->
  collectionMock =
    insert: sinon.spy()

  methods = CommentMethodsConstructor
    collection: collectionMock

  params =
    email: "carl@littke.io"
    text: 'Some text'

  methods.insert params

  test.isTrue collectionMock.insert.calledWith(params)

Tinytest.add 'should throw if missing author email', (test) ->
  collectionMock =
    insert: sinon.spy()

  methods = CommentMethodsConstructor
    collection: collectionMock

  params =
    text: 'Some text'

  # test.throws can take a function that takes arguments, so wrap the
  # function we want to test in another function and pass it to the test.
  test.throws ->
    methods.insert(params)

Accounts.config
  forbidClientAccountCreation: true,

email = 'carl.littke@gmail.com'
admin = Meteor.users.findOne('emails.address': email)

unless admin
  Accounts.createUser
    email: email
    password: 'admin'

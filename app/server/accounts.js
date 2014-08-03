Accounts.config({
  forbidClientAccountCreation: true,
});

var email = 'carl.littke@gmail.com';
var admin = Meteor.users.findOne({'emails.address': email});

if (!admin) {
  Accounts.createUser({
    email: email,
    password: 'admin'
  })
}

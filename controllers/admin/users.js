var express = require('express');
var expressValidator = require('express-validator'); //Declare Express-Validator
var user =  require('../../model/admin/user');


/* method: home
  @desc: to check the users is login or not if login then redirect to Dashboard otherwise login page
 */
module.exports.home = function(req, res, next) {
  if(req.session.userLogin == true){
    res.render('admin/dashboard', { title: 'Super Admin Dashboard' });
  }else {
    res.render('admin/index', { title: 'Login', mobileErrorMessage: req.flash('mobileErrorMessage') });
  }
};

/* method: login  @desc: for users login */
module.exports.login = function(req, res, next){
  //res.render('user/index', { title: 'Login' });
  //res.send(req.flash());
  res.redirect('/users');
};
/* method: usersList, @desc: Display the list of users */
module.exports.usersList = function(req, res, next){
  if(req.session.userLogin == true){
    res.render('admin/users-list', { title: 'Users List'});
  }else {
    res.render('admin/index', { title: 'Login' });
  }
};

/* method: userRegistration, @desc: user registration method */
module.exports.userRegistration = function(req, res, next){
  // if(req.body.mobile == ""){
  //   req.flash('mobileErrorMessage', 'Mobile number can not be left blank !');
  //   res.redirect('/users');
  // }
  //req.assert('mobile', 'Mobile is required').notEmpty();
  // var errors = req.validationErrors();
  // if( !errors){   //No errors were found.  Passed Validation!
  //   res.redirect('/users');
  // }
  // else {   //Display errors to user
  //   res.render('users/index', {
  //       title: 'Login',
  //       message: '',
  //       errors: errors
  //   });
  //   }
  res.send("calling.....");
};

/* method: userLogin, @desc: pass the username and password as a parameter into a method to check user is valid or not */
module.exports.userLogin = function(req, res, next){
  var username = req.body.username;
  var password = req.body.password;
  user.userAuthentication(username, password).then(function(rows) {
    console.log("Rows length = ", rows.length);
    if(rows.length > 0){
      req.session.userLogin = true ;
      req.session.userName = rows[0].fullname
      console.log(rows);
      res.render('admin/dashboard', { title: 'Dashboard' });
    }
    else{
      res.redirect('/users');
    }
  }).catch((err) => setImmediate(() => { throw err; }));
};

/* method: userlogout, @desc:  */
module.exports.logout = function(req, res, next){
  req.session.destroy(function(err){
      if(err) throw(err);
      res.redirect('/users');
  });
};

/* method: dashboard, @method: users dashboard */
module.exports.dashboard = function(req, res, next){
  if(req.session.userLogin == true){
    res.render('admin/dashboard');
  }
  else {
    res.redirect('/');
  }
};

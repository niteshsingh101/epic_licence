var express = require('express');
var expressValidator = require('express-validator'); //Declare Express-Validator
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');
var user =  require('../../model/admin/user');

/* method: home
  @desc: to check the users is login or not if login then redirect to Dashboard otherwise login page
 */
module.exports.home = function(req, res, next) {
  if(req.session.userLogin == true){
    res.render('admin/dashboard', { title: 'Super Admin Dashboard' });
  }else {
    user.userRole().then(function(roles){
      res.render('admin/index', { title: 'Login',userRole: roles,  mobileErrorMessage: req.flash('mobileErrorMessage'), emailErrorMessage: req.flash('emailErrorMessage'),
      passwordErrorMessage: req.flash('passwordErrorMessage'), confirmPasswordErrorMessage: req.flash('confirmPasswordErrorMessage'), userEmailErrorMessage: req.flash('userEmailErrorMessage'),
    wrongPasswordMsg: req.flash('wrongPasswordMsg'), errorMessage: req.flash('errorMessage') });
    }).catch((err) => setImmediate(() => { throw err; }));
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
  if(req.body.mobile == ""){
    req.flash('mobileErrorMessage', 'Mobile number can not be left blank !');
    res.redirect('/users');
  }
  else if (req.body.email == "") {
    req.flash('emailErrorMessage', 'Email can not be left blank !');
    res.redirect('/users');
  }
  else if (req.body.password == "") {
    req.flash('passwordErrorMessage', 'Password can not be left blank !');
    res.redirect('/users');
  }
  else if (req.body.cnf_password != req.body.password) {
    req.flash('confirmPasswordErrorMessage', 'Password is not matching with confirm password !');
    res.redirect('/users');
  }
  else if (req.body.userType == "") {
    req.flash('errorMessage', 'Select user type !');
    res.redirect('/users');
  }
  else {
    user.isUsernameTaken(req.body.email).then(function(rows){
      if(rows.length > 0){
        req.flash('userEmailErrorMessage', 'Duplicate Email id !');
        res.redirect('/users');
      }
      else {
        user.userRegistration(req.body.email, req.body.mobile, req.body.cnf_password, req.body.userType).then(function(result){
          if(result){
            req.session.userLogin = true ;
            console.log(result);
            res.redirect('/users');
          }
        }).catch((err) => setImmediate(() => { throw err; }));
      }
    }).catch((err) => setImmediate(() => { throw err; }));

  }
};

/* method: userLogin, @desc: pass the username and password as a parameter into a method to check user is valid or not */
module.exports.userLogin = function(req, res, next){
  var username = req.body.username;
  var password = req.body.password;
  user.userAuthentication(username).then(function(rows) {
    if(password == cryptr.decrypt(rows[0].password)){
      req.session.userLogin = true ;
      //req.session.userName = rows[0].fullname
      console.log(rows);
      res.render('admin/dashboard', { title: 'Dashboard' });
    }
    else{
      req.flash('wrongPasswordMsg', 'Wrong password !');
      res.redirect('/users');
    }
  }).catch((err) => setImmediate(() => {
     //throw err;
     req.flash('wrongPasswordMsg', 'Wrong user Email !');
     res.redirect('/users');
   }));
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

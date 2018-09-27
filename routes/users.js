var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var session = require('express-session');
var passport = require('passport');
expressValidator = require('express-validator'); //Declare Express-Validator
var db = require('../model/db');
var user =  require('../model/admin/user');

/* GET users dashboard */
router.get('/', function(req, res, next) {
  if(req.session.userLogin == true){
    res.render('user/dashboard');
  }
  else {
    res.render('user/index', { title: 'Login', mobileErrorMessage: req.flash('mobileErrorMessage') });
  }
});
/* Login page */
router.get('/login', function(req, res, next){
  //res.render('user/index', { title: 'Login' });
  //res.send(req.flash());
  res.redirect('/users');
});

/* Get user list */
router.get('/users-list',function(req, res, next){
  if(req.session.userLogin == true){
    res.render('user/users-list', { title: 'Users List'});
  }
  else {
    res.render('user/index', { title: 'Login' });
  }
});
/* Check user credential */
router.post('/', function(req, res, next){
  var username = req.body.username;
  var password = req.body.password;
  //var userLogin = user.userAuthentication(username, password );
  user.userAuthentication(username, password).then(function(rows) {
      console.log(rows[0].fullname);
      if(rows){
        req.session.userLogin = true ;
        req.session.userName = rows[0].fullname
        console.log(req.session.userLogin);
        res.render('user/dashboard', { title: 'Dashboard' });
      }
      else{
        res.redirect('/');
      }
  }).catch((err) => setImmediate(() => { throw err; }));
  //console.log(userLogin);

});

// logut

router.get('/logout', function(req, res, next){
  req.session.destroy(function(err){
      if(err) throw(err);
      res.redirect('/users');
  });
});
router.post('/user-registration/', function(req, res, next){
  // if(req.body.mobile == ""){
  //   req.flash('mobileErrorMessage', 'Mobile number can not be left blank !');
  //   res.redirect('/users');
  // }
  req.assert('mobile', 'Mobile is required').notEmpty();
  var errors = req.validationErrors();
  if( !errors){   //No errors were found.  Passed Validation!
    res.redirect('/users');
  }
  else {   //Display errors to user
    res.render('users/index', {
        title: 'Login',
        message: '',
        errors: errors
    });
    }
});
/* Dashboard start */

router.get('/dashboard', function(req, res, next){
  if(req.session.userLogin == true){
    res.render('user/dashboard');
  }
  else {
    res.redirect('/');
  }
});

/* facebook routing */

router.get('/auth/facebook', passport.authenticate('facebook'));

router.get('/auth/facebook/callback',
 passport.authenticate('facebook', { successRedirect: '/users', failureRedirect: '/login' }));

/* Dashboard End  */

module.exports = router;

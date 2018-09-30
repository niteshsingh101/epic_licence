var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var session = require('express-session');
var passport = require('passport');
var expressValidator = require('express-validator'); //Declare Express-Validator
var db = require('../model/db');
var user =  require('../model/admin/user');
var users = require('../controllers/admin/users');

/* GET users dashboard */
router.get('/', users.home );
/* Login page */
router.get('/login', users.login);
/* Get user list */
router.get('/users-list', users.usersList);
// logut
router.get('/logout', users.logout);
/* Dashboard start */
router.get('/dashboard', users.dashboard);

/* Post method routing */
//User registration
router.post('/user-registration/', users.userRegistration);
/* Check user credential */
router.post('/', users.userLogin);
/* facebook routing */

router.get('/auth/facebook', passport.authenticate('facebook'));

router.get('/auth/facebook/callback',
 passport.authenticate('facebook', { successRedirect: '/users', failureRedirect: '/login' }));


module.exports = router;

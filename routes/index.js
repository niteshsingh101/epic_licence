var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var session = require('express-session');
var Promise = require('promise');
var db = require('../model/db');
var user =  require('../model/admin/user');

/* GET home page. */
router.get('/', function(req, res, next) {
  console.log("login successfully");
  console.log(req.user);
  //console.log(user['emails']);
  res.render('index', { title: 'Home' });
});


module.exports = router;

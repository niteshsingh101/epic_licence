var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mysql = require('mysql');
var session = require('express-session');
var Promise = require('promise');
var passport = require('passport');
var FacebookStrategy = require('passport-facebook').Strategy;
var flash = require('req-flash');
var expressValidator = require('express-validator'); //Declare Express-Validator
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

//var app = express();

//facebook Login
passport.use(new FacebookStrategy({
    clientID: '470492040101696',
    clientSecret: 'ca551629b399216a888bf6841214bd25',
    callbackURL: "http://localhost:3000/users/auth/facebook/callback"
  },
  function(accessToken, refreshToken, profile, done) {

    return done(null, profile);
  }
));

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(user, done) {
  done(null, user);
});

// session setup

//app.use(session({ secret: 'keyboard cat', resave: false, saveUninitialized: true }))
var app = express();
app.use(express.static(path.join(__dirname, 'public')));
app.use(require('cookie-parser')());
app.use(require('body-parser').urlencoded({ extended: true }));
app.use(require('express-session')({
  secret: 'keyboard cat',
  resave: true,
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
//app.use(expressValidator);  //required for Express-Validator

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//app.use(logger('dev'));
//app.use(express.json());
//app.use(express.urlencoded({ extended: true }));
//app.use(cookieParser());
//app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

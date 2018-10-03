var mysql = require('mysql');
var db = require('../db');
var Promise = require('promise');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');
/* Login Model */
function userAuthentication(username, password)
{
  var encryptedPassword = cryptr.encrypt(password);
  console.log("encryptedPassword", encryptedPassword);
    return new Promise(function(resolve, reject) {
        db.query("Select * from system_users where email = '"+username+"'", function (err, rows, fields) {
            if (err) {
                return reject(err); // Call reject on error states
            }
            resolve(rows); // call resolve with results
        });
    });
}
/* User Registration */
function userRegistration(email, mobile, password){
  var encryptedString = cryptr.encrypt(password);
    return new Promise(function(resolve, reject){
    db.query("insert into system_users (email, password, verification_status, status) VALUES ('"+email+"','"+ encryptedString+"', '0', '0')", function(err, result){
      if (err) {
        return reject(err);
      }
      resolve(result);
    });
  });
//const decryptedString = cryptr.decrypt(encryptedString);
}
/* Username validations Model */
function isUsernameTaken(username)
{
    return new Promise(function(resolve, reject) {
        db.query("Select * from system_users where email = '"+username+"'", function (err, rows, fields) {
            if (err) {
                return reject(err); // Call reject on error states
            }
            resolve(rows); // call resolve with results
        });
    });
}
/* Fetch userType from user_role table */
function userRole(){
  return new Promise(function(resolve, reject){
    db.query("Select * from user_role where id !=1", function(err, rows, fields){
      if(err){
        return reject(err);
      }
      resolve(rows);

    });
  });
};
/////////////////////////////////////////////////////////////
module.exports = {
  userAuthentication : userAuthentication,
  userRegistration : userRegistration,
  isUsernameTaken : isUsernameTaken,
  userRole  : userRole

}

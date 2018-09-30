var mysql = require('mysql');
var db = require('../db');
var Promise = require('promise');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');
/* Login Model */
function userAuthentication(username, password)
{
    return new Promise(function(resolve, reject) {
        db.query("Select * from system_users where email = '"+username+"' AND password = '"+password+"'", function (err, rows, fields) {
            // Call reject on error states,
            // call resolve with results
            if (err) {
                return reject(err);
            }
            resolve(rows);
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

/////////////////////////////////////////////////////////////
module.exports = {
  userAuthentication : userAuthentication,
  userRegistration : userRegistration

}

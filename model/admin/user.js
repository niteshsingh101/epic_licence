var mysql = require('mysql');
var db = require('../db');
var Promise = require('promise');
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

/////////////////////////////////////////////////////////////
module.exports = {
  userAuthentication : userAuthentication
}

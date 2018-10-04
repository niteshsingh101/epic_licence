var assert = require('chai').assert ;
var user =  require('../model/admin/user');

describe('User', function(){
  it('User role should return object', function(){
      let userRole  = user.userRole();
      assert.isObject(userRole, 'user role is an object');
  });
  it('User login should return object', function(){
    let userLogin = user.userAuthentication('niteshsingh1d01@gmail.com', 'Trial@1234');
    console.log(userLogin);
    assert.isObject(userLogin, 'retun object after successfull login is an object');
  });
});

var assert = require('chai').assert;
var user =  require('../../../model/admin/user');

describe('User', function(){
  it('User role should return an array', function(){
      return user.userRole().then(function(userRoles){
        assert.isNotEmpty(userRoles);
        assert.isArray(userRoles, 'user role is an array');
      });
  });
  it('User login should return object', function(){
    return user.userAuthentication('niteshsingh101@gmail.com').then(function(data){
      assert.isNotEmpty(data);
      assert.isArray(data, 'user record should be an array of object');
    });
  });
  it('user email for registration should return empty', function(){
    return user.isUsernameTaken('niteshsingh1101@gmail.com').then(function(userName){
      assert.isEmpty(userName, 'user should not be a duplicate')
    });
  });

});

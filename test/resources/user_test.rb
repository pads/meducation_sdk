require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../resource_test', __FILE__)

module MeducationAPI
  class UserTest < ResourceTest
    test_resource(User, '/users')
  end
end



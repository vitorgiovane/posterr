require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @new_user = User.new
  end

  test 'should be exists user model' do
    assert Object.const_defined?('User'), "User model don't exists yet"
  end

  test 'should not save user without a username' do
    assert_not @new_user.save, 'Saved the user without a username'
  end

  test 'should not save user with more than 14 characters in username' do
    @new_user.username = 'loremipsumdolor'
    assert_not @new_user.save, 'Saved the user with more then 14 characters in the username'
  end

  test 'should not save user with username format invalid' do
    @new_user.username = 'Vitor Giovane'
    assert_not @new_user.save, 'Saved the user with username format invalid'
  end

  test 'should save user with username valid format' do
    @new_user.username = 'vitorgiovane'
    assert @new_user.save, 'Failed to save the user with valida format username'
  end
end

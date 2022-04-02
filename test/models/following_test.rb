require "test_helper"

class FollowingTest < ActiveSupport::TestCase
  setup do
    @new_following = Following.new
  end

  test 'should create follow' do
    @new_following.follower_user = users(:three)
    @new_following.followed_user = users(:four)

    assert @new_following.save, "Don't created following"
  end

  test 'should not create a duplicated follow' do
    @new_following.follower_user = users(:one)
    @new_following.followed_user = users(:two)
    assert_not @new_following.save, "Created a duplicated following"
  end

  test 'should not be able to follow himself' do
    @new_following.follower_user = users(:three)
    @new_following.followed_user = users(:three)

    assert_not @new_following.save, "The user follow himself"
  end
end

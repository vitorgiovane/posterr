require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create a following' do
    post "/api/v1/users/#{users(:four).id}/follow"

    followed_user_id = response.parsed_body['followed_user_id']

    assert_response :success
    assert_equal users(:four).id, followed_user_id, 'Failed to create a following'
  end

  test 'should not create a following when try follow himself' do
    post "/api/v1/users/#{users(:three).id}/follow"

    expected_response_message = 'The user cannot follow himself'
    received_response_message = response.parsed_body['errors'].first

    bad_request_status_code = 400
    assert_response bad_request_status_code
    assert_equal expected_response_message, received_response_message, 'Created a following when try follow himself'
  end

  test 'should unfollow user' do
    post "/api/v1/users/#{users(:four).id}/follow"
    delete "/api/v1/users/#{users(:four).id}/unfollow"

    expected_response_message = 'The user has been unfollowed'
    received_response_message = response.parsed_body['message']

    assert_response :success
    assert_equal expected_response_message, received_response_message, 'Failed to unfollow user'
  end

  test 'should not unfollow a user that is not followed' do
    delete "/api/v1/users/#{users(:four).id}/unfollow"

    bad_request_status_code = 400
    assert_response bad_request_status_code
  end

  test 'should exists show user data endpoint' do
    get "/api/v1/users/#{users(:two).id}"

    assert_response :success
  end

  test 'should user data endpoint return correct data' do
    get "/api/v1/users/#{users(:two).id}"

    expected_attributes_keys = [
      :username,
      :date_joined_posterr,
      :number_of_followers,
      :number_of_followings,
      :number_of_posts_created,
      :followed_by_the_current_user
    ]

    assert response_contains_the_attributes_keys(response.parsed_body, expected_attributes_keys)
  end

  private

  def response_contains_the_attributes_keys(response, attributes_keys)
    attributes_keys.all?(&response.symbolize_keys.method(:key?))
  end
end

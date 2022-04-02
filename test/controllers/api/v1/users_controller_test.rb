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

    puts response.parsed_body['errors'].inspect

    expected_response_message = 'The user cannot follow himself'
    received_response_message = response.parsed_body['errors'].first

    bad_request_status_code = 400
    assert_response bad_request_status_code
    assert_equal expected_response_message, received_response_message, 'Created a following when try follow himself'
  end
end

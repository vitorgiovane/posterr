require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create a following' do
    post "/api/v1/users/#{users(:four).id}/follow"

    assert_response :success
    # assert_equal post_content, response.parsed_body['content']
  end
end

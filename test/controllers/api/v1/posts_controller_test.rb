require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get a list of posts" do
    get '/api/v1/posts'
    
    expected_first_post_content = 'Mauris id elit est. Fusce eget ornare leo, sit amet molestie nulla.'

    assert_response :success
    assert_equal expected_first_post_content, response.parsed_body.first['content']
  end
end

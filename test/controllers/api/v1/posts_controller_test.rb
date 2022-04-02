require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get a list of posts' do
    get '/api/v1/posts'
    
    expected_first_post_content = 'Mauris id elit est. Fusce eget ornare leo, sit amet molestie nulla.'

    assert_response :success
    assert_equal expected_first_post_content, response.parsed_body.first['content']
  end

  test 'should create a post' do
    post_content = 'Lorem ipsum...'
    post '/api/v1/posts', params: { content: post_content }

    assert_response :success
    assert_equal post_content, response.parsed_body['content']
  end

  test 'should not create a post when parent_id is invalid' do
    post '/api/v1/posts', params: { content: 'Lorem ipsum...', parent_id: 999 }

    assert_response 400
  end
end

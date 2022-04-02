require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get a list of posts' do
    get base_path
    
    expected_first_post_content = 'Mauris id elit est. Fusce eget ornare leo, sit amet molestie nulla.'

    assert_response :success
    assert_equal expected_first_post_content, response.parsed_body.first['content']
  end

  test 'should create a post' do
    post_content = 'Lorem ipsum...'
    post base_path, params: { content: post_content }

    assert_response :success
    assert_equal post_content, response.parsed_body['content']
  end

  test 'should not create a post when parent_id is invalid' do
    nonexistent_post_id = 999
    post base_path, params: { content: 'Lorem ipsum...', parent_id: nonexistent_post_id }

    bad_request_status_code = 400
    assert_response bad_request_status_code
  end

  test 'should returns only de posts from who is followed by de current user' do
    get "#{base_path}?only_of_the_followed=true"

    expected_number_of_posts = 6

    assert_response :success
    assert_same expected_number_of_posts, response.parsed_body.size, 'Failed to filter posts'
  end

  test 'should returns all posts' do
    get "#{base_path}?only_of_the_followed=false"

    expected_number_of_posts = 10

    assert_response :success
    assert_same expected_number_of_posts, response.parsed_body.size, 'Failed to filter posts'
  end

  private

  def base_path
    '/api/v1/posts'
  end
end

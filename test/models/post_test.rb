require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @new_post = Post.new
    @valid_content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  end
  
  test 'should be exists Post model' do
    assert Object.const_defined?('Post'), "Post model don't exists yet"
  end

  test 'should save post without a content' do
    @new_post.user = users(:one)
    @new_post.parent = posts(:one)
    assert @new_post.save, "Don't saved the post without a content"
  end

  test 'should save post with blank content and is a repost' do
    @new_post.content = ''
    @new_post.user = users(:one)
    @new_post.parent = posts(:one)
    assert @new_post.save, "Don't Saved the post with blank content"
  end

  test 'should save post with a valid content' do
    @new_post.content = @valid_content
    @new_post.user = users(:one)
    assert @new_post.save, "Don't saved the post with a valid content"
  end

  test 'should not save post with more than 777 characters in content' do
    invalid_content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id pretium
      libero. Quisque pellentesque suscipit enim ut semper. Fusce eget sem aliquet, convallis dui
      et, rutrum magna. Donec eget iaculis purus. Phasellus faucibus, neque sit amet viverra
      efficitur, ante tortor sagittis massa, et interdum ipsum velit nec arcu. Sed ullamcorper felis
      sem, nec condimentum purus tempor accumsan. Nullam sit amet fringilla ipsum. Morbi libero
      tortor, tempor at vestibulum sed, porttitor at ante. Morbi id dui vel lectus imperdiet.
      Integer quis faucibus nisi. Nulla tincidunt ornare nunc finibus congue. Etiam tempus erat
      porta ornare luctus. Duis dictum dolor a elit interdum varius. Curabitur eu sapien et lacus
      rutrum aliquam. Phasellus ultricies sit amet nisl a scelerisque. Aenean dignissim dui sed nunc
      feugiat efficitur ut vitae odio.'
    @new_post.content = invalid_content
    @new_post.user = users(:one)
    assert_not @new_post.save, 'Saved the post with more then 777 characters in the content'
  end

  test 'should not save post without user_id' do
    @new_post.content = @valid_content
    assert_not @new_post.save, 'Saved the post without user_id'
  end

  test 'should save post with valid content and valid user' do
    @new_post.content = @valid_content
    @new_post.user = users(:one)
    assert @new_post.save, "Don't saved the post with valid content and user"
  end

  test 'should not save a post without a content when is not a repost' do
    @new_post.user = users(:one)
    assert_not @new_post.save, 'Saved post without content when is not a respost'
  end
end

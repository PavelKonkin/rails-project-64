require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    sign_in users(:one)
    @comment = post_comments(:one)
  end
  
  test "should create comment with valid attributes" do
    assert_difference('PostComment.count') do
      post post_comments_path @post, params: { post_comment: { post_id: @post.id, content: @comment.content } }
    end
    assert_redirected_to post_url(@post)
  end

  test "should not create comment with invalid attributes" do
    assert_no_difference('PostComment.count') do
      post post_comments_path @post, params: { post_comment: { post_id: @post.id, content: '' } }
    end
    assert_redirected_to post_url(@post)
  end

  test "should create reply with valid attributes" do
    assert_difference('PostComment.count') do
      post post_comments_path @post, params: { post_comment: { post_id: @post.id, content: @comment.content, parent: @comment } }
    end
    assert_redirected_to post_url(@post)
  end

  test "should not create reply with invalid attributes" do
    assert_no_difference('PostComment.count') do
      post post_comments_path @post, params: { post_comment: { post_id: @post.id, content: '',  parent: @comment} }
    end
    assert_redirected_to post_url(@post)
  end
end

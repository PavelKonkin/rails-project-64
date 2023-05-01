require "test_helper"

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @like = post_likes(:one)
    @user = users(:one)
    sign_in users(:one)
  end
  
  test "should create like with valid attributes" do
    assert_difference('PostLike.count') do
      post post_likes_path @post, params: { post_like: { post_id: @post.id, user_id: @user.id } }
    end
    assert_redirected_to post_url(@post)
  end

  test "should delete like" do
    assert_difference('PostLike.count', difference = -1) do
      delete post_like_path @post, @like
    end
    assert_redirected_to post_url(@post)
  end
end

# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @like = post_likes(:one)
    @user = users(:one)
  end

  test 'should create like with valid attributes' do
    post post_likes_path @post, params: { post_id: @post.id, user_id: @user.id }
    assert_instance_of(PostLike, PostLike.find_by(post_id: @post.id, user_id: @user.id))
    assert_redirected_to post_url(@post)
  end

  test 'should delete like' do
    delete post_like_path @post, @like
    assert_not_instance_of(PostLike, PostLike.find_by(post_id: @post.id, user_id: @user.id))
    assert_redirected_to post_url(@post)
  end
end

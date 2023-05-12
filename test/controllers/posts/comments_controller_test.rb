# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @user = users(:one)
    @comment = post_comments(:one)
    @valid_params = { post_id: @post.id, content: 'You shall pass', user_id: @user.id }
    @invalid_params = { content: 'Nope' }
  end

  test 'should create comment with valid attributes' do
    post post_comments_path @post, params: { post_comment: @valid_params }
    assert_instance_of(PostComment, PostComment.find_by(content: @valid_params[:content]))
    assert_redirected_to post_url(@post)
  end

  test 'should not create comment with invalid attributes' do
    post post_comments_path @post, params: { post_comment: @invalid_params }
    assert_not_instance_of(PostComment, PostComment.find_by(content: @invalid_params[:content]))
    assert_redirected_to post_url(@post)
  end

  test 'should create reply with valid attributes' do
    post post_comments_path @post, params: { post_comment: @valid_params.merge({ parent: @comment }) }
    assert_instance_of(PostComment, PostComment.find_by(content: @valid_params[:content]))
    assert_redirected_to post_url(@post)
  end

  test 'should not create reply with invalid attributes' do
    post post_comments_path @post, params: { post_comment: @invalid_params.merge({ parent: @comment }) }
    assert_not_instance_of(PostComment, PostComment.find_by(content: @invalid_params[:content]))
    assert_redirected_to post_url(@post)
  end
end

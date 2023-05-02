# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(likes_params)
    @like.save
    redirect_to post_url @post
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy if @like.user_id == current_user.id
    redirect_to post_url @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def likes_params
    params.permit(:post_id, :user_id)
  end
end

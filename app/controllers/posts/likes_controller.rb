# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.post_likes.build(user_id: current_user.id)
    @like.save
    redirect_to post_url @post
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_to post_url @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def likes_params
    params.require(:post_like).permit(:user_id)
  end
end

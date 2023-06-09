# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post, :authenticate_user!

  def create
    @already_liked = @post.likes.exists?(user_id: current_user.id)
    @like = @post.likes.build(user_id: current_user.id) unless @already_liked
    @like&.save
    redirect_to post_url @post
  end

  def destroy
    @like = @post.likes.find_by(user_id: current_user.id)
    @like&.destroy
    redirect_to post_url @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

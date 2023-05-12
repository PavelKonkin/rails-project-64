# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.build(comment_params)
    @post_comment.user = current_user
    if @post_comment.save
      redirect_to post_url(@post), notice: t('.created')
    else
      redirect_to post_url(@post), alert: t('.create_error')
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end

# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, :authenticate_user!

  def new
    @post_comment = @post.comments.build
  end

  def create
    @post_comment = @post.comments.build(comment_params)
    @post_comment.user = current_user
    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post_url(@post), notice: t('.created') }
      else
        format.html { redirect_to post_url(@post), alert: t('.create_error') }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end

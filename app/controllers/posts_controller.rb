# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @post_comment = @post.comments.build
    @post_comments = @post.comments.arrange
    @post_likes_count = @post.likes.count
    @current_user_like = @post.likes.find_by(user_id: current_user.id) if current_user
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    process_save_update(-> { @post.save }, '.created', :new)
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    process_save_update(-> { @post.update(post_params) }, '.updated', :edit)
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_url, notice: t('.post_destroyed')
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def process_save_update(method, success_notice, fail_action)
    if method.call
      redirect_to post_url(@post), notice: t(success_notice)
    else
      render fail_action, status: :unprocessable_entity
    end
  end
end

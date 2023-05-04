# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
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
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    process_save_update(-> { @post.save }, '.created', :new, :created)
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    process_save_update(-> { @post.update(post_params) }, '.updated', :edit, :ok)
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: t('.post_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def process_save_update(method, success_notice, fail_action, success_status)
    respond_to do |format|
      if method.call
        format.html { redirect_to post_url(@post), notice: t(success_notice) }
        format.json { render :show, status: success_status, location: @post }
      else
        format.html { render fail_action, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
end

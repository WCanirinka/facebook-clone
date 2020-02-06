# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "You've posted successfully!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @self_n_friends = current_user.friends.pluck(:id) << current_user.id
    @posts = Post.where(user_id: @self_n_friends)
    @logged_in = user_signed_in?
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

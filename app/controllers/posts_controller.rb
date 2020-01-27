# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
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
    @posts = Post.all
    @logged_in = user_signed_in?
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

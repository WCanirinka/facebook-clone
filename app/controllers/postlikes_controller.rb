# frozen_string_literal: true

class PostlikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.postlike(post)
    redirect_to post_path(post)
  end

  def destroy
    post = Postlike.find(params[:id]).post
    current_user.postunlike(post)
    redirect_to post_path(post)
  end
end

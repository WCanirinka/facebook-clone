# frozen_string_literal: true

class CommentlikesController < ApplicationController
  def create
    comment = Comment.find(params[:comment_id])
    current_user.commentlike(comment)
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Commentlike.find(params[:id]).comment
    current_user.commentunlike(comment)
    redirect_to post_path(comment.post)
  end
end

class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:content).merge(user: current_user))
        if @comment.save
          flash[:success] = "You've commented successfully!"
          redirect_to post_path(@post)
        else
          flash[:error] = "Comment failed !"
          redirect_to root_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end
end

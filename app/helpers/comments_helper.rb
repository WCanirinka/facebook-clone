module CommentsHelper
    def comment_user_name(comment)
        comment.user.first_name if @logged_in
    end
    
    def create_comment_link
        link_to 'Create Comment', new_comment_path if user_signed_in?
    end
end

# frozen_string_literal: true

module PostsHelper
  def post_user_name(post)
    post.user.first_name if @logged_in
  end

  def create_post_link
    link_to 'Create Post', new_post_path if user_signed_in?
  end
end

class CommentsController < ApplicationController
  def create  
    post = Post.find(params[:post_id])
    @comment=Comment.new(comment_params)
    current_user.comments<<@comment
    post.comments<<@comment

    redirect_to post
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
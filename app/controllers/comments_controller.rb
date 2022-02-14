class CommentsController < ApplicationController
    before_action :authenticate_user! 
    

    def create 
        @comment = @commentable.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to user_url(id: @commentable.user_id), notice: "Comment posted!"
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end


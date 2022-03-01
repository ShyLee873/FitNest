class CommentsController < ApplicationController
    before_action :authenticate_user! 
    

    def create 
        if params[:event_id]
            @commentable = Event.find(params[:event_id])
        end
        @comment = @commentable.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        flash[:success] = "Comment posted!"
        redirect_back(fallback_location: root_path)
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


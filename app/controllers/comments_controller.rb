class CommentsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy]


    def index
        @comments = Comment.all
    end
    
    def show
    end

    def new
        @post = Post.find(params[:post_id])
        @user_id = params[:user_id]
        @comment = @post.comments.create(comment_params)
        redirect_to user_url(id: @comment.user_id)
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def create
        @user_id = params[:comment][:post_id]
        @comment = Comment.new(comment_params)
        respond_to do |format|
            if @comment.save
              format.html { redirect_to user_url(id: @comment.user_id), notice: "Comment saved" }
              format.json { render :show, status: :created, location: @comment}
            else
              format.html {render :new, status: :unprocessable_entity }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    def update 
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            @user_id = params[:user_id]
            format.html { redirect_to user_url(id: @comment.user_id), notice: "Comment was successfully updated." }
            format.json { render :show, status: :ok, location: @comment }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
        redirect_to @post
    end

    def destroy
        @comment = Comment.find(params[:id])
        @user_id = @comment.user_id
        @comment.destroy
        redirect_to user_url(id: @user_id)
    end

    private
        def comment_params
            params.require(:comment).permit(:user_id, :content,)
        end

        def set_post
            @post = Post.find(params[:post_id])
        end

end
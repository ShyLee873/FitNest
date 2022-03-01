class PostsController < ApplicationController

  # before_action :require_authentication
  before_action :set_user_group, except: [:show, :index]
  before_action :set_post, only: %i[ edit update destroy ]
  before_action :authorize_post!, except: [:new, :create, :show]
  after_action :verify_authorized

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    authorize(@post)
  end

  # GET /posts/new
  def new
    @post = @user_group.posts.new
    authorize(@post)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @user_group.posts.new(post_params)
    authorize(@post)
    respond_to do |format|
      if @post.save
        if @post.postable_type == "User"
          format.html { redirect_to user_url(id: @post.postable_id), notice: "Post was successfully created." }
        else
          format.html { redirect_to group_url(id: @post.postable_id), notice: "Post was successfully created." }
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      if @post.postable_type == "User"
        format.html { redirect_to user_url(id: @post.postable_id), notice: "Post was successfully destroyed." }
      else 
        format.html { redirect_to group_url(id: @post.postable_id), notice: "Post was successfully destroyed." }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_group
      if params[:user_id]
        @user_group = User.find(params[:user_id])
      else
        @user_group = Group.find(params[:group_id])
      end
    end

    def set_post
      @post = @user_group.posts.find(params[:id])
    end

    def authorize_post!
      authorize(@post || Post)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end

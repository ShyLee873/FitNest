class PostsController < ApplicationController

  # before_action :require_authentication
  before_action :set_user, except: [:show]
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
    @post = @user.posts.new
    authorize(@post)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @user.posts.new(post_params)
    authorize(@post)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_url(id: @post.user_id), notice: "Post was successfully created." }
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
      format.html { redirect_to user_url(id: @post.user_id), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = @user.posts.find(params[:id])
    end

    def authorize_post!
      authorize(@post)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end

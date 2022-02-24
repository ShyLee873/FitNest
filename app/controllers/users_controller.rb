class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authorize_user!
  after_action :verify_authorized
  

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    membership

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        membership
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_membership
    Membership.find_by(user_id: params[:id], group_id: params[:group_id]).destroy
    respond_to do |format|
      format.html { redirect_to user_path(params[:id]), notice: "You are no longer a member of this group." }
      format.json { head :no_content }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :group_id, :avatar, :about_me)
    end

    #Setting scope for membership reference
    def membership
      if @user.group_id.present?
        @membership = Membership.create(group_id: @user.group_id, user_id: @user.id)
      end
    end

    def avatar
      @user.avatar.attach(params[:avatar])
    end

    def catch_not_found(error)
      Rails.logger.debug("Oops! We had a 'not found exception.' Redirecting to index.")
      flash.alert = error.to_s
      redirect_to users_path
    end

    def authorize_user!
      authorize(@user || User)
    end


end

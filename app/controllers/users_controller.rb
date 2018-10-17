class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:auth]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :logged_in_user, :only => [:signup, :create]
  load_and_authorize_resource
  skip_authorization_check :only => [:signup,:create,:new]

  def login
    render :layout => "empty"
  end

  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to controller: 'users', action: 'login' }
    end
  end

  def signup
    render :layout => "empty"

    user = User.new
    
  end

  def auth
    

  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # console

    if !logged_in?
      @user = User.new(user_params)

    else
      @user = User.new(user_params)
    end

    respond_to do |format|
      if @user.valid?
        if @user.save
          if logged_in?
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render action: 'show', status: :created, location: @user }
            flash[:success] = "Welcome to App!"
          end
        else
          if logged_in?
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
            flash[:error] = "Error"
          else
            format.html { render action: 'signup', controller: :users, :layout => "empty" }
          end
        end
      else
        format.html { render action: 'signup', controller: :users, :layout => "empty" }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|
      if(!user_params[:password].nil?)
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        @user.username = user_params[:username]
        @user.email = user_params[:email]
        @user.role = user_params[:role]
        if @user.save(:validate => false)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest,:role, :remember_digest, :cost_centre_id, :direktorat_id)
    end
end

class UsersController < ApplicationController

  before_action :require_current_user, except: [:new, :create, :onboard, :activate]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = api_client.get_users_v1.take(25) # only fetch the first 50 users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # Create a user
    user = api_client.create_user(user_params)
    # Update custom attributes
    api_client.set_custom_attribute_to_user(user.id, custom_user_params)
    # Set status to unactivated
    api_client.update_user(user.id, status: 0)

    if api_client.error
      puts api_client.error_description
    end

    redirect_to onboard_path, notice: 'User has been created with status set to unactivated'
  end

  # GET /onboard
  def onboard
  end

  # POST /activate
  def activate
    # Search for a user with this email address
    @user = api_client.get_users_v1(email: user_params[:email]).first

    unless @user && verify_dob && verify_ssn
      return redirect_to onboard_path, notice: "User #{user_params[:email]} was not verified"
    end

    # Update password
    unless api_client.set_password_using_clear_text(@user.id, user_params[:password], user_params[:password])
      return redirect_to onboard_path, notice: "Password update failed. #{api_client.error_description}"
    end

    # Activate user
    api_client.update_user(@user.id, status: 1)

    # Redirect to login page
    redirect_to home_index_path
  end

  # Verify dob and ssn match
  def verify_ssn
    @user.custom_attributes["custom_ssn"].eql? (custom_user_params[:custom_ssn])
  end

  def verify_dob
    @user.custom_attributes["custom_dob"].eql? (custom_user_params[:custom_dob])
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # update the user
    api_client.update_user(params[:id], user_params)

    # update custom attributes
    api_client.set_custom_attribute_to_user(params[:id], custom_user_params)

    respond_to do |format|
      unless api_client.error
        format.html { redirect_to user_path(params[:id]), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = api_client.get_user(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:firstname, :lastname, :email, :phone, :username, :password)
    end

    def custom_user_params
      params.permit(:custom_field, :custom_dob, :custom_ssn)
    end
end

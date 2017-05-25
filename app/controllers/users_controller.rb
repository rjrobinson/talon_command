class UsersController < ApplicationController

  before_action :ensure_profile_exists, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    if @user.update(user_params)
      render :show, flash: {notice: 'User Updated'}
    else
      render :show, flash: {notice: 'There was an error.'}
    end
  end

  private

  def ensure_profile_exists
    user = User.find(params[:id])
    if user && user.profile.nil?
      Profile.create(user_id: user.id)
    end
  end

  def user_params
    params[:admin] = true if params[:admin] == '1' && current_user.admin?
    params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :admin
    )
  end
end
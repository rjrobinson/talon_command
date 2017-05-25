class UsersController < ApplicationController

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

  def user_params
    params.require(:user).permit(
        :first_name,
        :last_name,
        :email
    )
  end
end
class ProfilesController < ApplicationController
  
  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user

    if @profile.update(profile_params)
      redirect_to user_path(@user), flash: {notice: 'Updated'}
    end
  end

  private

  def profile_params
    params.require(:profile).permit!
  end
end
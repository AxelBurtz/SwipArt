class UserExhibitionsController < ApplicationController
  def edit
    @user_exhibitions = UserExhibition.find(params[:id])
  end

  def update
    @user_exhibitions = UserExhibition.find(params[:id])
    @user_exhibitions.update(user_exhibitions_params)
    redirect_to dashboard_path
  end



  private

  def user_exhibitions_params
    params.require(:user_exhibitions).permit(:status)
  end
end

class UserExhibitionsController < ApplicationController

  def edit
    @user_exhibitions = UserExhibition.find(params[:id])
  end

  def update
    @user_exhibitions = UserExhibition.find(params[:id])
    @user_exhibitions.update(user_exhibitions_params)
    redirect_to dashboard_path
  end

  def saved
    @exhibition = Exhibition.find(params[:exhibition_id])
    @user_exhibition = UserExhibition.create(user: current_user, exhibition: @exhibition, status: "saved")
    redirect_to dashboard_path
  end

  def discard
    @exhibition = Exhibition.find(params[:exhibition_id])
    @user_exhibition = UserExhibition.create(user: current_user, exhibition: @exhibition, status: "discarded")
    redirect_to dashboard_path
  end

private

  def user_exhibitions_params
    params.require(:user_exhibitions).permit(:status)
  end
end

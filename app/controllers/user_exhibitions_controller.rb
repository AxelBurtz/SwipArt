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
    user_exhibition = UserExhibition.find_or_create_by(user: current_user, exhibition: @exhibition)
    if user_exhibition.status == "saved"
      user_exhibition.update(status: nil)
    else
      user_exhibition.update(status: "saved")
    end
    redirect_to dashboard_path
  end

  def discard
    @exhibition = Exhibition.find(params[:exhibition_id])
    # @user_exhibition = UserExhibition.find_by(user: current_user, exhibition: @exhibition)
    # if @user_exhibition.nil?
    #   UserExhibition.create(user: current_user, exhibition: @exhibition, status: "discarded")
    # else
    #   @user_exhibition.update(status: "discarded")
    # end
    #refacto in one line
    UserExhibition.find_or_create_by(user: current_user, exhibition: @exhibition).update(status: "discarded")
  redirect_to dashboard_path
  end

  def new
    @exhibition = Exhibition.find(params[:exhibition_id])
    @user_exhibition = UserExhibition.new
  end

  def create
    user = current_user
    exhibition = Exhibition.find(params[:exhibition_id])
    user_exhibition = UserExhibition.find_by(user: user, exhibition: exhibition)
    if user_exhibition.nil?
      UserExhibition.create(user: user, exhibition: exhibition, status: "booked")
    else
      user_exhibition.update(status: "booked")
    end
    redirect_to dashboard_path
  end

  def done
    exhibition = Exhibition.find(params[:exhibition_id])
    user_exhibition = UserExhibition.find_by(user: user, exhibition: exhibition)
  end

private

  def user_exhibitions_params
    params.require(:user_exhibitions).permit(:status)
  end
end

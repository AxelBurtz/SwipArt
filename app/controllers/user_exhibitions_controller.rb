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
    UserExhibition.create(user: current_user, exhibition: @exhibition, status: "saved")
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

  def new_booking
    @exhibition = Exhibition.find(params[:exhibition_id])
    @user_exhibition = UserExhibition.new_booking
  end 
  
  def create_booking
    @exhibition = Exhibition.find(params[:exhibition_id])
    if user_exhibition.nil?
    UserExhibition.find_by(user: current_user, exhibition: @exhibition).update(status: "booked")
    else
      UserExhibition.create(user: current_user, exhibition: @exhibition, status: "booked")
    end 
    # @et_inchallah_ca_marche
    # redirect_to user_exhibitions_saved
  end  

  def booking
    redirect_to dashboard_path    
  end

private

  def user_exhibitions_params
    params.require(:user_exhibitions).permit(:status)
  end
end

class ExhibitionsController < ActionController::Base
  before_action :authenticate_user!

  def show
    @exhibition = Exhibition.find(params[:id])
  end


end

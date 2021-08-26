class ArtworksController < ApplicationController
  def like
    @user = current_user
    @artwork = Artwork.find(params[:id])
    @user.favorite(@artwork)
    # if @user.all_favorites.size % 5 == 0
    #   redirect_to dashboard_path
    # else
    #   # A changer en AJAX pour eviter de recharger
    #   redirect_to root_path
    if @user.all_favorites.size % 5 == 0
      respond_to do |format|
        format.html { redirect_to dashboard_path }         
        format.json { render json: { redirect: true, url: dashboard_path } }
      end
    else
      respond_to do |format|  
        format.html { redirect_to root_path }
        format.json { render json: { redirect: false } }
      end
    end
  end

    # if @user.all_favorites.size % 5 == 0
    #   format.json { render json: { redirect: true, url: dashboard_path } }
    #   # redirect_to dashboard_path
    # else
    #   # A changer en AJAX pour eviter de recharger
    #   # redirect_to root_path
    #   format.json { render json: { redirect: false } }
    # end
    
  # end
  
  def dislike
    @user = current_user
    @artwork = Artwork.find(params[:id])
    @user.unfavorite(@artwork)
    head :no_content
    # redirect_to root_path
  end
end
# if
# format.json { render json: { redirect: true, url: dashboard_path } }
# else
# format.json { render json: { redirect: false } }
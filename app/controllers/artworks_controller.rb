class ArtworksController < ApplicationController
  def like
    @user = current_user
    @artwork = Artwork.find(params[:artwork_id])
    @user.favorite(@artwork)
    if @user.all_favorites.size % 10 == 0
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def dislike
    @user = current_user
    @artwork = Artwork.find(params[:artwork_id])
    @user.unfavorite(@artwork)
    redirect_to root_path
  end
end

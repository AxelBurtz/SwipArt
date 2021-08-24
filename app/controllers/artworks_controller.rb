class ArtworksController < ApplicationController
  def like
    @user = current_user
    @artworks = Artwork.find(params[:id])
    @user.favorite(@artworks)
    redirect_to artworks_show_path
  end

  def dislike
    @user = current_user
    @artworks = Artwork.find(params[:id])
    @user.unfavorite(@artworks)
    redirect_to artworks_show_path
  end
end

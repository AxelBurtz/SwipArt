class ArtworksController < ApplicationController
  def like
    @user = current_user
    @artwork = Artwork.find(params[:id])
    @user.favorite(@artwork)
  end

  def dislike
    @user = current_user
    @artwork = Artwork.find(params[:id])
    @user.unfavorite(@artwork)
  end
end

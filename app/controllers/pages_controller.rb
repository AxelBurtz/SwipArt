class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @artworks = Artwork.includes(:author).where.not(id: current_user.all_favorites.pluck(:favoritable_id))
    else
      @artworks = Artwork.all
    end
  end

  def dashboard
    @all_artworks_liked_id = current_user.all_favorites.pluck(:favoritable_id)
    @all_artworks_liked =  Artwork.where(id: @all_artworks_liked_id)
    @recomandations = current_user.recomandations_to_display
    @user = current_user
  end

  def landing
  end
end

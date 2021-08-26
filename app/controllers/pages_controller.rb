class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @artworks =  Artwork.includes(:author).where.not(id: current_user.all_favorites.pluck(:favoritable_id))
  end

  def dashboard
    @all_artworks_liked_id = current_user.all_favorites.pluck(:favoritable_id)
    @all_artworks_liked =  Artwork.where(id: @all_artworks_liked_id)
  end
end

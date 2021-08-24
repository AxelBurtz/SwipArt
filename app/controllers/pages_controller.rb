class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @artworks = Artwork.all
  end

  def dashboard
    @all_artworks_liked_id = current_user.all_favorites.pluck(:favoritable_id)
    @all_artworks_liked = Artwork.where(id: @all_artworks_liked_id)
    @doublon = Hash.new(0).tap { |h| @all_artworks_liked.each { |v| h[v] +=1 } }
  end
end

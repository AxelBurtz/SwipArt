class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_exhibitions
  has_many :reviews
  acts_as_favoritor

  def recomandations_author
    Artwork.joins(:author).where(id: all_favorites.pluck(:favoritable_id)).group('authors.id').count
  end

  def recomandations_type
    Artwork.joins(:type).where(id: all_favorites.pluck(:favoritable_id)).group('type.id').count
  end

  def recomandations_museum
    Artwork.where(id: all_favorites.pluck(:favoritable_id)).group('museum').count
  end
end

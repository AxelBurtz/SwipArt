class Artwork < ApplicationRecord
  belongs_to :author
  belongs_to :type
  validates :title, :mouvement, presence: true
  has_one_attached :photo
  acts_as_favoritable
end

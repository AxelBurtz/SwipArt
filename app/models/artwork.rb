class Artwork < ApplicationRecord
  belongs_to :author
  belongs_to :type
  has_many :likes
  validates :title, :mouvement, presence: true
end

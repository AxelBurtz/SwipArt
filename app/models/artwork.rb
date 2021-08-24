class Artwork < ApplicationRecord
  belongs_to :author
  belongs_to :type
  validates :title, :mouvement, presence: true
  acts_as_favoritable
end

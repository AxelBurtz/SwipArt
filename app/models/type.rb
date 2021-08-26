class Type < ApplicationRecord
  has_many :artworks
  has_many :exhibition_types
  validates :name, presence: true, uniqueness: true
end

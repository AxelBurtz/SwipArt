class Author < ApplicationRecord
  has_many :artworks
  has_many :exhibition_authors
  validates :name, presence: true, uniqueness: true
end

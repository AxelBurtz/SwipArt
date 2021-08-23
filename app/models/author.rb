class Author < ApplicationRecord
  has_many :artworks
  has_many :exhibition_authors
  validate :name, presence: true
end

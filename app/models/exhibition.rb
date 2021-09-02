class Exhibition < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
  has_many :exhibition_types 
  has_many :types, through: :exhibition_types
end

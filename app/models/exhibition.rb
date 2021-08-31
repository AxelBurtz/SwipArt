class Exhibition < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
end

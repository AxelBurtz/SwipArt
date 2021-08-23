class Artwork < ApplicationRecord
  belongs_to :author
  belongs_to :type
end

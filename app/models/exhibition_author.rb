class ExhibitionAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :exhibition
end

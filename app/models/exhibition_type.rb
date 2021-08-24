class ExhibitionType < ApplicationRecord
  belongs_to :type
  belongs_to :exhibition
end

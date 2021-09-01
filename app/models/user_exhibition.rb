class UserExhibition < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  # scope :done, -> { where("date < ?", Date.today) }
  # scope :to_do, -> { where("date >= ?", Date.today) }
  # after_commit :exhibition_done

  # def exhibition_done
  #   UpdateUserExhibitionAsDoneJob.set(wait_until: date).perform_later(self)
  # end
end

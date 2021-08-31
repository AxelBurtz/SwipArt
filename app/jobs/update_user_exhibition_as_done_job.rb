class UpdateUserExhibitionAsDoneJob < ApplicationJob
  queue_as :default

  def perform(user_exhibition)
    # Do something later
    return unless user_exhibition.status == "booked"
    user_exhibition.update(status: "done")
  end
end

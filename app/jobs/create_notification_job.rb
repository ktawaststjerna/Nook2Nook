class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args[0]
    dodo_code = args[1]
    Notification.create!(
      message: "Dodo Code: #{dodo_code}",
      user_id: user_id
    )
  end
end

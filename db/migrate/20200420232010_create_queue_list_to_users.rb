class CreateQueueListToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :queue_list_to_users, id: :uuid do |t|
      t.uuid :queue_list_id
      t.uuid :user_id

      t.timestamps
    end
  end
end

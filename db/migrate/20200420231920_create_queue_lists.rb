class CreateQueueLists < ActiveRecord::Migration[6.0]
  def change
    create_table :queue_lists, id: :uuid do |t|
      t.integer :max_users
      t.integer :allowed_users
      t.uuid :listing_id

      t.timestamps
    end
  end
end

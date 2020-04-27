class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.text :message
      t.uuid :user_id
      t.boolean :read

      t.timestamps
    end
  end
end

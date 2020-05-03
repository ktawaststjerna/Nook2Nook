class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :island_name
      t.string :character_name
      t.string :email
      t.string :password_digest
      t.string :password_recovery_digest

      t.timestamps
    end
  end
end

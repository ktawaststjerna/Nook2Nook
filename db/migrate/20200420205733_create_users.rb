class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :dodo_code
      t.string :island_name
      t.string :character_name
      t.string :password_digest
      t.string :recovery_password_digest

      t.timestamps
    end
  end
end

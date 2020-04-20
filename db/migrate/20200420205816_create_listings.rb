class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings, id: :uuid do |t|
      t.uuid :user_id
      t.boolean :hosting
      t.boolean :selling

      t.timestamps
    end

    add_index :listings, :user_id
  end
end

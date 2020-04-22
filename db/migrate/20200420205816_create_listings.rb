class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :item_id
      t.boolean :hosting
      t.boolean :selling
      t.integer :amount
      t.integer :amount_minimum
      t.integer :amount_maximum
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end

    add_index :listings, :user_id
    add_index :listings, :item_id
  end
end

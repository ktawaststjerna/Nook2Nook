class CreateJoinListings < ActiveRecord::Migration[6.0]
  def change
    create_table :join_listings, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :item_id
      t.boolean :selling
      t.integer :amount_min
      t.integer :amount_max
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end

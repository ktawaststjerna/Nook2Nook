class CreateHostListings < ActiveRecord::Migration[6.0]
  def change
    create_table :host_listings, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :item_id
      t.string :dodo_code
      t.boolean :selling
      t.integer :amount
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_users
      t.integer :allowed_users

      t.timestamps
    end
  end
end

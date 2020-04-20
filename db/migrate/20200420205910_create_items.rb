class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :uuid do |t|
      t.uuid :listing_id
      t.string :name
      t.integer :price

      t.timestamps
    end

    add_index :items, :listing_id
  end
end

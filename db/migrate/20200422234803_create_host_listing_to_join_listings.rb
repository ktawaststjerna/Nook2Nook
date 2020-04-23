class CreateHostListingToJoinListings < ActiveRecord::Migration[6.0]
  def change
    create_table :host_listing_to_join_listings, id: :uuid do |t|
      t.uuid :host_listing_id
      t.uuid :join_listing_id

      t.timestamps
    end
  end
end

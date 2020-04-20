pp 'Creating Users'
User.create

pp 'Creating Listings'
Listing.create(user_id: User.first.id)

pp 'Creating Items'
Item.create(listing_id: Listing.first.id)
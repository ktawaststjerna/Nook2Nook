pp 'Creating Users'
User.create!

pp 'Creating Listings'
Listing.create!(user_id: User.first.id)

pp 'Creating Items'
Item.create!(listing_id: Listing.first.id)

pp 'Creating Queue'
QueueList.create!(listing_id: Listing.first.id)

pp 'Creating Queue List to User'
QueueListToUser.create!(user_id: User.first.id, queue_list_id: QueueList.first.id)
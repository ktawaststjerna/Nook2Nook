pp 'Creating Users'
User.create!(email: 'first@gmail.com', dodo_code: '12345', island_name: 'Barovia', character_name: 'first')
User.create!(email: 'second@gmail.com', dodo_code: '12345', island_name: 'Barovia', character_name: 'second')

pp 'Creating Item (turnip)'
Item.create!(name: 'turnip')

pp 'Creating Listings, Queue gets created with appropriate listings'
pp 'Not Hosting Not Selling'
Listing.create_not_hosting_not_selling!(User.first.id, Item.first.id, 0, 99999)

pp 'Not Hosting Selling'
Listing.create_not_hosting_selling!(User.first.id, Item.first.id, 0, 99999)

pp 'Hosting Not Selling'
Listing.create_hosting_not_selling!(User.first.id, Item.first.id, 500, 200, 4, DateTime.now - 1.days, DateTime.now + 1.days)

pp 'Hosting Selling'
Listing.create_hosting_selling!(User.first.id, Item.first.id, 500, 200, 4, DateTime.now - 1.days, DateTime.now + 1.days)
pp 'Adding not_hosting/selling listings to this hosting/selling listing'
Listing.last.queue_list.join_queue(User.last.id)
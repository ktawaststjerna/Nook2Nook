pp 'Creating Users'
10.times do |x|
  User.create!(email: "#{x}-email@gmail.com", dodo_code: "----#{x}", island_name: "Barovia-#{x}", character_name: "name-#{x}")
end

pp 'Creating Item (turnip)'
Item.create!(name: 'Turnip')

pp 'Creating Listings, Queue gets created with appropriate listings'
pp 'Not Hosting Not Selling'
Listing.create_not_hosting_not_selling!(User.all[0].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_not_hosting_not_selling!(User.all[1].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_not_hosting_not_selling!(User.all[2].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)

pp 'Not Hosting Selling'
Listing.create_not_hosting_selling!(User.all[3].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_not_hosting_selling!(User.all[4].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_not_hosting_selling!(User.all[5].id, Item.first.id, rand(0..4999), rand(5000..10000), DateTime.now - 1.days, DateTime.now + 1.days)

pp 'Hosting Not Selling'
Listing.create_hosting_not_selling!(User.all[6].id, Item.first.id, rand(20..90), rand(100..200), rand(2..4), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_hosting_not_selling!(User.all[7].id, Item.first.id, rand(20..90), rand(100..200), rand(2..4), DateTime.now - 1.days, DateTime.now + 1.days)

pp 'Hosting Selling'
Listing.create_hosting_selling!(User.all[8].id, Item.first.id, rand(200..500), rand(100..200), rand(2..4), DateTime.now - 1.days, DateTime.now + 1.days)
Listing.create_hosting_selling!(User.all[9].id, Item.first.id, rand(200..500), rand(100..200), rand(2..4), DateTime.now - 1.days, DateTime.now + 1.days)

pp 'Adding not_hosting/selling listings to this hosting/selling listing'
Listing.hosting_not_selling.last.queue_list.join_queue(User.all[0].id)
Listing.hosting_not_selling.last.queue_list.join_queue(User.all[1].id)
Listing.hosting_not_selling.last.queue_list.join_queue(User.all[2].id)
Listing.hosting_not_selling.last.queue_list.join_queue(User.all[3].id)

pp 'Adding not_hosting/selling listings to this hosting/selling listing'
Listing.hosting_selling.last.queue_list.join_queue(User.all[4].id)
Listing.hosting_selling.last.queue_list.join_queue(User.all[5].id)
Listing.hosting_selling.last.queue_list.join_queue(User.all[6].id)
Listing.hosting_selling.last.queue_list.join_queue(User.all[7].id)

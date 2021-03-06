pp 'Creating Users'
1000.times do |x|
  User.create!(email: "#{x}-email@gmail.com", island_name: "Barovia-#{x}", character_name: "name-#{x}", password: 'test123')
end

pp 'Creating Item (turnip)'
Item.create!(name: 'Turnip')

pp 'Creating Host Listings'
100.times do |x|
  HostListing.create!(user_id: User.all.sample.id, dodo_code: "dodo-#{x}", item_id: Item.first.id, selling: [true, false].sample, amount: 500, start_date: DateTime.now - 6.hours, end_date: DateTime.now + 6.hours, max_users: 200, allowed_users: 4)
end

pp 'Creating Join Listings'
1000.times do |x|
  join_listing = JoinListing.create!(user_id: User.all.sample.id, item_id: Item.first.id, selling: [true, false].sample, amount_min: 0, amount_max: 1000, start_date: DateTime.now - 6.hours, end_date: DateTime.now + 6.hours)
end
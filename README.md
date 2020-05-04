TODO:
~~Update Dodo code to be on host listing, not user account~~
~~Make dashboard half join listing half host listings~~
~~Make host listing show, index, create, update with updated front-end~~
~~Make host listing show, index, create, update with updated front-end~~
~~Make login ith updated front-end~~
~~Make sign-up with updated front-end~~
~~Make logged in users auto go to dashboard~~
~~Icon on title bar thing~~

1) I want to BUY from Daisy on someone elses island
2) I want to SELL to Tom Nook on someone elses island
3) I want PEOPLE to BUY from Daisy
4) I want PEOPLE to SELL to Tom Nook

In table type of listing the booleans are as follows for the previous sentences

| Question | Hosting | Selling |
|----------|---------|---------|
| 1        | false   | false   |
| 2        | false   | true    |
| 3        | true    | false   |
| 4        | true    | true    |


To reset processed jobs:
and to reset failed jobs:
Clear queue

Sidekiq.redis {|c| c.del('stat:processed') }
Sidekiq.redis {|c| c.del('stat:failed') }
Sidekiq::Queue.all.each(&:clear)


dashboard archive

<p id="notice"><%= notice %></p>

<h1>Host Listings</h1>

<table>
  <thead>
    <tr>
      <th>User</th>
      <th>Item</th>
      <th>Selling</th>
      <th>Amount</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Max users</th>
      <th>Allowed users</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @host_listings.each do |host_listing| %>
      <tr>
        <td><%= host_listing.user_id %></td>
        <td><%= host_listing.item_id %></td>
        <td><%= host_listing.selling %></td>
        <td><%= host_listing.amount %></td>
        <td><%= host_listing.start_date %></td>
        <td><%= host_listing.end_date %></td>
        <td><%= "#{host_listing.total_join_listings_in_queue.count} / #{host_listing.max_users}" %></td>
        <td><%= "#{host_listing.currently_on_island.size} / #{host_listing.allowed_users}" %></td>
        <td><%= link_to 'Show', host_listing %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>
# Description
This project is an automated service for buying and selling Turnips in the game Animal Crossing: New Horizons. The website acts as an auction house that automates finding buyers and sellers of Turnips for the "stalk" market.

See https://animalcrossing.fandom.com/wiki/White_turnip on what turnips are. But essentially they are items you buy at a given price and sell at a given price, think the "stalk" market.

# Tech
* Ruby on Rails
* Docker & Docker Compose
* Sidekiq
* Yarn
* Sendgrid API
* PostgreSQL

# How to Run Project
All you need is docker. Once you have the containers running you can get everything sorted and running.

The docker containers

1) Run `docker ps` in your console to see if docker is running correctly
2) Create an `.env` file. See ENV section below with ENV fields required in the field. If no `.env` file is created, the docker run command will fail.
3) In your console in the projects main folder run `docker-compose build` to build the docker image.
4) Run `docker-compose run --service-ports animal-crossing-market bash` to start the docker container. This will execute bash inside of the container, allowing you to interact with the system inside the container.
5) Once inside the container you may need to call `yarn install --check-files` to install new yarn packages. If you do, you'll see an error in the next step to do so...
6) Once inside container (running bash). Call `rails db:create db:schema:load db:seed`. You might be able to do a `rails db:setup` but I haven't tested it.
7) Once the system is seeded, run `puma` to turn on the server and go to `localhost:3000` in your browser to access the auction house. See the `seed.rd` file for username and passwords for development users.
8) To get the jobs running and automating the auction house, run `bundle exec sidekiq` inside the container. This will run sidekiq in the background. You can access the webapp for sidekiq at `localhost:3000/sidekiq`.
# ENV
```
POSTGRES_PASSWORD=YOURSTOMAKEUP
SENDGRID_API_KEY=MUSTASKMEFORTHISIFYOUWOULDLIKETOTEST
DOMAIN= (development = localhost:3000)
```

# Logic Breakdown
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


# Sidekiq Commands
## To reset processed jobs and to reset failed jobs:
Clear queue

`Sidekiq.redis {|c| c.del('stat:processed') }`

`Sidekiq.redis {|c| c.del('stat:failed') }`

`Sidekiq::Queue.all.each(&:clear)`

# Some Useful Links
https://bootstrapmade.com/demo/Vesperr/
https://www.vecteezy.com/

# TODO:
* ~~Update Dodo code to be on host listing, not user account~~
* ~~Make dashboard half join listing half host listings~~
* ~~Make host listing show, index, create, update with updated front-end~~
* ~~Make host listing show, index, create, update with updated front-end~~
* ~~Make login ith updated front-end~~
* ~~Make sign-up with updated front-end~~
* ~~Make logged in users auto go to dashboard~~
* ~~Icon on title bar thing~~
* Create staging server

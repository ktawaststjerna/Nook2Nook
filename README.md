TODO:
~~Update Dodo code to be on host listing, not user account~~
~~Make dashboard half join listing half host listings~~
~~Make host listing show, index, create, update with updated front-end~~
~~Make host listing show, index, create, update with updated front-end~~
~~Make login ith updated front-end~~
~~Make sign-up with updated front-end~~
~~Make logged in users auto go to dashboard~~
~~Icon on title bar thing~~
Fix jobs
Create digital ocean server

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

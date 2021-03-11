# README

test app

### Requirements:
Implement new feature to send due date reminder emails to the users based on 
their profile configuration.

### Running app:
- `bundle install`
- `rails db:migrate`
- `rails s`

### Running Tests
- Individual test files: `ruby -I test path/to/testfile.rb`
- All test suite: `rake test`

### dependencies:
[Redis](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04#step-1-%E2%80%94-installing-and-configuring-redis)

### Endpoints
```bash
              Prefix Verb   URI Pattern                                                                              Controller#Action
user_ticket_reminders GET    /users/:user_id/tickets/:ticket_id/reminders(.:format)                                   reminders#index
                      POST   /users/:user_id/tickets/:ticket_id/reminders(.:format)                                   reminders#create
  user_ticket_reminder GET    /users/:user_id/tickets/:ticket_id/reminders/:id(.:format)                               reminders#show
                      PATCH  /users/:user_id/tickets/:ticket_id/reminders/:id(.:format)                               reminders#update
                      PUT    /users/:user_id/tickets/:ticket_id/reminders/:id(.:format)                               reminders#update
                      DELETE /users/:user_id/tickets/:ticket_id/reminders/:id(.:format)                               reminders#destroy
          user_tickets GET    /users/:user_id/tickets(.:format)                                                        tickets#index
                      POST   /users/:user_id/tickets(.:format)                                                        tickets#create
          user_ticket GET    /users/:user_id/tickets/:id(.:format)                                                    tickets#show
                      PATCH  /users/:user_id/tickets/:id(.:format)                                                    tickets#update
                      PUT    /users/:user_id/tickets/:id(.:format)                                                    tickets#update
                      DELETE /users/:user_id/tickets/:id(.:format)                                                    tickets#destroy
                users GET    /users(.:format)                                                                         users#index
                      POST   /users(.:format)                                                                         users#create
                  user GET    /users/:id(.:format)                                                                     users#show
                      PATCH  /users/:id(.:format)                                                                     users#update
                      PUT    /users/:id(.:format)                                                                     users#update
                      DELETE /users/:id(.:format)                                                                     users#destroy
```

### Sidekiq
to view sidekiq jobs after running `rails s` visit: http://localhost:3000/sidekiq.